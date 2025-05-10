<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use App\Models\Category;
use App\Models\Product;
use App\Models\Unit;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    public function all_product()
    {
        if (Auth::id()) {
            $userId = Auth::id();
            // $all_unit = Unit::where('admin_or_user_id', '=', $userId)->get();
            $all_product = Product::where('admin_or_user_id', '=', $userId)->get();
            return view('admin_panel.product.all_product', [
                // 'all_unit' => $all_unit
                'all_product' => $all_product,
            ]);
        } else {
            return redirect()->back();
        }
    }
    public function add_product()
    {
        if (Auth::id()) {
            $userId = Auth::id();
            $all_category = Category::where('admin_or_user_id', '=', $userId)->get();
            $all_brand = Brand::where('admin_or_user_id', '=', $userId)->get();
            $all_unit = Unit::where('admin_or_user_id', '=', $userId)->get();

            return view('admin_panel.product.add_product', [
                'all_category' => $all_category,
                'all_brand' => $all_brand,
                'all_unit' => $all_unit,

            ]);
        } else {
            return redirect()->back();
        }
    }
    public function store_product(Request $request)
    {
        if (Auth::id()) {
            $usertype = Auth()->user()->usertype;
            $userId = Auth::id();


            // Create the product with or without the image
            Product::create([
                'admin_or_user_id' => $userId,
                'product_name'     => $request->product_name,
                'category'         => $request->category,
                'brand'            => $request->brand,
                'retail_price'            => $request->retail_price,
                'unit'             => $request->unit,
                'created_at'       => Carbon::now(),
                'updated_at'       => Carbon::now(),
            ]);

            return redirect()->back()->with('success', 'Product Added Successfully');
        } else {
            return redirect()->back();
        }
    }
    public function edit_product($id)
    {
        if (Auth::id()) {
            $userId = Auth::id();
            $all_category = Category::where('admin_or_user_id', '=', $userId)->get();
            $all_brand = Brand::where('admin_or_user_id', '=', $userId)->get();
            $all_unit = Unit::where('admin_or_user_id', '=', $userId)->get();
            $product_details = Product::findOrFail($id);
            // dd($product_details);
            return view('admin_panel.product.edit_product', [
                'all_category' => $all_category,
                'all_brand' => $all_brand,
                'all_unit' => $all_unit,
                'product_details' => $product_details,

            ]);
        } else {
            return redirect()->back();
        }
    }

    public function update_product(Request $request, $id)
    {
        if (Auth::id()) {
            $userId = Auth::id();

            // Find the product by ID
            $product = Product::findOrFail($id);


            // Update product details
            $product->product_name   = $request->product_name;
            $product->category       = $request->category;
            $product->brand          = $request->brand;
            $product->unit           = $request->unit;
            $product->retail_price   = $request->retail_price;  // Including retail price update
            $product->updated_at     = Carbon::now();

            // Save updated product
            $product->save();

            return redirect()->route('all-product')->with('success', 'Product updated successfully');
        } else {
            return redirect()->back();
        }
    }

    public function getProductDetails($productName)
    {
        $product = Product::where('product_name', $productName)->first();
        if ($product) {
            return response()->json([
                'retail_price' => $product->retail_price,
                'stock' => $product->stock,
            ]);
        }
        return response()->json(['message' => 'Product not found'], 404);
    }

    public function searchProducts(Request $request)
    {
        $query = $request->get('q');

        // Perform a search based on the product name
        $products = Product::where('product_name', 'like', '%' . $query . '%')
            ->get(['id', 'category', 'product_name', 'retail_price']);

        return response()->json($products);
    }

    public function product_alerts()
    {
        if (Auth::id()) {
            $userId = Auth::id();
            $lowStockProducts = Product::whereRaw('CAST(stock AS UNSIGNED) <= CAST(alert_quantity AS UNSIGNED)')->get();
            // dd($lowStockProducts);
            return view('admin_panel.product.product_alerts', [
                'lowStockProducts' => $lowStockProducts,
            ]);
        } else {
            return redirect()->back();
        }
    }
    public function delete_product(Request $request)
    {
        if (Auth::id()) {
            $product = Product::find($request->id);

            if ($product) {
                $product->delete();
                return response()->json(['success' => true, 'message' => 'Product deleted successfully.']);
            } else {
                return response()->json(['success' => false, 'message' => 'Product not found.']);
            }
        }
        return response()->json(['success' => false, 'message' => 'Unauthorized request.']);
    }
}
