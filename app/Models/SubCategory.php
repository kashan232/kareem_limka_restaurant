<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;
    use HasFactory;
    protected $guarded = [];
    protected $table = 'sub_categories';
    // protected $table = 'subcategories';
    public function products()
    {
        return $this->hasMany(Product::class, 'subcategory_id');
    }
    
    public function category()
{
    return $this->belongsTo(Category::class);
}

}

