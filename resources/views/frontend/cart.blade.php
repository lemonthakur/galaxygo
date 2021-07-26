@extends('frontend.layout.master')
@section('title','Home')

@section('content')
@include('frontend.include.profile-header')

<section class="ic-cart-area">
    <div class="container">
        <div class="ic-cart-card">
            <div class="title">
                <h2>Shopping Cart</h2>
            </div>
            <div class="ic-cart-item item-bg">
                <div class="image">
                    <img src="{{asset('frontend/images/cart-item.png')}}" alt="">
                </div>
                <div class="title">
                    <h5>Product name</h5>
                    <p class="product-code">#ID26598</p>
                    <p class="mobile-date">Date: 03/03/2021 </p>
                    <p class="mobile-time">Time: 10:44 AM</p>
                </div>
                <div class="date">
                    <p>Date & Time</p>
                    <p>03/03/2021 10:44 AM</p>
                </div>
                <div class="quantity">
                    <div class="product-count">
                        <a href="#" class="qty-minus"><i class="flaticon-minus"></i></a>
                        <input type="number" value="01" class="qty" readonly>
                        <a href="#" class="qty-plus"><i class="flaticon-plus"></i></a>
                    </div>
                </div>
                <div class="price">
                    <p>price</p>
                    <p>1 X $540</p>
                </div>
                <div class="remove">
                    <a href="#"><i class="flaticon-error"></i></a>
                </div>
            </div>
            <div class="ic-cart-item mobile-item-bg">
                <div class="image">
                    <img src="{{asset('frontend/images/cart-item.png')}}" alt="">
                </div>
                <div class="title">
                    <h5>Product name</h5>
                    <p class="product-code">#ID26598</p>
                    <p class="mobile-date">Date: 03/03/2021 </p>
                    <p class="mobile-time">Time: 10:44 AM</p>
                </div>
                <div class="date">
                    <p>Date & Time</p>
                    <p>03/03/2021 10:44 AM</p>
                </div>
                <div class="quantity">
                    <div class="product-count">
                        <a href="#" class="qty-minus"><i class="flaticon-minus"></i></a>
                        <input type="number" value="01" class="qty" readonly>
                        <a href="#" class="qty-plus"><i class="flaticon-plus"></i></a>
                    </div>
                </div>
                <div class="price">
                    <p>price</p>
                    <p>1 X $540</p>
                </div>
                <div class="remove">
                    <a href="#"><i class="flaticon-error"></i></a>
                </div>
            </div>
            <div class="ic-cart-item item-bg">
                <div class="image">
                    <img src="{{asset('frontend/images/cart-item.png')}}" alt="">
                </div>
                <div class="title">
                    <h5>Product name</h5>
                    <p class="product-code">#ID26598</p>
                    <p class="mobile-date">Date: 03/03/2021 </p>
                    <p class="mobile-time">Time: 10:44 AM</p>
                </div>
                <div class="date">
                    <p>Date & Time</p>
                    <p>03/03/2021 10:44 AM</p>
                </div>
                <div class="quantity">
                    <div class="product-count">
                        <a href="#" class="qty-minus"><i class="flaticon-minus"></i></a>
                        <input type="number" value="01" class="qty" readonly>
                        <a href="#" class="qty-plus"><i class="flaticon-plus"></i></a>
                    </div>
                </div>
                <div class="price">
                    <p>price</p>
                    <p>1 X $540</p>
                </div>
                <div class="remove">
                    <a href="#"><i class="flaticon-error"></i></a>
                </div>
            </div>
            <div class="ic-contunue-shipping-total">
                <div class="contunue-shop-update-btn">
                    <a href="{{route('shop')}}">continue shopping</a>
                    <a href="{{route('cart')}}" class="update-btn">update cart</a>
                </div>
                <div class="ic-subtotal">
                    <h3>SUBTOTAl: $1,620</h3>
                    <p>Discounts will be applied during Check Out</p>
                </div>
            </div>
        </div>
        <div class="ic-continue-checkout-btn">
            <a href="{{route('checkout')}}" class="ic-btn">continue checkout</a>
        </div>
    </div>
</section>

@endsection
