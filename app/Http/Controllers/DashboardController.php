<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use App\Models\GuestUser;
use App\Models\Product;
use App\Models\Order;
use Illuminate\Support\Carbon;

class DashboardController extends Controller
{
    public function index(){
        $total_user          = User::where('role_id', 0)->count();
        $total_guest_user    = GuestUser::count();
        $total_product       = Product::count();
        $order_today         = Order::whereDate('created_at', Carbon::today())->count();
        $total_order         = Order::select('order_type', \DB::raw('COUNT(id) as order_count'))
                                        ->groupBy('order_type')
                                        ->get();

        //$total_auction_order = Order::where('order_type', 'auction')->count();
        $order_status        = Order::select('status', \DB::raw('COUNT(id) as order_status_count'))
            ->groupBy('status')
            ->get();

        //$total_pending_order = Order::where('status', 'Pending')->count();
        //$total_cancele_order = Order::where('status', 'Cancle')->count();
        //$total_fulfilment_order = Order::where('status', 'Fulfilment')->count();

        return view("backend.dashboard.index", compact('total_user', 'total_guest_user', 'total_product'
        , 'order_today', 'total_order', 'order_status'));
    }
}
