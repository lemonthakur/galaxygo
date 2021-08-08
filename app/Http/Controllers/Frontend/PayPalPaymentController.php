<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Transaction;
use Srmklive\PayPal\Services\ExpressCheckout;
use Cart;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class PayPalPaymentController extends Controller
{
    public function handlePayment()
    {
        $product = [];
        foreach(Cart::content() as $row){
            $product['items'][] = 
                [
                    'name' => $row->name,
                    'price' => $row->price,
                    'desc'  => $row->name,
                    'qty' => $row->qty
                    
                ];
        }
        /*$product['items'] = [
            [
                'name' => 'Nike Joyride 2',
                'price' => 112,
                'desc'  => 'Running shoes for Men',
                'qty' => 2
            ]
        ];*/

        $latestOrder = Order::orderBy('created_at','DESC')->first();
        if($latestOrder)
            $invoice_id = str_pad($latestOrder->id + 1, 8, "0", STR_PAD_LEFT);
        else
            $invoice_id = str_pad(1, 8, "0", STR_PAD_LEFT);
  
        $product['invoice_id'] = $invoice_id;
        $product['invoice_description'] = "Order #{$product['invoice_id']} Bill";
        $product['return_url'] = route('success.payment');
        $product['cancel_url'] = route('cancel.payment');
        $product['total'] = Cart::subtotal();
  
        $paypalModule = new ExpressCheckout;
  
        $res = $paypalModule->setExpressCheckout($product);
        $res = $paypalModule->setExpressCheckout($product, true);

        return redirect($res['paypal_link']);
    }
   
    public function paymentCancel()
    {

        session()->flash('order_error','Order can not placed.');
        return redirect()->route('checkout');
        //dd('Your payment has been declend. The payment cancelation page goes here!');
    }
  
    public function paymentSuccess(Request $request)
    {
        $paypalModule = new ExpressCheckout;
        $response = $paypalModule->getExpressCheckoutDetails($request->token);
  
        if (in_array(strtoupper($response['ACK']), ['SUCCESS', 'SUCCESSWITHWARNING'])) {

            ///////////////////////////////////////////////////////////
            DB::beginTransaction();
            try {
                $deliveryCharge = 0;
                $success = false;

                $order = new Order();
                $order->user_id                 = auth()->id();
                $order->shipping_address_id     = Session::get('shipping_address_id') ?? 0;
                $order->subtotal = Cart::subtotal();
                $order->discount = Cart::discount();
                $order->vat_tax  = Cart::tax();
                $order->delivery_charge = $deliveryCharge;
                $order->total = Cart::total() + $deliveryCharge;
                $order->payment_type = 'PayPal';
                $order->tran_id = $response['INVNUM'];
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
                    $transaction->correlationid = $response['CORRELATIONID'];
                    $transaction->build = $response['BUILD'];
                    $transaction->email = $response['EMAIL'];
                    $transaction->payerid = $response['PAYERID'];
                    $transaction->firstname = $response['FIRSTNAME'];
                    $transaction->lastname = $response['LASTNAME'];
                    $transaction->currencycode = $response['CURRENCYCODE'];
                    $transaction->amount = $response['AMT'];
                    $transaction->invoice_no = $response['INVNUM'];
                    $transaction->tran_date = date("Y-m-d h:i:s", strtotime($response['TIMESTAMP']));
                    $transaction->payment_type = 'PayPal';
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
            return redirect()->route('orders');
            ///////////////////////////////////////////////////////////
        }
  
        session()->flash('order_error','Order can not placed.');
        return redirect()->route('checkout');
    }
}
