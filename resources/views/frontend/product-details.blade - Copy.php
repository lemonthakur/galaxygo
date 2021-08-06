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
                            $price = $product->price;
                            if($product->discount_amount)
                                $price = $product->price-$product->discount_amount;
                        @endphp
                        <h2 class="price">${{ number_format($price, 2) }}</h2>
                    </div>
                    <div class="description">
                        {!! $product->product_description !!}
                    </div>
                    <div class="ic-product-count-buy">
                        <div class="product-count">
                            <a href="javascript:void(0)" class="qty-minus custom_qty_minus"><i class="flaticon-minus"></i></a>
                            <input type="number" value="01" min="1" class="qty" readonly>
                            <a href="javascript:void(0)" class="qty-plus custom_qty_plus"><i class="flaticon-plus"></i></a>
                        </div>
                        <div class="ic-buy-now-btn custom-add-to-cart-par" data-id="{{$product->id}}" data-name="{{$product->name}}" data-price="{{$price}}"
                        data-discount="{{$product->discount_amount}}" data-image="{{$product->feature_image}}"
                        data-slug="{{$product->slug}}">
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
                                    <a href="javascript:void(0);" data-toggle="modal" data-target="#bidModal" class="icon-btn bid-lis"><i class="flaticon-time-left"></i></a>
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
            $(document).on("click", ".custom_add_to_cart", function(e){
            e.preventDefault();
            var csrf = "{{csrf_token()}}";

            var id         = $(this).parents().find('.custom-add-to-cart-par').attr('data-id');
            var name       = $(this).parents().find('.custom-add-to-cart-par').attr('data-name');
            var quantity   = $('.qty').val();
            var price      = $(this).parents().find('.custom-add-to-cart-par').attr('data-price');
            var discount   = $(this).parents().find('.custom-add-to-cart-par').attr('data-discount');
            var img_name   = $(this).parents().find('.custom-add-to-cart-par').attr('data-image');
            var slug       = $(this).parents().find('.custom-add-to-cart-par').attr('data-slug');

            // for popover
            var this_pov = $(this).parent().find(".fa-shopping-cart");
            $(this_pov).popover({
            placement : 'top',
            container: 'body',
            content : "Adding..."
            }).popover('show');

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
            },
            success:function (data) {
                window.location.href = "{{ route('shopping.cart')}}";
            }
            });

            });

        });
    </script>
@endsection