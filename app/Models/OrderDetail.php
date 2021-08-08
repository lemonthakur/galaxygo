<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class OrderDetail extends Model
{
    /*public function product() {
        return $this->belongsTo(Product::class);
    }

    public function orderInfo(){
        return $this->belongsTo(Order::class, 'order_id');
    }*/
}
