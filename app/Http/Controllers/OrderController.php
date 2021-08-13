<?php

namespace App\Http\Controllers;

use App\CustomClass\OwnLibrary;
use Illuminate\Database\Eloquent\Model;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\OrderShippingAddress;
use App\Models\Product;
use App\Models\ProductWiseBid;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Redirect;
use Yajra\DataTables\Facades\DataTables;
use DB;

class OrderController extends Controller
{
    private $moduleId = 1;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        OwnLibrary::validateAccess($this->moduleId,1);

        if($request->ajax()){
            $order_no = $request->order_no;
            $order_status = $request->order_status;
            $start_date = $request->start_date;
            $end_date = $request->end_date;

            $orders = Order::whereNotNull('id');
                        if(!empty($order_no)){
                            $orders->where('orders.id','=',$request->order_no);
                        }
                        if(!empty($order_status)){
                            $orders->where('orders.status','=',$request->order_status);
                        }
                        if(!empty($start_date)){
                            $orders->whereDate('orders.created_at', '>=', date('Y-m-d', strtotime($request->start_date)));
                        }
                        if(!empty($end_date)){
                            $orders->whereDate('orders.created_at', '<=', date('Y-m-d', strtotime($request->end_date)));
                        }
            $orders->where('order_type', 'general');
            $orders = $orders->orderBy('id', 'DESC');
            return DataTables::of($orders)
                ->addIndexColumn()
                ->addColumn('actions', 'backend.orders.action')
                ->addColumn('dropdown', 'backend.orders.dropdown')
                ->rawColumns(['actions', 'dropdown'])
                ->make(true);
        }

        return view('backend.orders.index');
    }

    public function auctionsOrders(Request $request)
    {
        OwnLibrary::validateAccess($this->moduleId,1);

        if($request->ajax()){
            $order_no = $request->order_no;
            $order_status = $request->order_status;
            $start_date = $request->start_date;
            $end_date = $request->end_date;

            $orders = Order::whereNotNull('id');
            if(!empty($order_no)){
                $orders->where('orders.id','=',$request->order_no);
            }
            if(!empty($order_status)){
                $orders->where('orders.status','=',$request->order_status);
            }
            if(!empty($start_date)){
                $orders->whereDate('orders.created_at', '>=', date('Y-m-d', strtotime($request->start_date)));
            }
            if(!empty($end_date)){
                $orders->whereDate('orders.created_at', '<=', date('Y-m-d', strtotime($request->end_date)));
            }
            $orders->where('order_type', 'auction');
            $orders = $orders->orderBy('id', 'DESC');
            return DataTables::of($orders)
                ->addIndexColumn()
                ->addColumn('actions', 'backend.orders.action')
                ->addColumn('dropdown', 'backend.orders.dropdown')
                ->rawColumns(['actions', 'dropdown'])
                ->make(true);
        }

        return view('backend.orders.auction_order_list');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function orderDetails($id, $action=null){

        $orders = Order::find($id);
        $order_details = OrderDetail::select("order_details.*")
                                ->where("order_details.order_id","=",$id)
                                ->orderBy("order_details.order_id")
                                ->get();
        $order_shipping = OrderShippingAddress::where("id","=",$orders->shipping_address_id)->first();

        if($action!='print'){
            return view('backend.orders.order-detail',compact('orders', 'order_details', 'order_shipping'));
        }else{
            return view('backend.orders.print-order-details',compact('orders', 'order_details', 'order_shipping'));
        }
    }

    public function orderStatusChange(Request $request){
        if($request->has('order_id')){
            $orders = Order::find($request->order_id);
            $pre_order_status = $orders->status;

            $orders->status = $request->order_value;
            if($orders->save()){
                $order_details = OrderDetail::where('order_id', $request->order_id)->update(['status'=>$request->order_value]);

                if($request->order_value != 'Fulfilment' && $pre_order_status == 'Fulfilment') {
                    $order_details_item = OrderDetail::where('order_id', $request->order_id)->get();
                    if ($order_details_item) {
                        foreach ($order_details_item as $v) {
                            $product = Product::find($v->product_id);
                            $product->remaining_qty = $product->remaining_qty + $v->quantity;
                            $product->save();

                            if($v->product_wise_bid_id){
                                $upd_pro_wise_opt = ProductWiseBid::where('id', $v->product_wise_bid_id)
                                                                    ->update(['provied_to_user' => 'no']);
                            }
                        }
                    }
                }

                if($request->order_value == 'Fulfilment') {
                    $order_details_item = OrderDetail::where('order_id', $request->order_id)->get();
                    if ($order_details_item) {
                        foreach ($order_details_item as $v) {
                            $product = Product::find($v->product_id);
                            $product->remaining_qty = $product->remaining_qty - $v->quantity;
                            $product->save();

                            if($v->product_wise_bid_id){
                                $upd_pro_wise_opt = ProductWiseBid::where('id', $v->product_wise_bid_id)
                                    ->update(['provied_to_user' => 'yes']);
                            }
                        }
                    }
                }

            }
            return 'success';
        }else{
            return 'faild';
        }
    }

}
