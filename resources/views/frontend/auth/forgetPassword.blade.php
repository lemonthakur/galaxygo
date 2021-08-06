@extends('frontend.layout.master')
@section('title','Forgot Password')

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
                        <h2><span>Reset</span> Password</h2>
                    </div>
                    <form method="post" action="{{ route('forget.password.post') }}" class="ic-login-form-warper">

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

                        <div class="form-group">
                            <button type="submit" class="login-btn"> Send Password Reset Link</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

@endsection
