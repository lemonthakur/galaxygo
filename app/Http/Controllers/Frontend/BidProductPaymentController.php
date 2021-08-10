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

    

    public function checkoutpointPayment(Request $request){
        $point_amount = $request->point_amount;

        $deliveryCharge = 60;
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
                        $orderDetails->total_price = $row->total;
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

}
