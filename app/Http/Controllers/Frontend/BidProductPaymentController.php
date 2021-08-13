<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\OrderShippingAddress;
use App\Models\Country;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Transaction;
use App\Models\CoinHistory;
use App\Models\ProductWiseBid;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Laravel\Socialite\Facades\Socialite;
use Cart;
use DB;

class BidProductPaymentController extends Controller
{

    public function bidcheckout($id){
        $countries = Country::all();
        $id = decrypt($id);
        $product_info = ProductWiseBid::find($id);
        return view('frontend.bid-checkout', compact('countries', 'product_info'));
    }

}
