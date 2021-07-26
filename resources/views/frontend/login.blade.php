@extends('frontend.layout.master')
@section('title','Home')

@section('content')
    @include('frontend.include.header')

    <section class="ic-login-area">
        <div class="container">
            <div class="ic-login-warper">
                <div class="ic-login-card">
                    <div class="ic-login-bg">
                        <img src="{{asset('frontend/images/login-bg.png')}}" class="img-fluid" alt="login-bg">
                    </div>
                    <div class="logo text-center">
                        <a href="index.php"><img src="{{asset('frontend/images/logo/logo.png')}}" class="img-fluid" alt="logo"></a>
                    </div>
                    <div class="ic-heading text-center">
                        <h2><span>login</span> now</h2>
                    </div>
                    <form action="" class="ic-login-form-warper">
                        <div class="form-group input-form-group">
                            <div class="icon">
                                <i class="flaticon-at"></i>
                            </div>
                            <input type="email" class="form-control login-input" placeholder="example@gmail.com">
                        </div>
                        <div class="form-group input-form-group">
                            <div class="icon">
                                <i class="flaticon-key"></i>
                            </div>
                            <input type="password" class="form-control login-input" placeholder="XXXXXXXXX">
                        </div>
                        <div class="form-group">
                            <a href="after-login.php" class="login-btn">login now</a>
                        </div>
                        <div class="ic-forgot-remember">
                            <div class="remember">
                                <input type="checkbox" id="remember">
                                <label for="remember"></label>
                            </div>
                            <div class="forget-password">
                                <a href="#">forget password</a>
                            </div>
                        </div>
                        <div class="ic-or-login">
                            <p>or</p>
                        </div>
                        <div class="ic-social-login">
                            <a href="#"><i class="flaticon-facebook"></i> <span>login on facebook</span> </a>
                            <a href="#"><i class="flaticon-message"></i> <span>register using email</span> </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

@endsection
