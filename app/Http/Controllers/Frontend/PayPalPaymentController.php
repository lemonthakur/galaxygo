<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\Transaction;
use App\Models\ProductWiseBid;
use Srmklive\PayPal\Services\ExpressCheckout;
use Cart;
use DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Session;

class PayPalPaymentController extends Controller
{
    public function handlePayment($id=null)
    {

        $deliver_charge = 0;
        if(!$id) {
            $product['items'] = [];
            foreach (Cart::content() as $row) {
                $product['items'][] =
                    [
                        'name' => $row->name,
                        'price' => $row->price + ($row->options->delivery_charge),
                        'desc' => $row->name,
                        'qty' => $row->qty

                    ];
                $deliver_charge += $row->options->delivery_charge*$row->qty;
            }

            $latestOrder = Order::orderBy('created_at', 'DESC')->first();
            if ($latestOrder)
                $invoice_id = str_pad($latestOrder->id + 1, 8, "0", STR_PAD_LEFT);
            else
                $invoice_id = str_pad(1, 8, "0", STR_PAD_LEFT);

            $total_amt = Cart::subtotal(2, '.', '') + $deliver_charge;

            $product['invoice_id'] = $invoice_id;
            $product['invoice_description'] = "Order #{$product['invoice_id']} Bill";
            $product['return_url'] = route('success.payment');
            $product['cancel_url'] = route('cancel.payment');
            $product['total'] = $total_amt;
        }else{
            $id = decrypt($id);
            $product_info = ProductWiseBid::find($id);

            $deliver_charge += $product_info->product_det->deliver_charge;
            $product['items'][] =
                [
                    'name' => $product_info->product_det->name,
                    'price' => $product_info->height_bid_amount + $deliver_charge,
                    'desc' => $id,
                    'qty' => 1

                ];


            $latestOrder = Order::orderBy('created_at', 'DESC')->first();
            if ($latestOrder)
                $invoice_id = str_pad($latestOrder->id + 1, 8, "0", STR_PAD_LEFT);
            else
                $invoice_id = str_pad(1, 8, "0", STR_PAD_LEFT);

            $total_amt = $product_info->height_bid_amount + $deliver_charge;

            $product['invoice_id'] = $invoice_id;
            $product['invoice_description'] = "Order #{$product['invoice_id']} Bill";
            $product['return_url'] = route('success.bid.payment');
            $product['cancel_url'] = route('cancel.bid.payment');
            $product['total'] = $total_amt;
        }
  
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
                foreach(Cart::content() as $row){
                    $deliveryCharge += $row->options->delivery_charge*$row->qty;
                }
                $success = false;

                $order = new Order();
                $order->user_id                 = auth()->id();
                $order->shipping_address_id     = Session::get('shippingAddress.shipping_address_id') ?? 0;
                $order->subtotal = Cart::subtotal(2, '.', '');
                $order->discount = Cart::discount(2, '.', '');
                $order->vat_tax  = Cart::tax(2, '.', '');
                $order->delivery_charge = $deliveryCharge;
                $order->total = Cart::total(2, '.', '') + $deliveryCharge;
                $order->payment_type = 'PayPal';
                $order->tran_id = $response['INVNUM'];
                $order->order_type = 'general';
                $order->status = 'Pending';
                $order->created_by = auth()->id();
                $order->updated_by = auth()->id();

                if($order->save()){
                    $total_qty = 0;
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

                        $total_qty += $row->qty;
                    }

                    Order::where('id', $order->id)->update(['total_quantity' => $total_qty]);

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
            return redirect()->route('my.orders');
            ///////////////////////////////////////////////////////////
        }
  
        session()->flash('order_error','Order can not placed.');
        return redirect()->route('checkout');
    }

    public function bidPaymentCancel()
    {

        session()->flash('order_error','Order can not placed.');
        return redirect()->route('my.orders');
        //dd('Your payment has been declend. The payment cancelation page goes here!');
    }

    public function bidPaymentSuccess(Request $request)
    {
        $paypalModule = new ExpressCheckout;
        $response = $paypalModule->getExpressCheckoutDetails($request->token);

        if (in_array(strtoupper($response['ACK']), ['SUCCESS', 'SUCCESSWITHWARNING'])) {

            ///////////////////////////////////////////////////////////
            DB::beginTransaction();
            try {
                $product_info = ProductWiseBid::find($response['L_DESC0']);

                $deliver_charge = $product_info->product_det->deliver_charge;
                $success = false;

                $order = new Order();
                $order->user_id                 = auth()->id();
                $order->shipping_address_id     = Session::get('shippingAddress.shipping_address_id') ?? 0;
                $order->total_quantity = 1;
                $order->subtotal = $product_info->height_bid_amount;
                $order->discount = 0;
                $order->vat_tax  = 0;
                $order->delivery_charge = $deliver_charge;
                $order->total = $product_info->height_bid_amount + $deliver_charge;
                $order->payment_type = 'PayPal';
                $order->tran_id = $response['INVNUM'];
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
                    $orderDetails->delivery_charge = $deliver_charge;
                    $orderDetails->total_price = $product_info->height_bid_amount+$deliver_charge;
                    $orderDetails->created_by = Auth::id();
                    $orderDetails->updated_by = Auth::id();
                    $orderDetails->save();

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

                    $product_info->ordered = 'yes';
                    $product_info->save();

                    $success = true;
                }

            }catch(ValidationException $e) {
                DB::rollback();
                return Redirect::to('/checkout/'.encrypt($response['L_DESC0']))
                    ->withErrors( $e->getErrors() )
                    ->withInput();
            }catch(\Exception $e)
            {
                DB::rollback();
                throw $e;
            }
            DB::commit();

            session()->flash('order_success','Order placed successfully');
            return redirect()->route('my.orders');
            ///////////////////////////////////////////////////////////
        }

        session()->flash('order_error','Order can not placed.');
        return redirect()->route('my.orders');
    }
}
