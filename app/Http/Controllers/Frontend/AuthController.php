<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
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
    public function loginView(){
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
        $user->password = Hash::make($request->password);

        if ($user->save()){
            Auth::loginUsingId($user->id);
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

            if($user->save()){
                Auth::loginUsingId($user->id);
            }else{
                session()->flash("error","Unable to login");
                return redirect()->route("login");
            }
        }
        return redirect()->route('home');
    }

    public function logout(){
        Auth::logout();
        return redirect()->route("home");
    }
}
