<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function home(){
        return view('frontend.home');
    }

    public function todayTomorrow(){
        return view('frontend.today-tomorrow');
    }

    public function startContest(){
        return view('frontend.start-contest');
    }

    public function entries(){
        return view('frontend.entries');
    }

    public function shop(){
        return view('frontend.shop');
    }

    public function productDetails(){
        return view('frontend.product-details');
    }

    public function orders(){
        $bid_applies = \App\Models\ProductWiseBid::
            join('product_bids', 'product_wise_bids.id', '=', 'product_bids.product_wise_bid_id')
            ->join('products', 'products.id', '=', 'product_wise_bids.product_id')
            ->join('users', 'users.id', '=', 'product_bids.user_id')
            ->select("products.name as product_name"
                , "product_wise_bids.product_id as product_id"
                , "product_wise_bids.starting_bid_amount as pwb_starting_bid_amount"
                , "product_wise_bids.auction_start_date as pwb_auction_start_date"
                , "product_wise_bids.auction_start_time as pwb_auction_start_time"
                , "product_wise_bids.auction_end_date as pwb_auction_end_date"
                , "product_wise_bids.auction_end_time as pwb_auction_end_time"
                , "product_wise_bids.auction_start_date_time as pwb_auction_start_date_time"
                , "product_wise_bids.auction_end_date_time as pwb_auction_end_date_time"
                , "product_wise_bids.height_bider_id as pwb_height_bider_id"
                , "product_wise_bids.height_bid_amount as pwb_height_bid_amount"
                , "product_wise_bids.allow_to_user as pwb_allow_to_user"
                , "product_wise_bids.provied_to_user as pwb_provied_to_user"
                , "product_wise_bids.ordered as pwb_ordered"
                , "product_wise_bids.id as id"
                , "product_bids.bid_amount as user_bid_amount"
                , "product_bids.created_at as user_bid_date"
            )
            ->where('product_bids.user_id', \Auth::id())
            ->orderBy('product_wise_bids.auction_end_date_time', 'ASC')
            ->get(); //dd($bid_applies);
        return view('frontend.orders', compact('bid_applies'));
    }

    public function profile(){
        return view('frontend.profile');
    }

    public function cart(){
        return view('frontend.cart');
    }

    public function checkout(){
        return view('frontend.checkout');
    }

    public function payment(){
        return view('frontend.payment');
    }

    public function bidpayment($id){
        $id = decrypt($id);
        $product_info = \App\Models\ProductWiseBid::find($id);
        return view('frontend.bid-payment', compact('product_info'));
    }
}
