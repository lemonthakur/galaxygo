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
                    <form action="{{ route("checkout.register") }}" method="post" enctype="multipart/form-data">
                        @csrf
                        <div class="ic-checkout-paymnet-card">
                            <div class="ic-express-checkout">
                                <p>Express Checkout</p>
                                <label class="mb-3 {{ (old("payment_method")==1 || old("payment_method")==null || old("payment_method") == '')? 'active':''  }}" id="paypalLabel" for="paypal"><i class="flaticon-paypal mr-1"></i> buy with paypal</label>
                                <input class="d-none" id="paypal" type="radio" value="1" name="payment_method"
                                        {{ (old("payment_method")==1 || old("payment_method")==null || old("payment_method") == '')? 'checked':''  }}>

                                <label id="coinLabel" class="{{ (old("payment_method")==2) ? 'active':'' }}" for="coin"><i class="icofont-coins mr-1"></i> buy with coin</label>
                                <input class="d-none" id="coin" type="radio" value="2" name="payment_method" {{ (old("payment_method")==2) ? 'checked':'' }}>
                                <span class="text-danger"> {{$errors->has("payment_method") ? $errors->first("payment_method") : ""}} </span>
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
                                            <input type="email" name="email" class="form-control" value="{{old("email", \Auth::check() ? Auth::user()->shipping_email : '')}}" placeholder="Email address" >
                                            <span class="text-danger"> {{$errors->has("email") ? $errors->first("email") : ""}} </span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" name="name" class="form-control" value="{{old("name", \Auth::check() ? Auth::user()->name : '')}}" placeholder="First Name" >
                                            <span class="text-danger"> {{$errors->has("name") ? $errors->first("name") : ""}} </span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" name="last_name" class="form-control" value="{{old("last_name", \Auth::check() ? Auth::user()->last_name : '')}}" placeholder="last Name" >
                                            <span class="text-danger"> {{$errors->has("last_name") ? $errors->first("last_name") : ""}} </span>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" name="shipping_company_name" class="form-control" value="{{ old("shipping_company_name", \Auth::check() ? Auth::user()->shipping_company_name : '') }}" placeholder="company Name (optional)">
                                            <span class="text-danger"> {{$errors->has("shipping_company_name") ? $errors->first("shipping_company_name") : ""}} </span>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" name="shipping_adrress_line_1" value="{{ old("shipping_adrress_line_1", \Auth::check() ? Auth::user()->shipping_adrress_line_1 : '') }}" class="form-control" placeholder="Adrress line 1" >
                                            <span class="text-danger"> {{$errors->has("shipping_adrress_line_1") ? $errors->first("shipping_adrress_line_1") : ""}} </span>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" name="shipping_adrress_line_2" class="form-control" value="{{ old("shipping_adrress_line_2", \Auth::check() ? Auth::user()->shipping_adrress_line_2 : '') }}" placeholder="Adrress line 2 (optional)">
                                            <span class="text-danger"> {{$errors->has("shipping_adrress_line_2") ? $errors->first("shipping_adrress_line_2") : ""}} </span>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" name="shipping_city" value="{{ old("shipping_city", \Auth::check() ? Auth::user()->shipping_city : '') }}" class="form-control" placeholder="city" >
                                            <span class="text-danger"> {{$errors->has("shipping_city") ? $errors->first("shipping_city") : ""}} </span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <select name="shipping_country" id="" >
                                                <option value="">country</option>
                                                @foreach($countries as $c)
                                                    <option value="{{ $c->id }}" @if($c->id == old("shipping_country", \Auth::check() ? Auth::user()->shipping_country : '')){{'selected'}}@endif>{{ $c->name }}</option>
                                                @endforeach
                                            </select>
                                            <span class="text-danger"> {{$errors->has("shipping_country") ? $errors->first("shipping_country") : ""}} </span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" name="shipping_post_code" value="{{ old("shipping_post_code", \Auth::check() ? Auth::user()->shipping_post_code : '') }}" class="form-control" placeholder="Post Code" >
                                            <span class="text-danger"> {{$errors->has("shipping_post_code") ? $errors->first("shipping_post_code") : ""}} </span>
                                        </div>
                                    </div>
                                    @if(!\Auth::check())
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="password" name="password" value="" class="form-control" placeholder="Password" >
                                            <span class="text-danger"> {{$errors->has("password") ? $errors->first("password") : ""}} </span>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="password" name="confirm_password" value="" class="form-control" placeholder="Confirm Password" >
                                            <span class="text-danger"> {{$errors->has("confirm_password") ? $errors->first("confirm_password") : ""}} </span>
                                        </div>
                                    </div>
                                    @endif
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" name="shipping_phone" value="{{ old("shipping_phone", \Auth::check() ? Auth::user()->shipping_phone : '') }}" class="form-control" placeholder="Phone number" >
                                            <span class="text-danger"> {{$errors->has("shipping_phone") ? $errors->first("shipping_phone") : ""}} </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="continue-payment-shipping-btn">
                            @if(Cart::subtotal()>0 && Cart::count() > 0)
                                <button type="submit" class="ic-btn payment-btn"> <span>Continue Payment</span></button>
                            @endif
                            <!-- <a href="{{route('payment')}}" class="ic-btn shopping-btn" style="background-color: #D6BA4F"> <span>Continue Payment</span></a> -->
                            <a href="{{route('shop')}}" class="ic-btn shopping-btn">Continue Shopping</a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-5">
                <div class="ic-total-cart">
                    <h2>Total cart</h2>
                    @if(Cart::count() > 0)
                        @foreach(Cart::content() as $row)
                            <div class="total-cart-item">
                                <div class="image-title">
                                    <div class="image">
                                        <img src="{{asset('upload/product-thumbnail-82-82/'.$row->options->image_name)}}" alt="">
                                    </div>
                                    <div class="title">
                                        <h4>{{$row->name}}</h4>
                                        <p>#{{$row->options->slug}}</p>
                                        <p class="mobile-price">Price: {{$row->qty}} X ${{$row->price}}</p>
                                    </div>
                                </div>
                                <div class="price">
                                    <p>Price</p>
                                    <span>{{$row->qty}} X ${{$row->price}}</span>
                                </div>
                            </div>
                        @endforeach
                    @endif

                    <div class="ic-coupon-input">
                        <input type="text" class="form-control" placeholder="Coupon Or Discount Code">
                        <a href="#" class="ic-btn">apply</a>
                    </div>
                    <div class="ic-total-amount-calculate">
                        <div class="ic-subtotal">
                            <h5>subtotal</h5>
                            <h4>${{Cart::subtotal()}}</h4>
                        </div>
                        <div class="ic-shipping-charge-amount">
                            <div class="shipping-charge">
                                <h5>Shipping Charge</h5>
                                <p>Calculate Shipping Charge</p>
                            </div>
                            <h4><?php $shipping_cost = 60; ?>$60</h4>
                        </div>
                        <div class="ic-total-amount">
                            <h5>TOTAL</h5>
                            <h4>${{Cart::subtotal()+$shipping_cost}}</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

@section('js')
    <script>
        $(document).ready(function (){
            $('#paypalLabel').on('click',function (){
               $(this).addClass('active');
               $('#coinLabel').removeClass('active');
            });

            $('#coinLabel').on('click',function (){
                $(this).addClass('active');
                $('#paypalLabel').removeClass('active');
            });

            var order_error_cancel = '{{ Session::has('order_error') }}';
            if(order_error_cancel){
                toastr.options =
                    {
                        "closeButton" : true,
                        "progressBar" : true
                    }
                toastr.error("Your payment has been cancelled.");
            }
        });
    </script>
@endsection
