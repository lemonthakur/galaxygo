@extends('frontend.layout.master')
@section('title','Product derails')

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
        border: 1px solid #f52f2f;
    }
</style>
@endsection

@section('content')
@include('frontend.include.profile-header')

<section class="ic-product-details-area bid">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 col-md-6">
                <div class="ic-product-details-left">
                    <div class="product-details-image easyzoom easyzoom--overlay">
                        <a href="{{asset('upload/product-feature-image/'.$product->feature_image)}}" class="">
                            <img src="{{asset('upload/product-thumbnail-634-512/'.$product->feature_image)}}" class="img-fluid" alt="product-details">
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 col-md-6">
                <div class="ic-product-details-right">
                    <div class="title-price">
                        <h2 class="title">{{ $product->name }}</h2>
                        @php
                            $price = $product->starting_bid_amount;
                            /*if($product->discount_amount)
                                $price = $product->price-$product->discount_amount;*/
                        @endphp
                        <h2 class="price">Starting Bid: ${{ number_format($price, 2) }}</h2>
                    </div>
                    <div class="description">
                        {!! $product->product_description !!}
                    </div>
                    <div class="ic-product-count-buy">
                        <div class="product-count">
                            <input type="number" value="" min="1" class="qty"  style="padding-left: 0;">
                        </div>
                        <div class="ic-buy-now-btn custom-add-to-cart-par" data-id="{{$product->id}}" data-name="{{$product->name}}" data-price="{{$price}}"
                        data-discount="{{$product->discount_amount}}" data-image="{{$product->feature_image}}"
                        data-slug="{{$product->slug}}">
                            <a href="javasceipt:void(0);" class="ic-btn ic-btn-golden2 custom_product_bid">place bid</a>
                        </div>
                    </div>
                    <small class="text-white">Enter ${{number_format($price, 2)}} or more</small>
                    <div class="description">
                        <strong class="text-white">Conditions: -</strong><br>
                        <?php
                            $end_date = new \Carbon\Carbon($product->auction_end_date.' '.$product->auction_end_time);
                            $now = \Carbon\Carbon::now();
                            $difference = $end_date->diffInHours($now);
                            $divi = explode(".", number_format((float)($difference/24), 2, '.', ''));
                            $days = isset($divi[0]) ? $divi[0] : 0;
                            $hours = isset($divi[1]) ? $divi[1] : 0;
                        ?>
                        @if($end_date >= $now)
                        <small class="text-white">Time left: {{ $days.'d' }} {{ strlen($hours)==1 ? '0'.$hours.'h' : $hours.'h' }}</small>&nbsp;&nbsp;&nbsp;
                        @endif
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
                <?php $detail_url = route('product-details', $apv->slug); ?>
                @if($apv->product_type=='General Product')
                    <?php $detail_url = route('product-details', $apv->slug); ?>
                @else
                    <?php $detail_url = route('product-details.bid', $apv->slug); ?>
                @endif
                <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                    <div class="ic-product-item">
                        <div class="ic-thumbnil">
                            <a href="{{ $detail_url }}"><img src="{{asset('upload/product-thumbnail-255-200/'.$apv->feature_image)}}" class="img-fluid" alt="product"></a>
                            <span class="ic-badge">over</span>
                        </div>
                        <div class="ic-content">
                            <div class="title-price">
                                <a href="{{ $detail_url }}">
                                    <h5>{{ $apv->name }}</h5>
                                    @php
                                        $price = $apv->price;
                                        if($apv->discount_amount)
                                            $price = $apv->price-$apv->discount_amount;
                                    @endphp
                                    <p>${{ number_format($price, 2) }}</p>
                                </a>
                            </div>
                            <div class="ic-btn-group">
                                @if($apv->product_type=='General Product')
                                    <a href="{{route('shopping.cart')}}" class="buy-btn">buy now</a>
                                @else
                                    <a href="{{ route('product-details.bid', $apv->slug) }}" class="bid-btn">bid now</a>
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
    <script>
        $(document).ready(function(){
            $(document).on("click", ".custom_product_bid", function(e){
                e.preventDefault();

                var csrf   = "{{csrf_token()}}";
                var id     = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-id');
                var amount = $(this).parent().parent().find('.qty').val();
                var user_id = '{{ \Auth::check() }}';

                if(user_id !=1){
                    alert('Please login first.');
                    return false;
                }

                if(amount == '' || amount <= 0){
                    $(".ic-product-details-right .ic-product-count-buy .product-count").addClass('quantityError');
                    return false;
                }else{
                    $(".ic-product-details-right .ic-product-count-buy .product-count").removeClass('quantityError');
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
                            alert('Bid addred successfully.');
                        }else{
                            alert('Bid can not added at this moment.');
                        }
                        $("#loading").hide();
                    }
                });
            });
            $(document).on("input", ".qty", function(e){
                var val_amount = $(this).val();
                if(val_amount == '' || val_amount <= 0){
                    $(".ic-product-details-right .ic-product-count-buy .product-count").addClass('quantityError');
                }else{
                    $(".ic-product-details-right .ic-product-count-buy .product-count").removeClass('quantityError');
                }
            });

        });
    </script>
@endsection
