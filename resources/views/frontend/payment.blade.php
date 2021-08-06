@extends('frontend.layout.master')
@section('title','Home')

@section('content')

<section class="ic-payment-area">
    <div class="container">
        <div class="row">
            <div class="col-md-7">
                <div class="ic-checkout-payment-left">
                    <div class="title">
                        <h2>checkout</h2>
                    </div>
                    <form action="">
                        <div class="ic-checkout-paymnet-card">
                            <div class="ic-payment-checkout-form">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="" class="select-payment-label">select payment card</label>
                                            <div class="ic-select-card">
                                                <img src="{{asset('frontend/images/select-payment.png')}}" alt="">
                                                <select name="" id="">
                                                    <option value=""> card name here</option>
                                                    <option value="">card name here</option>
                                                    <option value="">card name here</option>
                                                </select>
                                            </div>
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
                                            <input type="text" class="form-control" placeholder="xxxx xxxx xxxx">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="Experi Date">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" placeholder="CVV Number">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="ic-confirm-payment-btn">
                            <a href="#">Confirm Payment</a>
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
                                <img src="assets/images/cart-item.png" alt="">
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
                                <img src="assets/images/cart-item.png" alt="">
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
                                <img src="assets/images/cart-item.png" alt="">
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
