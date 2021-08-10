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

class CheckoutController extends Controller
{
    public function register(Request $request){
        if(!\Auth::check()){
            $rules = [
                'payment_method' => 'required',
                'name' => 'required',
                'last_name' => 'required',
                'email' => 'required|email|unique:users',
                'password' => 'required|min:6',
                'confirm_password' => 'required|same:password|min:6',

                'shipping_adrress_line_1' => 'required',
                'shipping_city' => 'required',
                'shipping_country' => 'required',
                'shipping_post_code' => 'required',
                'shipping_phone' => 'required',
            ];

            $message = [
                'name.required' => 'First Name is required',
                'last_name.required' => 'Last Name is required',
                'email.email' => 'Email must be a valid email address',
                'email.required' => 'Email is required',
                'password.required' => 'Password is required',

                'shipping_adrress_line_1.required' => 'Adrress line 1 is required',
                'shipping_city.required' => 'City is required',
                'shipping_country.required' => 'Country is required',
                'shipping_post_code.required' => 'Post Code is required',
                'shipping_phone.required' => 'Phone Number is required',
            ];

            $validation = Validator::make($request->all(),$rules,$message);

            if ($validation->fails()){
                return redirect()->back()
                    ->withInput()
                    ->withErrors($validation);
            }else{
                DB::beginTransaction();
                try {
                    $success = false;

                    $user = new User();
                    $user->role_id = 0;
                    $user->name = $request->name;
                    $user->last_name = $request->last_name;
                    $user->email = $request->email;
                    $user->contact_no = $request->shipping_phone;
                    $user->password = Hash::make($request->password);

                    $user->shipping_first_name      = $request->name;
                    $user->shipping_last_name       = $request->last_name;
                    $user->shipping_email           = $request->email;
                    $user->shipping_company_name    = $request->shipping_company_name;
                    $user->shipping_adrress_line_1  = $request->shipping_adrress_line_1;
                    $user->shipping_adrress_line_2  = $request->shipping_adrress_line_2;
                    $user->shipping_city            = $request->shipping_city;
                    $user->shipping_country         = $request->shipping_country;
                    $user->shipping_post_code       = $request->shipping_post_code;
                    $user->shipping_phone           = $request->shipping_phone;

                    $user->total_coin = $user->total_coin + 100;
                    $user->current_coin = $user->current_coin + 100;

                    if ($user->save()){
                        Auth::loginUsingId($user->id);

                        $coinHistory = new CoinHistory();
                        $coinHistory->user_id = auth()->id();
                        $coinHistory->amount = 100;
                        $coinHistory->transaction_type = 0;
                        $coinHistory->earn_expense_type = 0;
                        $coinHistory->save();

                        if ($coinHistory->save()){

                            $orderShipping = new OrderShippingAddress();

                            $orderShipping->user_id                  = $user->id;
                            $orderShipping->shipping_first_name      = $request->name;
                            $orderShipping->shipping_last_name       = $request->last_name;
                            $orderShipping->shipping_email           = $request->email;
                            $orderShipping->shipping_company_name    = $request->shipping_company_name;
                            $orderShipping->shipping_adrress_line_1  = $request->shipping_adrress_line_1;
                            $orderShipping->shipping_adrress_line_2  = $request->shipping_adrress_line_2;
                            $orderShipping->shipping_city            = $request->shipping_city;
                            $orderShipping->shipping_country         = $request->shipping_country;
                            $orderShipping->shipping_post_code       = $request->shipping_post_code;
                            $orderShipping->shipping_phone           = $request->shipping_phone;

                            $orderShipping->created_by = Auth::id();
                            $orderShipping->updated_by = Auth::id();
                            $orderShipping->save();
                        }

                        $success = true;
                        Session::put('shippingAddress',[
                            'shipping_address_id' => $orderShipping->id,
                        ]);
                    }

                }catch(ValidationException $e) {

                    DB::rollback();
                    return Redirect::to('/checkout')
                        ->withErrors( $e->getErrors() )
                        ->withInput();
                }catch(\Exception $e)
                {
                    DB::rollback();
                    throw $e;
                }
                DB::commit();

                if ($success){
                    if($request->payment_method==1)
                        return redirect()->route("make.payment");
                    else
                        return redirect()->route("payment");
                }else{
                    session()->flash("error","Unable to register");
                    return redirect()->route("checkout")->withInput();
                }
            }
        }else{
            // in again time
            $rules = [
                'payment_method' => 'required',
                'name' => 'required',
                'last_name' => 'required',
                'email' => 'required|email|unique:users,email,'.Auth::id(),

                'shipping_adrress_line_1' => 'required',
                'shipping_city' => 'required',
                'shipping_country' => 'required',
                'shipping_post_code' => 'required',
                'shipping_phone' => 'required',
            ];

            $message = [
                'name.required' => 'First Name is required',
                'last_name.required' => 'Last Name is required',
                'email.email' => 'Email must be a valid email address',
                'email.required' => 'Email is required',
                'password.required' => 'Password is required',

                'shipping_adrress_line_1.required' => 'Adrress line 1 is required',
                'shipping_city.required' => 'City is required',
                'shipping_country.required' => 'Country is required',
                'shipping_post_code.required' => 'Post Code is required',
                'shipping_phone.required' => 'Phone Number is required',
            ];

            $validation = Validator::make($request->all(),$rules,$message);

            if ($validation->fails()){
                return redirect()->back()
                    ->withInput()
                    ->withErrors($validation);
            }else{
                DB::beginTransaction();
                try {
                    $success = false;

                    $check_existing = OrderShippingAddress::where('shipping_first_name', $request->name)
                                        ->where('shipping_last_name', $request->last_name)
                                        ->where('shipping_email', $request->email)
                                        ->where('shipping_company_name', $request->shipping_company_name)
                                        ->where('shipping_adrress_line_1', $request->shipping_adrress_line_1)
                                        ->where('shipping_adrress_line_2', $request->shipping_adrress_line_2)
                                        ->where('shipping_city', $request->shipping_city)
                                        ->where('shipping_country', $request->shipping_country)
                                        ->where('shipping_post_code', $request->shipping_post_code)
                                        ->where('shipping_phone', $request->shipping_phone)
                                        ->where('user_id', Auth::id())
                                        ->where('created_by', Auth::id())
                                        ->where('updated_by', Auth::id())
                                        ->first();

                    if(!$check_existing){

                        $user = User::find(Auth::id());

                        $user->shipping_first_name      = $request->name;
                        $user->shipping_last_name       = $request->last_name;
                        $user->shipping_email           = $request->email;
                        $user->shipping_company_name    = $request->shipping_company_name;
                        $user->shipping_adrress_line_1  = $request->shipping_adrress_line_1;
                        $user->shipping_adrress_line_2  = $request->shipping_adrress_line_2;
                        $user->shipping_city            = $request->shipping_city;
                        $user->shipping_country         = $request->shipping_country;
                        $user->shipping_post_code       = $request->shipping_post_code;
                        $user->shipping_phone           = $request->shipping_phone;

                        if($user->save()){
                            $orderShipping = new OrderShippingAddress();

                            $orderShipping->user_id                  = $user->id;
                            $orderShipping->shipping_first_name      = $request->name;
                            $orderShipping->shipping_last_name       = $request->last_name;
                            $orderShipping->shipping_email           = $request->email;
                            $orderShipping->shipping_company_name    = $request->shipping_company_name;
                            $orderShipping->shipping_adrress_line_1  = $request->shipping_adrress_line_1;
                            $orderShipping->shipping_adrress_line_2  = $request->shipping_adrress_line_2;
                            $orderShipping->shipping_city            = $request->shipping_city;
                            $orderShipping->shipping_country         = $request->shipping_country;
                            $orderShipping->shipping_post_code       = $request->shipping_post_code;
                            $orderShipping->shipping_phone           = $request->shipping_phone;

                            $orderShipping->created_by = Auth::id();
                            $orderShipping->updated_by = Auth::id();
                            $orderShipping->save();
                        }

                        Session::put('shippingAddress',[
                            'shipping_address_id' => $orderShipping->id,
                        ]);
                    }else{
                        Session::put('shippingAddress',[
                            'shipping_address_id' => $check_existing->id,
                        ]);
                    }

                    $success = true;


                }catch(ValidationException $e) {
                    if(isset($request->bid_checkout) && $request->bid_checkout=='bid_checkout'){
                        DB::rollback();
                        return Redirect::to('/bid-checkout/'.$request->bid_pro_id)
                            ->withErrors( $e->getErrors() )
                            ->withInput();
                    }
                    DB::rollback();
                    return Redirect::to('/checkout')
                        ->withErrors( $e->getErrors() )
                        ->withInput();
                }catch(\Exception $e)
                {
                    DB::rollback();
                    throw $e;
                }
                DB::commit();

                if ($success){
                    if(isset($request->bid_checkout) && $request->bid_checkout=='bid_checkout'){
                        if($request->payment_method==1)
                            return redirect()->route("make.payment", $request->bid_pro_id);
                        else
                            return redirect()->route("bid.payment", $request->bid_pro_id);
                    }
                    if($request->payment_method==1)
                        return redirect()->route("make.payment");
                    else
                        return redirect()->route("payment");
                }else{
                    session()->flash("error","Unable to register");
                    return redirect()->route("checkout")->withInput();
                }
            }
        }
    }

    public function checkout(){
        $countries = Country::all();
//        $countries = Country::whereIn('id', [150, 200]);
        return view('frontend.checkout', compact('countries'));
    }

    public function checkoutpointPayment(Request $request){
        $point_amount = $request->point_amount;

        $deliveryCharge = 0;
        foreach(Cart::content() as $row){
            $deliveryCharge += $row->options->delivery_charge*$row->qty;
        }
        $totla_usd = Cart::subtotal()+$deliveryCharge;
        $totla_to_pay = $totla_usd*100;

        $user_have_point = Auth::user()->current_coin;

        if($totla_to_pay < $point_amount || $totla_to_pay > $user_have_point)
             return response()->json(['payment_error' => 'no', 'point_less' => 'yes', 'order_placed' => 'no']);

        if($point_amount == $totla_to_pay){

            DB::beginTransaction();
            try {

                $success = false;

                $latestOrder = Order::orderBy('created_at','DESC')->first();
                if($latestOrder)
                    $invoice_id = str_pad($latestOrder->id + 1, 8, "0", STR_PAD_LEFT);
                else
                    $invoice_id = str_pad(1, 8, "0", STR_PAD_LEFT);

                $order = new Order();
                $order->user_id                 = auth()->id();
                $order->shipping_address_id     = Session::get('shipping_address_id') ?? 0;
                $order->subtotal = Cart::subtotal();
                $order->discount = Cart::discount();
                $order->vat_tax  = Cart::tax();
                $order->delivery_charge = $deliveryCharge;
                $order->total = Cart::total() + $deliveryCharge;
                $order->payment_type = 'Point';
                $order->tran_id = $invoice_id;
                $order->status = 'Pending';
                $order->created_by = auth()->id();
                $order->updated_by = auth()->id();

                if($order->save()){

                    foreach(Cart::content() as $row){
                        $orderDetails = new OrderDetail();

                        $orderDetails->order_id = $order->id;
                        $orderDetails->user_id = $order->user_id;
                        $orderDetails->product_id = $row->id;
                        $orderDetails->quantity = $row->qty;
                        $orderDetails->price = $row->price;
                        $orderDetails->discount = $row->discount;
                        $orderDetails->vat_tax = $row->tax;
                        $orderDetails->delivery_charge = $row->options->delivery_charge*$row->qty;
                        $orderDetails->total_price = $row->total+$row->options->delivery_charge*$row->qty;
                        $orderDetails->created_by = Auth::id();
                        $orderDetails->updated_by = Auth::id();
                        $orderDetails->save();
                    }

                    $transaction = new Transaction();
                    $transaction->order_id = $order->id;
                    $transaction->correlationid = NULL;
                    $transaction->build = NULL;
                    $transaction->email = NULL;
                    $transaction->payerid = NULL;
                    $transaction->firstname = NULL;
                    $transaction->lastname = NULL;
                    $transaction->currencycode = NULL;
                    $transaction->amount = $totla_usd;
                    $transaction->invoice_no = $invoice_id;
                    $transaction->tran_date = date("Y-m-d h:i:s");
                    $transaction->payment_type = 'Point';
                    $transaction->save();

                    $success = true;
                }

            }catch(ValidationException $e) {
                DB::rollback();
                return Redirect::to('/checkout')
                ->withErrors( $e->getErrors() )
                ->withInput();
            }catch(\Exception $e)
            {
                DB::rollback();
                throw $e;
            }
            DB::commit();

            Cart::destroy();
            session()->flash('order_success','Order placed successfully');
            return response()->json(['point_less' => 'no', 'payment_error' => 'no', 'order_placed' => 'yes']);
            //return redirect()->route('orders');

        }else{
            return response()->json(['point_less' => 'no', 'payment_error' => 'yes', 'order_placed' => 'no']);
        }
    }

    public function checkoutbidpointPayment(Request $request){
        $point_amount = $request->point_amount;
        $id = decrypt($request->auc_bit_id);

        $product_info = ProductWiseBid::find($id);
        if(!$product_info)
            return response()->json(['payment_error' => 'yes', 'point_less' => 'no', 'order_placed' => 'no']);

        $deliveryCharge = $product_info->product_det->deliver_charge;
        $totla_usd = $product_info->height_bid_amount+$deliveryCharge;
        $totla_to_pay = $totla_usd*100;

        $user_have_point = Auth::user()->current_coin;

        if($totla_to_pay < $point_amount || $totla_to_pay > $user_have_point)
            return response()->json(['payment_error' => 'no', 'point_less' => 'yes', 'order_placed' => 'no']);

        if($point_amount == $totla_to_pay){

            DB::beginTransaction();
            try {

                $success = false;

                $latestOrder = Order::orderBy('created_at','DESC')->first();
                if($latestOrder)
                    $invoice_id = str_pad($latestOrder->id + 1, 8, "0", STR_PAD_LEFT);
                else
                    $invoice_id = str_pad(1, 8, "0", STR_PAD_LEFT);

                $order = new Order();
                $order->user_id                 = auth()->id();
                $order->shipping_address_id     = Session::get('shipping_address_id') ?? 0;
                $order->subtotal = $product_info->height_bid_amount;
                $order->discount = 0;
                $order->vat_tax  = 0;
                $order->delivery_charge = $deliveryCharge;
                $order->total = $product_info->height_bid_amount + $deliveryCharge;
                $order->payment_type = 'Point';
                $order->tran_id = $invoice_id;
                $order->order_type = 'auction';
                $order->status = 'Pending';
                $order->created_by = auth()->id();
                $order->updated_by = auth()->id();

                if($order->save()){

                    $orderDetails = new OrderDetail();

                    $orderDetails->order_id = $order->id;
                    $orderDetails->user_id = $order->user_id;
                    $orderDetails->product_id = $product_info->product_id;
                    $orderDetails->product_wise_bid_id = $product_info->id;
                    $orderDetails->quantity = 1;
                    $orderDetails->price = $product_info->height_bid_amount;
                    $orderDetails->discount = 0;
                    $orderDetails->vat_tax = 0;
                    $orderDetails->delivery_charge = $deliveryCharge;
                    $orderDetails->total_price = $product_info->height_bid_amount+$deliveryCharge;
                    $orderDetails->created_by = Auth::id();
                    $orderDetails->updated_by = Auth::id();
                    $orderDetails->save();

                    $transaction = new Transaction();
                    $transaction->order_id = $order->id;
                    $transaction->correlationid = NULL;
                    $transaction->build = NULL;
                    $transaction->email = NULL;
                    $transaction->payerid = NULL;
                    $transaction->firstname = NULL;
                    $transaction->lastname = NULL;
                    $transaction->currencycode = NULL;
                    $transaction->amount = $totla_usd;
                    $transaction->invoice_no = $invoice_id;
                    $transaction->tran_date = date("Y-m-d h:i:s");
                    $transaction->payment_type = 'Point';
                    $transaction->save();

                    $product_info->ordered = 'yes';
                    $product_info->save();

                    $success = true;
                }

            }catch(ValidationException $e) {
                DB::rollback();
                return Redirect::to('/checkout/'.encrypt($id))
                    ->withErrors( $e->getErrors() )
                    ->withInput();
            }catch(\Exception $e)
            {
                DB::rollback();
                throw $e;
            }
            DB::commit();

            session()->flash('order_success','Order placed successfully');
            return response()->json(['point_less' => 'no', 'payment_error' => 'no', 'order_placed' => 'yes']);
            //return redirect()->route('orders');

        }else{
            return response()->json(['point_less' => 'no', 'payment_error' => 'yes', 'order_placed' => 'no']);
        }
    }

}
