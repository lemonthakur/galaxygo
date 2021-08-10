<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class ProductWiseBid extends Model
{
    public $timestamps = false;

    public function bid_this_auction() {
        return $this->hasMany(ProductBid::class, 'product_wise_bid_id','id');
    }

}
