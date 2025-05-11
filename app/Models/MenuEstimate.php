<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MenuEstimate extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $guarded = [];

    public function categories()
    {
        $categoryIds = json_decode($this->item_category, true);
        return Category::whereIn('id', $categoryIds)->pluck('category')->toArray();
    }
}
