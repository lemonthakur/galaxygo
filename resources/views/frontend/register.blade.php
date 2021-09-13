@extends('frontend.layout.master')
@section('title','Registration')

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
                        <h2><span>Register</span> now</h2>
                    </div>
                    <form action="{{route('register.submit')}}" method="post" class="ic-login-form-warper">
                        @csrf

                        <div class="form-group input-form-group mb-0">
                            <div class="icon">
                                <i class="icofont-ui-user"></i>
                            </div>
                            <input type="text" class="form-control login-input" name="name"
                                   placeholder="User Name" value="{{old('name')}}">
                        </div>
                        <div class="mb-3">
                            <span class="text-danger">{{$errors->has("name") ? $errors->first("name") : ""}}</span>
                        </div>

                        <div class="form-group input-form-group mb-0">
                            <div class="icon">
                                <i class="flaticon-at"></i>
                            </div>
                            <input type="email" class="form-control login-input" name="email"
                                   placeholder="Email Address" value="{{old('email')}}">
                        </div>
                        <div class="mb-3">
                            <span class="text-danger">{{$errors->has("email") ? $errors->first("email") : ""}}</span>
                        </div>

                        <div class="form-group input-form-group mb-0">
                            <div class="icon">
                                <i class="flaticon-key"></i>
                            </div>
                            <input type="password" class="form-control login-input" name="password"
                                   placeholder="Password">
                        </div>
                        <div class="mb-3">
                            <span
                                class="text-danger">{{$errors->has("password") ? $errors->first("password") : ""}}</span>
                        </div>

                        {{--<div class="form-group input-form-group mb-0">
                            <div class="icon">
                                <i class="flaticon-key"></i>
                            </div>
                            <input type="password" class="form-control login-input" name="confirm_password"
                                   placeholder="Enter Confirmed Password">
                        </div>--}}
                        <div class="mb-3">
                            <span
                                class="text-danger">{{$errors->has("confirm_password") ? $errors->first("confirm_password") : ""}}</span>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="login-btn">Register now</button>
                        </div>

                        <div class="ic-or-login">
                            <p>or</p>
                        </div>
                        <div class="ic-social-login">
                            <a href="#"><i class="flaticon-facebook"></i> <span>login with facebook</span> </a>
                            <a href="{{route('login')}}"><i class="flaticon-message"></i> <span>Login with email</span>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

@endsection
