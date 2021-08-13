<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\CoinHistory;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Laravel\Socialite\Facades\Socialite;

class AuthController extends Controller
{
    public function loginView(Request $request){

        if($request->pro_dir_url || $request->bid_amo){
            session(['pro_dir_url' => $request->pro_dir_url, 'bid_amo' => $request->bid_amo]);
        }
        elseif($request->checkoutpg){
            session(['checkoutpg' => $request->checkoutpg]);
        }

        return view('frontend.login');
    }

    public function login(Request $request){
        $rules = [
            'email' => 'required|email',
            'password' => 'required',
        ];

        $message = [];

        $validation = Validator::make($request->all(),$rules,$message);

        if ($validation->fails()){
            return redirect()->back()
                ->withInput()
                ->withErrors($validation);
        }

        $user = array(
            'email' => $request->email,
            'password' => $request->password,
            'status' => 1,
            'role_id' => 0,
        );

        $remember_me = $request->has('remember') ? true : false;

        if (Auth::attempt($user,$remember_me)) {

            User::where('id',auth()->id())->update(['lastLoginTime' => Carbon::now()]);
            if(Session::get("pro_dir_url") && Session::get("bid_amo")){
                return Redirect::route('product-details', Session::get("pro_dir_url"));
            }
            elseif(Session::get("checkoutpg")){
                Session::forget(["checkoutpg"]);
                return Redirect::route('checkout');
            }


            return Redirect::route('home');
        } else {
            Session::flash('error', 'Invalid login credential!');
            return redirect()->route('login')->withInput($request->except('password'));
        }
    }

    public function registrationView(){
        return view('frontend.register');
    }

    public function register(Request $request){
        $rules = [
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required|min:5',
            'confirm_password' => 'required|same:password|min:5'
        ];

        $message = [];

        $validation = Validator::make($request->all(),$rules,$message);

        if ($validation->fails()){
            return redirect()->back()
                ->withInput()
                ->withErrors($validation);
        }

        $user = new User();
        $user->role_id = 0;
        $user->name = $request->name;
        $user->email = $request->email;
        $user->contact_no = Str::random(4).date('ymd').rand(0,99);
        $user->total_coin = $user->total_coin + 100;
        $user->current_coin = $user->current_coin + 100;
        $user->password = Hash::make($request->password);

        if ($user->save()){
            Auth::loginUsingId($user->id);

            $coinHistory = new CoinHistory();
            $coinHistory->user_id = auth()->id();
            $coinHistory->amount = 100;
            $coinHistory->transaction_type = 0;
            $coinHistory->earn_expense_type = 0;
            $coinHistory->save();

            session()->flash("success","Successfully register");
            return redirect()->route("home");
        }else{
            session()->flash("error","Unable to register");
            return redirect()->route("register")->withInput();
        }
    }

    public function redirect($provider)
    {
        return Socialite::driver($provider)->redirect();
    }

    public function callback($provider)
    {
        $userSocial =   Socialite::driver($provider)->stateless()->user();
        $users       =   User::where(['email' => $userSocial->getEmail()])->first();
        if($users){
            Auth::login($users);
        }else{
            $user = new User();
            $user->role_id = 0;
            $user->contact_no = Str::random(4).date('ymd').rand(0,99);
            $user->photo = $userSocial->getAvatar() ?? '';
            $user->name = $userSocial->getName();
            $user->email = $userSocial->getEmail();
            $user->provider_id = $userSocial->getId();
            $user->provider = $provider;
            $user->total_coin = $user->total_coin + 100;
            $user->current_coin = $user->current_coin + 100;
            $user->provider = $provider;

            if($user->save()){
                Auth::loginUsingId($user->id);

                $coinHistory = new CoinHistory();
                $coinHistory->user_id = auth()->id();
                $coinHistory->amount = 100;
                $coinHistory->transaction_type = 0;
                $coinHistory->earn_expense_type = 0;
                $coinHistory->save();

            }else{
                session()->flash("error","Unable to login");
                return redirect()->route("login");
            }
        }

        if(Session::get("pro_dir_url") && Session::get("bid_amo")){
            return Redirect::route('product-details', Session::get("pro_dir_url"));
        }
        return redirect()->route('home');
    }

    public function logout(){
        Auth::logout();
        return redirect()->route("home");
    }
}
