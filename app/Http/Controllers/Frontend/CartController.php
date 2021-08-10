<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductBid;
use App\Models\ProductWiseBid;
use Illuminate\Http\Request;
use Psy\Util\Str;
use Carbon\Carbon;

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

    public function bidProductCartAdd(Request $request){
        $user_id = \Auth::check();
        if(empty($request->id) || empty($request->amount || empty($user_id)) ){
            return 'false';
            eixt();
        }

        $product = Product::find($request->id);
        $user_id = \Auth::user()->id;

        if($product->starting_bid_amount > $request->amount)
            return 'blnc_less';

        if($product){
            $from = date("Y-m-d", strtotime($product->auction_start_date)).' '.date("H:i:s", strtotime($product->auction_start_time));
            $to = date("Y-m-d", strtotime($product->auction_end_date)).' '.date("H:i:s", strtotime($product->auction_end_time));

            $check_existing = ProductWiseBid::where('product_id', $product->id);
            $check_existing->where(function($query) use($from, $to){
                $query->whereBetween('auction_start_date',  [$from, $to]);
                $query->orWhereBetween('auction_end_date_time',  [$from, $to]);
            });
            $check_existing = $check_existing->first();

            $product_upd = ProductBid::firstOrNew(
                ['product_id' =>  $request->id, 'user_id' => $user_id]
            );
            $product_upd->product_id = $request->id;
            $product_upd->user_id = $user_id;
            $product_upd->bid_amount = $request->amount;
            $product_upd->bid_end_date = $product->auction_end_date;
            $product_upd->bid_end_time = $product->auction_end_time;
            $product_upd->product_wise_bid_id = $check_existing->id;
            if($product_upd->save()){
                $max_bidder_info = ProductBid::where('product_wise_bid_id', $check_existing->id)
                                                ->orderBy('bid_amount', 'DESC')
                                                ->first();
                if($max_bidder_info){
                    $update_pro_ws_bid = ProductWiseBid::find($check_existing->id);
                    if($update_pro_ws_bid->height_bider_id != $max_bidder_info->user_id || $update_pro_ws_bid->height_bid_amount != $max_bidder_info->bid_amount){
                        $update_pro_ws_bid->height_bider_id = $user_id;
                        $update_pro_ws_bid->height_bid_amount = $max_bidder_info->bid_amount;
                        $update_pro_ws_bid->save();
                    }

                }
            }

            return 'true';
        }else{
            return 'false';
        }
    }

    public function bidUserList(Request $request){
        if($request->id){
            $product = Product::find($request->id);

            $from = date("Y-m-d", strtotime($product->auction_start_date)).' '.date("H:i:s", strtotime($product->auction_start_time));
            $to = date("Y-m-d", strtotime($product->auction_end_date)).' '.date("H:i:s", strtotime($product->auction_end_time));

            $check_existing = ProductWiseBid::where('product_id', $product->id);
            $check_existing->where(function($query) use($from, $to){
                $query->whereBetween('auction_start_date',  [$from, $to]);
                $query->orWhereBetween('auction_end_date_time',  [$from, $to]);
            });
            $check_existing = $check_existing->first();

            $product_bid_list = ProductBid::where('product_id', $request->id)
                                            ->where('product_wise_bid_id', $check_existing->id)
                                            ->take(4)
                                            ->orderBy('bid_amount', 'DESC')
                                            ->get();
            $model_title = "Bids For ".$product->name;
            $table_data = view('frontend.ajax_blade.bided-user-list', compact('product_bid_list'))->render();

            return response()->json(['model_title' => $model_title, 'table_data' => $table_data]);
        }else{
            return response()->json(['model_title' => "Something went wrong. Please try again later.", 'table_data' => ""]);
        }

    }
}
