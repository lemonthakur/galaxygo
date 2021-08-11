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

<section class="ic-product-details-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-6">
                <div class="ic-product-details-left">
                    @if(empty($product->video_url))
                        <div class="product-details-image easyzoom easyzoom--overlay">
                            <a href="{{asset('upload/product-feature-image/'.$product->feature_image)}}" class="">
                                <img src="{{asset('upload/product-thumbnail-634-512/'.$product->feature_image)}}" class="img-fluid" alt="product-details">
                            </a>
                        </div>
                    @else
                        <video id="my-video" class="video-js" controls preload="auto" poster="{{asset('upload/product-thumbnail-634-512/'.$product->feature_image)}}" data-setup="{}">
                            <source src="{{ $product->video_url }}" type="video/mp4">
                            </source>
                            <source src="{{ $product->video_url }}" type="video/webm">
                            </source>
                            <source src="{{ $product->video_url }}" type="video/ogg">
                            </source>
                        </video>
                    @endif
                </div>
            </div>
            <div class="col-lg-5 col-md-6">
                <div class="ic-product-details-right">
                    <div class="title-price">
                        <h2 class="title">{{ $product->name }}</h2>
                        @php
                            $price = $product->price;
                            if($product->discount_amount)
                                $price = $product->price-$product->discount_amount;
                        @endphp
                        <h2 class="price">${{ number_format($price, 2) }}</h2>
                    </div>
                    <div class="description">
                        {!! $product->product_description !!}
                    </div>
                    {{--for auction product--}}
                    @if( $product->auction_end_date.' '.$product->auction_end_time >= date('Y-m-d H:i:s'))
                        <div class="ic-product-count-buy">
                            <div class="product-count bid-product-count">
                                <input type="number" value="{{ Session::get("bid_amo", $bidder_info ? $bidder_info->bid_amount:'') }}" min="1" class="qty"  style="padding-left: 0;">
                            </div>
                            <div class="ic-buy-now-btn custom-add-to-cart-par" data-id="{{$product->id}}" data-name="{{$product->name}}" data-price="{{$price}}"
                                 data-discount="{{$product->discount_amount}}" data-image="{{$product->feature_image}}"
                                 data-slug="{{$product->slug}}" data-starting-bid-amount="{{$product->starting_bid_amount}}">
                                <a href="javasceipt:void(0);" class="ic-btn ic-btn-golden2 custom_product_bid">place bid</a>
                            </div>
                        </div>
                        <small class="text-white">Enter ${{number_format($product->starting_bid_amount, 2)}} or more</small>
                        <div class="description mt-0">
                            <strong class="text-white">Conditions: -</strong>
                            <?php
                            $end_date = new \Carbon\Carbon($product->auction_end_date.' '.$product->auction_end_time);
                            $now = \Carbon\Carbon::now();
                            $difference = $end_date->diffInHours($now);
                            $divi = explode(".", number_format((float)($difference/24), 2, '.', ''));
                            $days = isset($divi[0]) ? $divi[0] : 0;
                            $conver_to_dec = isset($divi[1]) ? '.'.$divi[1] : 0;
                            $hours = isset($divi[1]) ? round($conver_to_dec*24) : 0;
                            ?>
                            <small class="text-white">Time left: {{ $days.'d' }} {{ strlen($hours)==1 ? '0'.$hours.'h' : $hours.'h' }}</small>&nbsp;&nbsp;&nbsp;
                        </div>
                        <?php Session::forget(["bid_amo", "pro_dir_url"]); ?>
                    @endif
                    {{--end auction product--}}

                    <div class="ic-product-count-buy">
                        <div class="product-count">
                            <a href="javascript:void(0)" class="qty-minus custom_qty_minus"><i class="flaticon-minus"></i></a>
                            <input type="number" value="01" min="1" class="qty" readonly>
                            <a href="javascript:void(0)" class="qty-plus custom_qty_plus"><i class="flaticon-plus"></i></a>
                        </div>
                        <div class="ic-buy-now-btn custom-add-to-cart-par" data-id="{{$product->id}}" data-name="{{$product->name}}" data-price="{{$price}}"
                        data-discount="{{$product->discount_amount}}" data-image="{{$product->feature_image}}"
                        data-slug="{{$product->slug}}" data-delivery-charge="{{$product->deliver_charge}}">
                            <a href="{{ route('shopping.cart') }}" class="ic-btn ic-btn-golden2 custom_add_to_cart">buy now</a>
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
            @forelse($related_products as $apk => $apv)
                <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                    <div class="ic-product-item">
                        <div class="ic-thumbnil">
                            <a href="{{ route('product-details', $apv->slug) }}"><img src="{{asset('upload/product-thumbnail-255-200/'.$apv->feature_image)}}" class="img-fluid" alt="product"></a>
                            @if($apv->remaining_qty<1)
                                <span class="ic-badge">over</span>
                            @endif
                        </div>
                        <div class="ic-content">
                            <div class="title-price">

                                <a href="{{ route('product-details', $apv->slug) }}">
                                    <h5>{{ $apv->name }}</h5>
                                    @php
                                        $price = $apv->price;
                                        if($apv->discount_amount)
                                            $price = $apv->price-$apv->discount_amount;
                                    @endphp
                                    <p>${{ number_format($price, 2) }}</p>
                                </a>
                            </div>
                            <div class="ic-btn-group custom-add-to-cart-par" data-id="{{$apv->id}}" data-name="{{$apv->name}}" data-price="{{$price}}"
                                 data-discount="{{$apv->discount_amount}}" data-image="{{$apv->feature_image}}"
                                 data-slug="{{$apv->slug}}" data-delivery-charge="{{$apv->deliver_charge}}">
                                <input type="hidden" class="qty" value="1">
                                <a href="{{route('shopping.cart')}}" class="buy-btn custom_add_to_cart">buy now</a>
                                @if( $apv->auction_end_date.' '.$apv->auction_end_time >= date('Y-m-d H:i:s'))
                                    <a href="{{ route('product-details', $apv->slug) }}" class="bid-btn">bid now</a>
                                    <a href="javascript:void(0);" data-toggle="modal" data-target="#bidModal" class="icon-btn bid-list"><i class="flaticon-time-left"></i></a>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            @empty

            @endforelse

        </div>
    </div>
</section>

@endsection

@section('js')
    <script src="{{asset("/admin-lte/plugins/jquery/jquery.min.js")}}"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $(document).on("click", ".custom_add_to_cart", function(e){
            e.preventDefault();
            var csrf = "{{csrf_token()}}";

            var id         = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-id');
            var name       = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-name');
            var quantity   = $(this).parent().parent().find('.qty').val();
            var price      = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-price');
            var discount   = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-discount');
            var img_name   = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-image');
            var slug       = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-slug');
            var delivery_charge = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-delivery-charge');

            $.ajax({
                type:'post',
                url: "{{route('cart.add')}}",
                data:{
                _token:csrf,
                id:id,
                name:name,
                quantity:quantity,
                price:price,
                discount:discount,
                img_name:img_name,
                slug:slug,
                delivery_charge:delivery_charge,
            },
            success:function (data) {
                window.location.href = "{{ route('shopping.cart')}}";
            }
            });

            });

        $(document).ready(function(){
            $(document).on("click", ".custom_product_bid", function(e){
                e.preventDefault();

                var csrf            = "{{csrf_token()}}";
                var id              = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-id');
                var amount          = $(this).parent().parent().find('.qty').val();
                var user_id         = '{{ \Auth::check() }}';
                var data_starting_bid_amount = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-starting-bid-amount');

                if(amount == '' || amount <= 0){
                    $(".ic-product-details-right .ic-product-count-buy .bid-product-count").addClass('quantityError');
                    return false;
                }else{
                    $(".ic-product-details-right .ic-product-count-buy .bid-product-count").removeClass('quantityError');
                    if(data_starting_bid_amount > amount){
                        toastr.options =
                            {
                                "closeButton" : true,
                                "progressBar" : true
                            }
                        toastr.error("Please enter amount $"+data_starting_bid_amount+" or more.");
                        return false;
                    }
                }

                if(user_id !=1){
                    var redirect_url = "{{ route('login') }}";
                    var product_det = "{{ $product->slug }}";
                    window.location.href = redirect_url+'?pro_dir_url='+product_det+'&bid_amo='+amount;
                    return false;
                }
                $("#loading").show();

                $.ajax({
                    type:'post',
                    url: "{{route('bid-product-cart.add')}}",
                    data:{
                        _token:csrf,
                        id:id,
                        amount:amount,
                    },
                    success:function (data) {
                        //window.location.href = "{{ route('bid-product-cart.add')}}";
                        if(data=='true'){
                            toastr.options =
                                {
                                    "closeButton" : true,
                                    "progressBar" : true
                                }
                            toastr.success("Bid added successfully.");
                        }else{
                            if(data=='blnc_less'){
                                toastr.options =
                                    {
                                        "closeButton": true,
                                        "progressBar": true
                                    }
                                toastr.error("Please enter amount $"+data_starting_bid_amount+" or more.");
                            }else {
                                toastr.options =
                                    {
                                        "closeButton": true,
                                        "progressBar": true
                                    }
                                toastr.error("Something went wrong. Bid can not added at this moment. Please contact with admin.");
                            }
                        }
                        $("#loading").hide();
                    }
                });
            });
            $(document).on("input", ".qty", function(e){
                var val_amount = $(this).val();
                if(val_amount == '' || val_amount <= 0){
                    //$(".ic-product-details-right .ic-product-count-buy .bid-product-count").addClass('quantityError');
                }else{
                    $(".ic-product-details-right .ic-product-count-buy .bid-product-count").removeClass('quantityError');
                }
            });

        });

        });
    </script>
@endsection
