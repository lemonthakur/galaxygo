<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Psy\Util\Str;


use Cart;

class ShoppingCartController extends Controller
{
    public function cart(Request $request)
    {
        return view('frontend.cart');
    }

    public function cartUpdate(Request $request){
        if(Cart::count() > 0){
            for ($i=0; count($request->upd_id) > $i; $i++){
                Cart::update($request->upd_id[$i], $request->qty[$i]);
            }
        }
        $subtotal = Cart::subtotal();
        return $subtotal;
    }
}
