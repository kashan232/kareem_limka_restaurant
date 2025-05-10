<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Customer;
use App\Models\CustomerCredit;
use App\Models\Product;
use App\Models\Purchase;
use App\Models\Sale;
use App\Models\SaleReturn;
use App\Models\Warehouse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Barryvdh\DomPDF\Facade\Pdf; // If using barryvdh/laravel-dompdf
use Illuminate\Support\Facades\DB;

class SaleController extends Controller
{

    public function Sale()
    {
        if (Auth::id()) {
            $userId = Auth::id();
            // dd($userId);
            $Purchases = Purchase::get();
            // dd($Purchases);
            return view('admin_panel.sale.sales', [
                'Purchases' => $Purchases,
            ]);
        } else {
            return redirect()->back();
        }
    }

    public function add_Sale()
    {
        if (Auth::id()) {
            $userId = Auth::id();
            // dd($userId);
            $Customers = Customer::get();
            $Warehouses = Warehouse::get();
            $Category = Category::get();

            // dd($Customers);
            return view('admin_panel.sale.add_sale', [
                'Customers' => $Customers,
                'Warehouses' => $Warehouses,
                'Category' => $Category,
            ]);
        } else {
            return redirect()->back();
        }
    }

    public function getItemsByCategory($categoryId)
    {
        $items = Product::where('category', $categoryId)->get(); // Adjust according to your database structure
        return response()->json($items);
    }


    public function view($id)
    {
        // Fetch the purchase details
        $purchase = Purchase::findOrFail($id);

        // Decode the JSON fields if necessary
        $purchase->item_category = json_decode($purchase->item_category);
        $purchase->item_name = json_decode($purchase->item_name);
        $purchase->quantity = json_decode($purchase->quantity);
        $purchase->price = json_decode($purchase->price);
        $purchase->total = json_decode($purchase->total);

        return view('admin_panel.purchase.view', [
            'purchase' => $purchase,
        ]);
    }

    public function store_Sale(Request $request)
    {
        $invoiceNo = Sale::generateInvoiceNo();
        \Log::info('Request Data:', $request->all());

        $discount = (float)($request->input('discount', 0));
        $totalPrice = (float)$request->input('total_price', 0);
        $cashReceived = (float)$request->input('cash_received', 0);
        $changeToReturn = (float)$request->input('change_to_return', 0);

        \Log::info('Processed Values:', [
            'discount' => $discount,
            'total_price' => $totalPrice,
            'cash_received' => $cashReceived,
            'change_to_return' => $changeToReturn,
        ]);

        $usertype = Auth()->user()->usertype;
        $userId = Auth::id();

        $itemNames = $request->input('item_name', []);
        $itemCategories = $request->input('item_category', []);
        $quantities = $request->input('quantity', []);

        // Prepare data for storage
        $discount = (float) ($request->input('discount', 0));
        $totalPrice = (float) $request->input('total_price', 0);
        $netTotal = $totalPrice - $discount; // Calculate the net total amount

        $previous_balance = $request->input('previous_balance');
        $net_total = $request->input('net_total');
        $closing_balance = $request->input('closing_balance');
        // Step 2: Proceed to save the sale
        $saleData = [
            'userid' => $userId,
            'user_type' => $usertype,
            'invoice_no' => $invoiceNo,
            'customer' => $request->input('customer'),
            'sale_date' => $request->input('sale_date', ''),
            'warehouse_id' => $request->input('warehouse_id', ''),
            'item_category' => json_encode($request->input('item_category', [])),
            'item_name' => json_encode($request->input('item_name', [])),
            'quantity' => json_encode($request->input('quantity', [])),
            'price' => json_encode($request->input('price', [])),
            'total' => json_encode($request->input('total', [])),
            'note' => $request->input('note', ''),
            'total_price' => $totalPrice,
            'discount' => $discount,
            'Payable_amount' => $totalPrice - $discount,
            'cash_received' => $cashReceived,
            'change_return' => $changeToReturn,
        ];

        $sale = Sale::create($saleData);

        return redirect()->route('sale-receipt', [
            'id' => $sale->id,
            'net_total' => $netTotal // Include this if needed
        ])
            ->with('success', 'Sale recorded successfully. Redirecting to receipt...');
    }


    public function all_sales()
    {

        if (Auth::id()) {
            $userId = Auth::id();
            $usertype = Auth()->user()->usertype;

            // Retrieve all Sales with their related Purchase data (including invoice_no)
            $Sales = Sale::where('userid', $userId)->where('user_type', $usertype)->get();
            // dd($Sales);
            return view('admin_panel.sale.sales', [
                'Sales' => $Sales,
            ]);
        } else {
            return redirect()->back();
        }
    }

    public function get_customer_amount($id)
    {
        // Fetch the customer by customer_id (not id)
        $customer = CustomerCredit::where('customerId', $id)->first();

        // Check if the customer record is found
        if (!$customer) {
            return response()->json(['error' => 'Record not found'], 404);
        }

        // Return the previous amount as JSON
        return response()->json([
            'previous_balance' => $customer->previous_balance // Ensure this field exists in your model
        ]);
    }

    public function sale_return(Request $request, $id)
    {
        // Fetch the sale data using the sale ID
        $sale = Sale::findOrFail($id);
        // dd($sale);
        $categories = Category::get();

        // Pass sale data to the receipt view
        return view('admin_panel.sale.sale_return', compact('sale', 'categories'));
    }

    public function store_sale_return(Request $request)
    {
        DB::beginTransaction();
        try {
            $sale = Sale::findOrFail($request->sale_id);
            $action = $request->input('action');

            foreach ($request->item_name as $index => $productName) {
                $product = Product::where('product_name', $productName)->first();
                if (!$product) {
                    return back()->with('error', "Product $productName not found");
                }
                
                if ($action == 'return') {
                    $returnQty = $request->return_quantity[$index];
                    $product->stock += $returnQty; // Add only returned quantity
                    $product->save();
                } elseif ($action == 'exchange') {
                    $exchangeProduct = Product::where('product_name', $request->exchange_product)->first();
                    if (!$exchangeProduct) {
                        return back()->with('error', "Exchange product not found");
                    }
                    $exchangeProduct->stock -= 1; // Deduct exchanged product
                    $exchangeProduct->save();
                }
            }

            SaleReturn::create([
                'sale_id' => $sale->id,
                'customer' => $request->customer,
                'sale_date' => $request->sale_date,
                'action' => $action,
                'deduct_amount' => $request->deduct_amount ?? 0,
                'exchange_product' => $request->exchange_product ?? null,
                'item_category' => json_encode($request->item_category),
                'item_name' => json_encode($request->item_name),
                'quantity' => json_encode($request->quantity),
                'return_quantity' => json_encode($request->return_quantity), // Store return qty
                'price' => json_encode($request->price),
                'total' => json_encode($request->return_total), // Use return_total instead of total
            ]);

            DB::commit();
            return back()->with('success', 'Sale return processed successfully');
        } catch (\Exception $e) {
            DB::rollBack();
            return back()->with('error', $e->getMessage());
        }
    }

    public function downloadInvoice($id)
    {
        // Fetch the sale data
        $sale = Sale::findOrFail($id);

        // Fetch the customer information based on the customer name in the sale
        $customer = Customer::where('customer_name', $sale->customer)->first();

        // If customer is not found, handle the case (optional)
        if (!$customer) {
            abort(404, 'Customer not found for this sale.');
        }

        // Load the view and pass both sale and customer data
        $pdf = Pdf::loadView('admin_panel.invoices.invoice', ['sale' => $sale, 'customer' => $customer]);

        // Download the PDF file
        return $pdf->download('invoice-' . $sale->invoice_no . '.pdf');
    }

    public function showReceipt(Request $request, $id)
    {
        // dd($request);
        // Fetch the sale data using the sale ID
        $sale = Sale::findOrFail($id);
        // Pass sale data to the receipt view
        return view('admin_panel.sale.receipt', compact('sale'));
    }

    public function all_sales_return()
    {

        if (Auth::id()) {
            $userId = Auth::id();
            $usertype = Auth()->user()->usertype;

            // Retrieve all Sales with their related Purchase data (including invoice_no)
            $SaleReturns = SaleReturn::get();
            return view('admin_panel.sale.all_sales_return', [
                'SaleReturns' => $SaleReturns,
            ]);
        } else {
            return redirect()->back();
        }
    }
}
