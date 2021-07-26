@extends('frontend.layout.master')
@section('title','Home')

@section('content')
@include('frontend.include.profile-header')

<section class="ic-product-details-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-6">
                <div class="ic-product-details-left">
                    <div class="product-details-image easyzoom easyzoom--overlay">
                        <a href="{{asset('frontend/images/product/product-details-large.png')}}" class="">
                            <img src="{{asset('frontend/images/product/product-details.png')}}" class="img-fluid" alt="product-details">
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 col-md-6">
                <div class="ic-product-details-right">
                    <div class="title-price">
                        <h2 class="title">Apple Watch</h2>
                        <h2 class="price">$400.00</h2>
                    </div>
                    <div class="description">
                        <p>Lorem ipsum dolor sit amet, consectetu elit. Sed mattis ipsum, nec blandit. Integer vulputate ultrices ac ipsum semper. A molestie aliquam tellus curabitur fusi donec. Nisi amet, non ipsum tincidunt. </p>
                    </div>
                    <div class="ic-product-count-buy">
                        <div class="product-count">
                            <a href="#" class="qty-minus"><i class="flaticon-minus"></i></a>
                            <input type="number" value="01" class="qty" readonly>
                            <a href="#" class="qty-plus"><i class="flaticon-plus"></i></a>
                        </div>
                        <div class="ic-buy-now-btn">
                            <a href="{{route('cart')}}" class="ic-btn ic-btn-golden2">buy now</a>
                        </div>
                    </div>
                    <div class="ic-share-btn">
                        <h5>Share on:</h5>
                        <ul>
                            <li><a href="#"><i class="flaticon-facebook"></i></a></li>
                            <li><a href="#"><i class="flaticon-twitter"></i></a></li>
                            <li><a href="#"><i class="flaticon-instagram"></i></a></li>
                            <li><a href="#"><i class="flaticon-pinterest"></i></a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="ic-related-product-area">
    <div class="container">
        <div class="ic-heading">
            <h2>our products</h2>
        </div>
        <div class="row">
            <!--Item 1-->
            <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                <div class="ic-product-item">
                    <div class="ic-thumbnil">
                        <a href="{{route('product-details')}}"><img src="{{asset('frontend/images/product/product-1.png')}}" class="img-fluid" alt="product"></a>
                        <span class="ic-badge">over</span>
                    </div>
                    <div class="ic-content">
                        <div class="title-price">
                            <a href="{{route('product-details')}}">
                                <h5>apple watch</h5>
                                <p>$400.00</p>
                            </a>
                        </div>
                        <div class="ic-btn-group">
                            <a href="#" class="buy-btn">buy now</a>
                            <a href="#" class="bid-btn">bid now</a>
                            <a href="#" class="icon-btn"><i class="flaticon-time-left"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!--Item 2-->
            <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                <div class="ic-product-item">
                    <div class="ic-thumbnil">
                        <a href="{{route('product-details')}}"><img src="{{asset('frontend/images/product/product-2.png')}}" class="img-fluid" alt="product"></a>
                        <span class="ic-badge">over</span>
                    </div>
                    <div class="ic-content">
                        <div class="title-price">
                            <a href="{{route('product-details')}}">
                                <h5>apple watch</h5>
                                <p>$400.00</p>
                            </a>
                        </div>
                        <div class="ic-btn-group">
                            <a href="#" class="buy-btn">buy now</a>
                            <a href="#" class="bid-btn">bid now</a>
                            <a href="#" class="icon-btn"><i class="flaticon-time-left"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!--Item 3-->
            <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                <div class="ic-product-item">
                    <div class="ic-thumbnil">
                        <a href="{{route('product-details')}}"><img src="{{asset('frontend/images/product/product-3.png')}}" class="img-fluid" alt="product"></a>
                        <span class="ic-badge">over</span>
                    </div>
                    <div class="ic-content">
                        <div class="title-price">
                            <a href="{{route('product-details')}}">
                                <h5>apple watch</h5>
                                <p>$400.00</p>
                            </a>
                        </div>
                        <div class="ic-btn-group">
                            <a href="#" class="buy-btn">buy now</a>
                            <a href="#" class="bid-btn">bid now</a>
                            <a href="#" class="icon-btn"><i class="flaticon-time-left"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!--Item 4-->
            <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                <div class="ic-product-item">
                    <div class="ic-thumbnil">
                        <a href="{{route('product-details')}}"><img src="{{asset('frontend/images/product/product-4.png')}}" class="img-fluid" alt="product"></a>
                        <span class="ic-badge">over</span>
                    </div>
                    <div class="ic-content">
                        <div class="title-price">
                            <a href="{{route('product-details')}}">
                                <h5>apple watch</h5>
                                <p>$400.00</p>
                            </a>
                        </div>
                        <div class="ic-btn-group">
                            <a href="#" class="buy-btn">buy now</a>
                            <a href="#" class="bid-btn">bid now</a>
                            <a href="#" class="icon-btn"><i class="flaticon-time-left"></i></a>
                        </div>
                    </div>
                </div>
            </div>
            <!--Item End-->
        </div>
    </div>
</section>

@endsection
