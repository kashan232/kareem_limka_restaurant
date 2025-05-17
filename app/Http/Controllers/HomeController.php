<?php

namespace App\Http\Controllers;

use App\Models\AccountantLedger;
use App\Models\Category;
use App\Models\Customer;
use App\Models\Product;
use App\Models\RestaurantTable;
use App\Models\Subcategory;
use App\Models\Unit;
use App\Models\Warehouse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;


class HomeController extends Controller
{

    public function welcome(Request $request)
    {

        return view('welcome');
    }

    public function home()
    {
        if (Auth::id()) {
            $usertype = Auth()->user()->usertype;

            if ($usertype == 'staff') {
                $Customers = Customer::get();
                $Warehouses = Warehouse::get();
                $Category = Category::get();
                $Units = Unit::get();
                $tables = RestaurantTable::get();
                $AllProducts = Product::select('id', 'name as product_name', 'price as retail_price', 'image')->get();

                return view('user_panel.user_dashboard', compact('Customers', 'Warehouses', 'Category', 'AllProducts', 'tables', 'Units'));
            } else if ($usertype == 'admin') {
                $userId = Auth::id();
                $totalPurchasesPrice = \App\Models\Purchase::sum('total_price');
                $totalPurchaseReturnsPrice = \App\Models\PurchaseReturn::sum('total_price');
                // Fetch all products for the logged-in admin
                // $all_product = Product::where('admin_or_user_id', '=', $userId)->get();
                $all_product = Product::get();

                // Calculate total stock value for all products
                $totalStockValue = $all_product->sum(function ($product) {
                    return $product->stock * $product->wholesale_price;
                });


                // Calculate total stock value for each product
                foreach ($all_product as $product) {
                    $product->total_stock_value = $product->stock * $product->wholesale_price;
                }


                $categories = DB::table('categories')->count();
                $subcategories = DB::table('subcategories')->count();
                $products = DB::table('products')->count();
                $suppliers = DB::table('suppliers')->count();
                $customers = DB::table('customers')->count();
                $totalsales = DB::table('sales')->sum('Payable_amount');

                // $lowStockProducts = Product::whereRaw('CAST(stock AS UNSIGNED) <= CAST(alert_quantity AS UNSIGNED)')->get();
                // dd($lowStockProducts);
                return view('admin_panel.admin_dashboard', compact('totalPurchasesPrice', 'subcategories', 'totalPurchaseReturnsPrice', 'all_product', 'totalStockValue', 'categories', 'products', 'suppliers', 'customers', 'totalsales'));
            }
        } else {
            return Redirect()->route('login');
        }
    }

    public function adminpage()
    {
        return view('admin_panel.admin_page');
    }

    public function dashboard()
    {
        return view('admin_panel.dashboard');
    }

    public function Admin_Change_Password()
    {
        if (Auth::id()) {
            $userId = Auth::id();
            return view('admin_panel.change_password', []);
        } else {
            return redirect()->back();
        }
    }

    public function updte_change_Password(Request $request)
    {
        if (!Auth::check()) {
            return redirect()->back()->withErrors(['error' => 'User not authenticated']);
        }

        // Validate input
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required|min:8',
            'retype_new_password' => 'required|same:new_password',
        ]);

        $user = Auth::user();

        // Ensure only admin can change password
        if ($user->usertype !== 'admin') {
            return redirect()->back()->withErrors(['error' => 'Unauthorized action']);
        }

        // Verify old password
        if (!Hash::check($request->old_password, $user->password)) {
            return redirect()->back()->withErrors(['old_password' => 'Old password is incorrect']);
        }

        // Update password
        $user->password = Hash::make($request->new_password);
        $user->save();

        // Flash success message
        return redirect()->back()->with('success', 'Password changed successfully');
    }

    public function get_pos_products(Request $request)
    {
        $categoryId = $request->input('category_id');
        $unit = $request->input('unit');

        $query = Product::query();

        if ($categoryId) {
            $query->where('category_id', $categoryId);
        }

        if ($unit) {
            $query->where('unit_id', $unit);
        }

        $products = $query->get();

        return response()->json($products);
    }
}
