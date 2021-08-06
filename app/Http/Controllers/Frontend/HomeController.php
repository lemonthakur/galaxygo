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
        return view('frontend.orders');
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
}
