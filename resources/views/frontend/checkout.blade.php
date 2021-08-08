@extends('frontend.layout.master')
@section('title','Home')

@section('content')

<section class="ic-checkout-area">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <div class="ic-checkout-payment-left">
                    <div class="title">
                        <h2>checkout</h2>
                    </div>
                    <form action="">
                        <div class="ic-checkout-paymnet-card">
                            <div class="ic-express-checkout">
                                <p>Express Checkout</p>
                                <a href="{{ route('make.payment') }}"><i class="flaticon-paypal"></i> buy with paypal</a>
                            </div>
                            <div class="or-pay">
                                <p><span>OR</span> To pay by credit card, purchase order or check, start by entering your shipping address bellow</p>
                            </div>

                            <div class="ic-payment-checkout-form">
                                @if(!\Auth::check())
                                    <p>Already have an account? <a href="{{route('login').'?checkoutpg=pg'}}">Log in</a> </p>
                                @endif
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="email" class="form-control" placeholder="Email address">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="First Name">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="last Name">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="company Name (optional)">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Adrress line 1">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Adrress line 2 (optional)">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="city">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <select name="" id="">
                                                <option value="">country</option>
                                                <option value="">Bangladesh</option>
                                                <option value="">Uk</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Post Code">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Phone number">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="continue-payment-shipping-btn">
{{--                            <button type="submit" class="ic-btn payment-btn"> <span>Continue Payment</span></button>--}}
                            <a href="{{route('payment')}}" class="ic-btn shopping-btn" style="background-color: #D6BA4F"> <span>Continue Payment</span></a>
                            <a href="{{route('shop')}}" class="ic-btn shopping-btn">Continue Shopping</a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-5">
                <div class="ic-total-cart">
                    <h2>Total cart</h2>
                    <div class="total-cart-item">
                        <div class="image-title">
                            <div class="image">
                                <img src="{{asset('frontend/images/cart-item.png')}}" alt="">
                            </div>
                            <div class="title">
                                <h4>product name</h4>
                                <p>#ID26598</p>
                                <p class="mobile-price">Price: 1 X $540</p>
                            </div>
                        </div>
                        <div class="price">
                            <p>Price</p>
                            <span>1 X $540</span>
                        </div>
                    </div>
                    <div class="total-cart-item">
                        <div class="image-title">
                            <div class="image">
                                <img src="{{asset('frontend/images/cart-item.png')}}" alt="">
                            </div>
                            <div class="title">
                                <h4>product name</h4>
                                <p>#ID26598</p>
                                <p class="mobile-price">Price: 1 X $540</p>
                            </div>
                        </div>
                        <div class="price">
                            <p>Price</p>
                            <span>1 X $540</span>
                        </div>
                    </div>
                    <div class="total-cart-item">
                        <div class="image-title">
                            <div class="image">
                                <img src="{{asset('frontend/images/cart-item.png')}}" alt="">
                            </div>
                            <div class="title">
                                <h4>product name</h4>
                                <p>#ID26598</p>
                                <p class="mobile-price">Price: 1 X $540</p>
                            </div>
                        </div>
                        <div class="price">
                            <p>Price</p>
                            <span>1 X $540</span>
                        </div>
                    </div>
                    <div class="ic-coupon-input">
                        <input type="text" class="form-control" placeholder="Coupon Or Discount Code">
                        <a href="#" class="ic-btn">apply</a>
                    </div>
                    <div class="ic-total-amount-calculate">
                        <div class="ic-subtotal">
                            <h5>subtotal</h5>
                            <h4>$1,620</h4>
                        </div>
                        <div class="ic-shipping-charge-amount">
                            <div class="shipping-charge">
                                <h5>Shipping Charge</h5>
                                <p>Calculate Shipping Charge</p>
                            </div>
                            <h4>$60</h4>
                        </div>
                        <div class="ic-total-amount">
                            <h5>TOTAL</h5>
                            <h4>$1,680</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection
