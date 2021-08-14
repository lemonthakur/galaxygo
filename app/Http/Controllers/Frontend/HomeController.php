<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\AboutUs;
use App\Models\CoinHistory;
use App\Models\OtherPages;
use App\Models\SiteSetting;
use App\Models\User;
use App\Models\WinCoin;
use App\Models\FooterCircleImage;
use App\Models\WithdrawRequest;
use Carbon\Carbon;
use Illuminate\Http\Request;
use App\CustomClass\OwnLibrary;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;

class HomeController extends Controller
{
    public function home(){
        $all_images = FooterCircleImage::where('status', 1)->orderBy('order_serial', 'asc')->get();
        return view('frontend.home', compact('all_images'));
    }

    public function todayTomorrow(){
        return view('frontend.today-tomorrow');
    }

    public function startContest(){
        $winCoins = WinCoin::select('win','out_of','coin')->orderBy('win','desc')->get();
        return view('frontend.start-contest',compact('winCoins'));
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

    public function orders(Request $request){
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
            ->paginate(1); //dd($bid_applies);

        if ($request->ajax() && $request->bid_order==1) {
            $view = view('frontend.bid-orders-ajax-data',compact('bid_applies'))->render();
            return response()->json(['html'=>$view, 'bid_has_page'=> $bid_applies->lastPage()]);
        }

        $orders = \App\Models\Order::
            join('order_details', 'orders.id', '=', 'order_details.order_id')
            ->join('products', 'products.id', '=', 'order_details.product_id')
            ->join('users', 'users.id', '=', 'orders.user_id')
            ->select("products.name as product_name"
                , "products.slug as product_slug"
                , "products.feature_image as feature_image"
                , "order_details.total_price as product_total"
                , "orders.created_at as order_date"
                , "orders.status as order_status"
            )
            ->where('orders.user_id', \Auth::id())
            ->orderBy('orders.created_at', 'DESC')
            ->paginate(4);

        if ($request->ajax() && $request->order==1) {
            $view = view('frontend.orders-ajax-data',compact('orders'))->render();
            return response()->json(['html'=>$view, 'has_page'=> $orders->lastPage()]);
        }
        $entryWon = OwnLibrary::entryWon();
        return view('frontend.orders', compact('bid_applies', 'orders','entryWon'));
    }

    public function profile(){
        $entryWon = OwnLibrary::entryWon();
        return view('frontend.profile',compact('entryWon'));
    }

    public function cart(){
        return view('frontend.cart');
    }

    public function checkout(){
        return view('frontend.checkout');
    }

    public function payment(){
        OwnLibrary::check_cart_qty();
        return view('frontend.payment');
    }

    public function bidpayment($id){
        $id = decrypt($id);
        $product_info = \App\Models\ProductWiseBid::find($id);
        return view('frontend.bid-payment', compact('product_info'));
    }

    public function about(){
        $about  = AboutUs::find(1);
        return view('frontend.about-us',compact('about'));
    }

    public function privacyPolicy(){
        $otherPage  = OtherPages::find(1);
        return view('frontend.pages',compact('otherPage'));
    }

    public function contact(){
        return view('frontend.contact');
    }

    public function contactMessage(Request $request){
        $request->validate([
            'first_name' => 'required',
            'last_name' => 'required',
            'email' => 'required|email',
            'message' => 'required',
        ]);

        $setting = SiteSetting::find(1);

        Mail::send('email.contact', ['setting' => $setting,'request' => $request], function($message) use($request,$setting){
            $message->from($request->email);
            $message->to($setting->email);
            $message->subject('Contact Message');
        });

        return back()->with('success', 'We received your Message. Soon our support team will contact you.');
    }

    public function updateProfile(Request $request){
        $rules = [
            'name' => 'required',
            'email' => 'required|email|unique:users,email,'.auth()->id(),
            'paypal_email' => 'required|email',
        ];

        $message = [];

        if (!empty($request->password)){
            $rules['password'] = 'required|min:5';
            $rules['confirm_password'] = 'required|same:password|min:5';
        }

        $validation = Validator::make($request->all(),$rules,$message);

        if ($validation->fails()){
            return redirect()->back()
                ->withInput()
                ->withErrors($validation);
        }
        $user = User::find(auth()->id());
        $user->name = $request->name;
        $user->email = $request->email;
        $user->paypal_email = $request->paypal_email;
        if(!empty($request->password)){
            $user->password = Hash::make($request->password);
        }
        if ($user->save()){
            session()->flash('success','User info updated');
        }else{
            session()->flash('error','User info not updated');
        }
        return redirect()->back();
    }

    public function changeCoverPhoto(Request $request){
        $rules = [
            "cover_photo" =>  "required|image"
        ];

        $message = [];

        $validation = Validator::make($request->all(), $rules, $message);
        if ($validation->fails()){
            return response()->json([
                'status' => 1,
                'errors' => $validation->getMessageBag(),
                'data' => ''
            ], 200);
        }

        if ($request->file('cover_photo')) {
            $image = OwnLibrary::uploadImage($request->cover_photo, "cover_photo");
            Image::make($image)->resize(350,150)->save($image,70,'jpg');
            if (auth()->user()->cover_photo){
                @unlink(auth()->user()->cover_photo);
            }
        }

        if ($image){
            $user = User::find(auth()->id());
            $user->cover_photo = $image;
            if ($user->save()){
                return response()->json([
                    'status' => 2,
                    'data' => asset($user->cover_photo)
                ], 200);
            }else{
                return response()->json([
                    'status' => 3
                ], 200);
            }
        }else{
            return response()->json([
                'status' => 2
            ], 200);
        }

    }

    public function changeProfilePhoto(Request $request){
        $rules = [
            "photo" =>  "required|image"
        ];

        $message = [];

        $validation = Validator::make($request->all(), $rules, $message);
        if ($validation->fails()){
            return response()->json([
                'status' => 1,
                'errors' => $validation->getMessageBag(),
                'data' => ''
            ], 200);
        }

        if ($request->file('photo')) {
            $image = OwnLibrary::uploadImage($request->photo, "profile-pic");
            Image::make($image)->resize(225,225)->save($image,70,'jpg');
            if (auth()->user()->photo){
                @unlink(auth()->user()->photo);
            }
        }

        if ($image){
            $user = User::find(auth()->id());
            $user->photo = $image;
            if ($user->save()){
                return response()->json([
                    'status' => 2,
                    'data' => asset($user->photo)
                ], 200);
            }else{
                return response()->json([
                    'status' => 3
                ], 200);
            }
        }else{
            return response()->json([
                'status' => 2
            ], 200);
        }
    }

    public function withdrawRequest(Request $request){

        $rules = [
            'amount' => 'required|numeric|min:2500',
        ];

        $message = [];

        $validation = Validator::make($request->all(),$rules,$message);

        if ($validation->fails()){
            return redirect()->back()
                ->withInput()
                ->withErrors($validation);
        }

        if (!auth()->user()->paypal_email){
            session()->flash('error','Please provide PayPal email first');
            return redirect()->back()->withInput();
        }

        if (auth()->user()->current_coin < $request->amount){
            session()->flash('error','You dosen\'t have sufficient coin.');
            return redirect()->back()->withInput();
        }

        DB::beginTransaction();

        try {
            $success = false;
            //Deduct Coin from user table
            $user = User::find(auth()->id());
            $user->current_coin = $user->current_coin - $request->amount;
            $user->withdraw = $user->withdraw + $request->amount;
            $user->save();

            //Insert in coin history
            $coinHistory = new CoinHistory();
            $coinHistory->user_id = auth()->id();
            $coinHistory->amount = $request->amount;
            $coinHistory->transaction_type = 1;
            $coinHistory->earn_expense_type = 3;
            $coinHistory->save();

            //Insert into withdraw request table
            $withdraw = new WithdrawRequest();
            $withdraw->user_id = auth()->id();
            $withdraw->paypal_email = auth()->user()->paypal_email;
            $withdraw->amount = $request->amount / 100;
            $withdraw->coin_amount = $request->amount;
            $withdraw->before_withdraw = auth()->user()->current_coin;
            $withdraw->after_withdraw = auth()->user()->current_coin - $request->amount;
            $withdraw->status = 0;
            $withdraw->coin_history_id = $coinHistory->id;
            $withdraw->save();

            $success = true;

        }catch(ValidationException $e) {
            DB::rollback();
            return redirect()->back()
                ->withErrors( $e->getErrors() )
                ->withInput();
        }catch(\Exception $e)
        {
            DB::rollback();
            throw $e;
        }
        DB::commit();

        if ($success){
            session()->flash('success','We received your request');
        }else{
            session()->flash('error','Unable to process your request. Please try again');
        }
        return redirect()->back();
    }
}
