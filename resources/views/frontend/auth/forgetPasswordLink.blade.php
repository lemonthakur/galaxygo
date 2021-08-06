@extends('frontend.layout.master')
@section('title',' Reset Password')

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
                        <h2><span> Reset</span> Password</h2>
                    </div>
                    <form action="{{route('reset.password.post')}}" method="post" class="ic-login-form-warper">
                        @csrf

                        <div class="form-group input-form-group mb-0">
                            <div class="icon">
                                <i class="flaticon-at"></i>
                            </div>
                            <input type="email" class="form-control login-input" name="email"
                                   placeholder="Enter Email Address" value="{{old('email')}}">
                        </div>
                        <div class="mb-3">
                            <span class="text-danger">{{$errors->has("email") ? $errors->first("email") : ""}}</span>
                        </div>

                        <div class="form-group input-form-group mb-0">
                            <div class="icon">
                                <i class="flaticon-key"></i>
                            </div>
                            <input type="password" class="form-control login-input" name="password"
                                   placeholder="Enter Password">
                        </div>
                        <div class="mb-3">
                            <span
                                class="text-danger">{{$errors->has("password") ? $errors->first("password") : ""}}</span>
                        </div>

                        <input type="hidden" name="token" value="{{ $token }}">

                        <div class="form-group input-form-group mb-0">
                            <div class="icon">
                                <i class="flaticon-key"></i>
                            </div>
                            <input type="password" class="form-control login-input" name="confirm_password"
                                   placeholder="Enter Confirmed Password">
                        </div>
                        <div class="mb-3">
                            <span
                                class="text-danger">{{$errors->has("confirm_password") ? $errors->first("confirm_password") : ""}}</span>
                        </div>

                        <div class="form-group">
                            <button type="submit" class="login-btn">Reset Password</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

@endsection
