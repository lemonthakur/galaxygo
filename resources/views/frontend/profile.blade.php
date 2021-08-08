@extends('frontend.layout.master')
@section('title','Home')

@section('content')

<section class="ic-profile-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-5">
                <div class="ic-profile-left">
                    <div class="ic-user">
                        <div class="ic-cover-bg">

                            <img src="{{asset('frontend/images/profile-cover.png')}}" class="img-fluid" alt="cover">

                            <div class="ic-edit-cover-photo">
                                <a href="#"><i class="icofont-camera"></i>
                                    <span>edit cover photo</span> </a>
                            </div>
                        </div>
                        <div class="user-profile">

                            @guest()
                                <img src="{{asset('frontend/images/user.png')}}" alt="user">
                            @endguest

                            @auth()
                                @if(auth()->user()->photo)
                                        <img src="{{auth()->user()->photo}}" alt="user">
                                @else
                                        <img src="{{asset('frontend/images/user.png')}}" alt="user">
                                @endif
                            @endauth

                            <div class="ic-edit-profile">
                                <a href="#"><i class="icofont-camera"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="ic-win-btn">
                        <a href="#">00 <span>Entries Won</span></a>
                        <a href="#">00 <span>Coins Won</span></a>
                    </div>
                    <div class="ic-total-balance">
                        <p>Total Coins Balance</p>
                        <h4>{{auth()->user()->current_coin}}</h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-7">
                <div class="ic-profile-right">
                    <div class="title">
                        <h4>Basic info</h4>
                    </div>
                    <form action="" class="ic-profile-basic-info">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="">paypal email</label>
                                    <input type="text" class="form-control" placeholder="{{auth()->user()->name}}">
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="">email</label>
                                    <input type="email" class="form-control" placeholder="{{auth()->user()->email}}">
                                </div>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="ic-btn">update now </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection
