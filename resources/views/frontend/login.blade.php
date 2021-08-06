@extends('frontend.layout.master')
@section('title','Login')

@section('content')

    <section class="ic-login-area">
        <div class="container">
            <div class="ic-login-warper">
                <div class="ic-login-card">
                    <div class="ic-login-bg">
                        <img src="{{asset('frontend/images/login-bg.png')}}" class="img-fluid" alt="login-bg">
                    </div>
                    <div class="logo text-center">
                        <a href="index.php"><img src="{{asset('frontend/images/logo/logo.png')}}" class="img-fluid"
                                                 alt="logo"></a>
                    </div>
                    <div class="ic-heading text-center">
                        <h2><span>login</span> now</h2>
                    </div>
                    <form method="post" action="{{route('login.submit')}}" class="ic-login-form-warper">

                        @if(Session::has('invalid'))
                            <div class="mb-3">
                                <span class="text-danger">{{ Session::get("invalid") }}</span>
                            </div>
                        @endif

                        @csrf
                        <div class="form-group input-form-group mb-0">
                            <div class="icon">
                                <i class="flaticon-at"></i>
                            </div>
                            <input type="email" class="form-control login-input" placeholder="example@gmail.com"
                                  name="email" value="{{old('email')}}">
                        </div>
                        <div class="mb-3">
                            <span class="text-danger">{{$errors->has("email") ? $errors->first("email") : ""}}</span>
                        </div>

                        <div class="form-group input-form-group mb-0">
                            <div class="icon">
                                <i class="flaticon-key"></i>
                            </div>
                            <input type="password" class="form-control login-input" name="password" placeholder="XXXXXXXXX">
                        </div>
                        <div class="mb-3">
                            <span
                                class="text-danger">{{$errors->has("password") ? $errors->first("password") : ""}}</span>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="login-btn">login now</button>
                        </div>
                        <div class="ic-forgot-remember">
                            <div class="remember">
                                <input type="checkbox" id="remember" name="remember">
                                <label for="remember"></label>
                            </div>
                            <div class="forget-password">
                                <a href="{{route('forget.password.get')}}">forget password</a>
                            </div>
                        </div>
                        <div class="ic-or-login">
                            <p>or</p>
                        </div>
                        <div class="ic-social-login">
                            <a href="{{route('social.login','facebook')}}"><i class="flaticon-facebook"></i> <span>login on facebook</span> </a>
                            <a href="{{route('register')}}"><i class="flaticon-message"></i>
                                <span>register using email</span> </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

@endsection
