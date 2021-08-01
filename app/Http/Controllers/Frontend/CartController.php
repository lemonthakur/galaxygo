<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use Illuminate\Http\Request;
use Psy\Util\Str;

use Cart;

class CartController extends Controller
{
    public function cartAdd(Request $request){

        $items = Cart::content();
        $checkCart = 0;
        $price = $request->price;

        foreach ($items as $item)
        {
            if($item->id == $request->id)
            {
                //Cart::update($item->rowId, $request->quantity);
                Cart::update($item->rowId, [
                    'id' => $request->id,
                    'name' => $request->name,
                    'qty' => $request->quantity,
                    'price' => $price,
                    'weight' => 0,
                    'taxRate' => 0,
                    'discount' => $request->discount,
                    'options' => ['discount' => $request->discount, 'tax' => 0, 'image_name' => $request->img_name, 'slug' => $request->slug, 'add_date_time' => date('Y-m-d h:i:s')]
                ]);
                $checkCart = 1;
            }
        }

        if ($checkCart == 0){
            Cart::add([
                'id' => $request->id,
                'name' => $request->name,
                'qty' => $request->quantity,
                'price' => $price,
                'weight' => 0,
                'taxRate' => 0,
                'discount' => $request->discount,
                'options' => ['discount' => $request->discount, 'tax' => 0, 'image_name' => $request->img_name, 'slug' => $request->slug, 'add_date_time' => date('Y-m-d h:i:s')]
                ]);
        }
        //return view('frontend.ajax.minicart');
    }


    public function removeCart(Request $request){
        $rowId = $request->id;
        Cart::remove($rowId);
        $subtotal = Cart::subtotal();
        return $subtotal;
        //return view('frontend.ajax.minicart');
    }

    public function cartDestroy(){
        Cart::destroy();
    }
}
