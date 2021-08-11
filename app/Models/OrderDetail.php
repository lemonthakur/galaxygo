<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class OrderDetail extends Model
{
    public function product_det()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
