@extends('frontend.layout.master')
@section('title','Payment')

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
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="number" readonly value="" min="1" class="qty form-control" placeholder="Point to Pay">
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="ic-confirm-payment-btn">
                            @if($product_info)
                                <a href="javascript:void(0)" class="confirm_point_payment">Confirm Payment</a>
                            @endif
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-md-5">
                <div class="ic-total-cart">
                    <h2>Total cart</h2>
                    <?php $total_price = 0; ?>
                    @if($product_info)
                        <div class="total-cart-item">
                            <div class="image-title">
                                <div class="image">
                                    <img src="{{asset('upload/product-thumbnail-82-82/'.$product_info->product_det->feature_image)}}" alt="">
                                </div>
                                <div class="title">
                                    <h4>{{$product_info->product_det->name}}</h4>
                                    <p>#{{$product_info->product_det->slug}}</p>
                                    <p class="mobile-price">Price: ${{$product_info->height_bid_amount}}</p>
                                </div>
                            </div>
                            <div class="price">
                                <p>Price</p>
                                <span>${{$product_info->height_bid_amount}}</span>
                            </div>
                        </div>
                        <?php $total_price += $product_info->height_bid_amount; ?>
                    @endif

                    <div class="ic-coupon-input">
                        <input type="text" class="form-control" placeholder="Coupon Or Discount Code">
                        <a href="#" class="ic-btn">apply</a>
                    </div>
                    <div class="ic-total-amount-calculate">
                        <div class="ic-subtotal">
                            <h5>subtotal</h5>
                            <h4>${{$total_price}}</h4>
                        </div>
                        <div class="ic-shipping-charge-amount">
                            <div class="shipping-charge">
                                <h5>Shipping Charge</h5>
                                <p>Calculate Shipping Charge</p>
                            </div>
                            <h4>
                                <?php $shipping_cost = $product_info->product_det->deliver_charge; ?>
                                ${{$shipping_cost}}
                            </h4>
                        </div>
                        <div class="ic-total-amount">
                            <h5>TOTAL</h5>
                            <h4>${{$total_price + $shipping_cost}}</h4>
                            <?php $totla_usd = $total_price+$shipping_cost; ?>
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
            var auc_bit_id   = "{{ request()->segment(count(request()->segments())) }}";
            $("#loading").show();

            $.ajax({
                type:'post',
                url: "{{route('checkout-bid-point.payment')}}",
                data:{
                _token:csrf,
                point_amount:point_amount,
                auc_bit_id:auc_bit_id,
            },
                success:function (data) {

                    if(data.point_less=='yes'){
                        $("#loading").hide();
                        toastr.options =
                            {
                                "closeButton" : true,
                                "progressBar" : true
                            }
                        toastr.error("You don't have sufficient point to place this order.");
                    }
                    else if(data.payment_error=='yes'){
                        $("#loading").hide();
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
