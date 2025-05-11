<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Category;
use App\Models\SubCategory;
class Product extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $guarded = [];

    public function warehouseStock()
    {
        return $this->hasMany(WarehouseProductStock::class, 'product_name', 'product_name');
    }
    // app/Models/Product.php

        public function category()
        {
            return $this->belongsTo(Category::class, 'category_id');
        }

        public function subcategory()
        {
            return $this->belongsTo(SubCategory::class, 'subcategory_id');
        }
}
