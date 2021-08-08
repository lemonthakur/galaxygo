<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class Transaction extends Model
{
    
    /*public function orderDetail() {
        return $this->hasMany(OrderDetail::class,'order_id','id');
    }

    public function orderAddress() {
        return $this->hasOne(OrderShippingAddress::class,'order_id','id');
    }*/
}
