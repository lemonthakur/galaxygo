<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class OrderShippingAddress extends Model
{
    public function user() {
        return $this->belongsTo(User::class);
    }

    public function country_name()
    {
        return $this->belongsTo(Country::class, 'shipping_country');
    }

    public function user_inf()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    
}
