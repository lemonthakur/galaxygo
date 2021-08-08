@extends('frontend.layout.master')
@section('title','Home')

@section('css')
    <style type="text/css">
        /* Chrome, Safari, Edge, Opera */
        .bid input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

        /* Firefox */
        .bid input[type=number] {
            -moz-appearance: textfield;
        }

        .ic-product-details-right .ic-product-count-buy .quantityError{
            border: 1px solid #f52f2f !important;
        }
    </style>
@endsection

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
                                    <!-- <div class="col-12">
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
                                    </div> -->
                                    <!-- <div class="col-md-6">
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
                                    </div> -->
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="number" readonly value="" min="1" class="qty form-control" placeholder="Point to Pay">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="ic-confirm-payment-btn">
                            <a href="javascript:void(0)" class="confirm_point_payment">Confirm Payment</a>
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
                            <?php $totla_usd = Cart::subtotal()+$shipping_cost; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

@section('js')
    <script src="{{asset("/admin-lte/plugins/jquery/jquery.min.js")}}"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var totla_usd = '{{ $totla_usd }}';
            var totla_point_to_pay = (totla_usd*100);
            $(".qty").val(totla_point_to_pay);
        });

        $(document).on("click", ".confirm_point_payment", function(e){
            e.preventDefault();
            var csrf = "{{csrf_token()}}";
            var point_amount = $(".qty").val();
            $("#loading").show();

            $.ajax({
                type:'post',
                url: "{{route('checkout-point.payment')}}",
                data:{
                _token:csrf,
                point_amount:point_amount,
            },
                success:function (data) {
                    $("#loading").hide();
                    if(data.point_less=='yes'){
                        toastr.options =
                            {
                                "closeButton" : true,
                                "progressBar" : true
                            }
                        toastr.error("You don't have sufficient point to place this order.");
                    }
                    else if(data.payment_error=='yes'){
                        toastr.options =
                            {
                                "closeButton" : true,
                                "progressBar" : true
                            }
                        toastr.error("Something went wrong. Please tyr again later.");
                    }
                    else if(data.order_placed=='yes'){
                        window.location.href = "{{ route('orders')}}";
                    }


                }
            });

        });

    </script>
@endsection
