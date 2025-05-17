<?php
namespace App\Http\Controllers;

use App\Models\RestaurantTable;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TableController extends Controller
{
    public function index()
    {
        $tables = RestaurantTable::orderBy('id', 'desc')->get();
        $nextTableNo = RestaurantTable::max('table_no') + 1;
    
        return view('admin_panel.table.index', compact('tables', 'nextTableNo'));
    }
    
    public function testing()
    {
       
    
        return view('admin_panel.table.testing',);
    }
    
    


    public function store(Request $request)
{
    $admin_id = Auth::id();
    $last = RestaurantTable::orderBy('id', 'desc')->first();
    $next_no = $last ? str_pad((int)substr($last->table_no, -3) + 1, 3, '0', STR_PAD_LEFT) : '001';

    $table_name = $request->input('table_name'); // Capture the table name from the form

    RestaurantTable::create([
        'admin_id' => $admin_id,
        'table_no' => $next_no,
        'table_name' => $table_name, // Store the table name
    ]);

    return redirect()->back()->with('success', 'Table Added Successfully');
}

    public function update(Request $request)
{
    $request->validate([
        'id' => 'required|exists:restaurant_tables,id',
        'table_no' => 'required',
        'table_name' => 'required',
    ]);

    $table = RestaurantTable::find($request->id);
    $table->table_no = $request->table_no;
    $table->table_name = $request->table_name;
    $table->save();

    return redirect()->back()->with('success', 'Table updated successfully!');
}

}
