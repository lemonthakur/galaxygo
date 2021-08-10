@extends('frontend.layout.master')
@section('title','Home')

@section('content')

<section class="ic-product-banner-area">
    <div class="container">
        <div class="ic-product-banner owl-carousel">
            <!--Item 1-->
            <div class="item" style="background-image: url('{{asset('frontend/images/product/slider-1.png')}}');">
                <div class="row">
                    <div class="col-lg-5 col-md-8  offset-lg-6">
                        <div class="content">
                            <h1>Fashion <span> Leather shoes</span></h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas ultrices venenatis, at nulla. </p>
                            <a href="#" class="ic-btn">buy now</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--Item 2-->
            <div class="item" style="background-image: url('{{asset('frontend/images/product/slider-1.png')}}');">
                <div class="row">
                    <div class="col-lg-5 col-md-8  offset-lg-6">
                        <div class="content">
                            <h1>Fashion <span> Leather shoes</span></h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas ultrices venenatis, at nulla. </p>
                            <a href="#" class="ic-btn">buy now</a>
                        </div>
                    </div>
                </div>
            </div>
            <!--Item 3-->
            <div class="item" style="background-image: url('{{asset('frontend/images/product/slider-1.png')}}');">
                <div class="row">
                    <div class="col-lg-5 col-md-8  offset-lg-6">
                        <div class="content">
                            <h1>Fashion <span> Leather shoes</span></h1>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Egestas ultrices venenatis, at nulla. </p>
                            <a href="#" class="ic-btn">buy now</a>
                        </div>
                    </div>
                </div>
            </div>

            <!--Item End-->
        </div>
    </div>
</section>

<section class="ic-our-product-area">
    <div class="container">
        <div class="ic-our-product-filter">
            <div class="ic-heading">
                <h2>our products</h2>
            </div>
            <div class="ic-filter-btn">
                <a href="javascript:void(0)" class="ic-btn ic-active-link all-pro active">all products</a>
                <a href="javascript:void(0)" class="ic-btn ic-active-link new-pro">new products</a>
                <a href="javascript:void(0)" class="ic-btn ic-active-link fea-pro">feature products</a>
            </div>
        </div>
        <div class="ic-product-warper">
            <div class="row" id="product_list">
                @forelse($all_products as $apk => $apv)
                    <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                        <div class="ic-product-item">
                            <div class="ic-thumbnil">
                                <a href="{{route('product-details', $apv->slug)}}"><img src="{{asset('upload/product-thumbnail-255-200/'.$apv->feature_image)}}" class="img-fluid" alt="product"></a>
                                <span class="ic-badge">over</span>
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
                                <div class="ic-btn-group  custom-add-to-cart-par" data-id="{{$apv->id}}" data-name="{{$apv->name}}" data-price="{{$price}}"
                                     data-discount="{{$apv->discount_amount}}" data-image="{{$apv->feature_image}}"
                                     data-slug="{{$apv->slug}}" data-delivery-charge="{{$apv->deliver_charge}}">
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
                    <div class="col-md-12 text-center"><span class="text-danger">Product not available.</span></div>
                @endforelse

                <div class="col-md-12">
                    <div class="ic-pagination">
                        {{$all_products->links('vendor.pagination.frontend')}}
                    </div>
                </div>
            </div>

        </div>
    </div>
</section>

@endsection

@section('js')
    <script>
        $(document).ready(function(){
            var csrf = "{{csrf_token()}}";
            var req_type = 'all-pro';
            $(document).on("click", ".all-pro", function(){
                $("#loading").show();
                req_type = 'all-pro';
                ajax_call_for_product('all-pro');
            });

            $(document).on("click", ".new-pro", function(){
                $("#loading").show();
                req_type = 'new-pro';
                ajax_call_for_product('new-pro');
            });

            $(document).on("click", ".fea-pro", function(){
                $("#loading").show();
                req_type = 'fea-pro';
                var ret_val = ajax_call_for_product('fea-pro');
            });

            function ajax_call_for_product(type){
                $.ajax({
                    type:'post',
                    url: "{{route('ajax-pro.list')}}",
                    data:{
                        _token:csrf,
                        pro_type:type,
                    },
                    success:function (data) {
                        $("#product_list").empty();
                        $("#product_list").html(data);
                        $("#loading").hide();
                    }
                });
            }

            $(document).on("click", ".custom_add_to_cart", function(e){
                e.preventDefault();
                var csrf = "{{csrf_token()}}";
                $("#loading").show();

                var id         = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-id');
                var name       = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-name');
                var quantity   = 1;
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

            $(document).on('click', '.ic-pagination > ul > li > a', function(event){
                event.preventDefault();
                $("#loading").show();
                var page = $(this).attr('href').split('page=')[1];
                fetch_data(page);
            });

            function fetch_data(page)
            {
                $.ajax({
                    url:"{{ route('ajax-pro.list') }}",
                    method:"POST",
                    data:{_token:csrf, page:page, pro_type: req_type},
                    success:function(data)
                    {
                        $("#product_list").empty();
                        $("#product_list").html(data);
                        $("#loading").hide();
                    }
                });
            }

        });
    </script>
@endsection
