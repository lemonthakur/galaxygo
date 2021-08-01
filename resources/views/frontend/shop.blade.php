@extends('frontend.layout.master')
@section('title','Home')

@section('content')
@include('frontend.include.profile-header')

<div class="modal fade" id="bidModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content ic-bid-modal-content">
            <div class="modal-header ic-bid-modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Bids For Apple Watch</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true"><i class="flaticon-error"></i></span>
                </button>
            </div>
            <div class="modal-body ic-bid-modal">
                <div class="ic-bid-modal-body">
                    <div class="ic-table-warper">
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">time</th>
                                <th scope="col">amount</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>24 Oct, 2021 / 10:30 PM</td>
                                <td>$110</td>
                            </tr>
                            <tr>
                                <td>24 Oct, 2021 / 10:30 PM</td>
                                <td>$110</td>
                            </tr>
                            <tr>
                                <td>24 Oct, 2021 / 10:30 PM</td>
                                <td>$110</td>
                            </tr>
                            <tr>
                                <td>24 Oct, 2021 / 10:30 PM</td>
                                <td>$110</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

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
                                    <a href="{{route('product-details', $apv->slug)}}">
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
                                     data-slug="{{$apv->slug}}">
                                    @if($apv->product_type=='General Product')
                                        <a href="{{route('shopping.cart')}}" class="buy-btn custom_add_to_cart">buy now</a>
                                    @else
                                        <a href="#" class="bid-btn">bid now</a>
                                        <a href="#" data-toggle="modal" data-target="#bidModal" class="icon-btn"><i class="flaticon-time-left"></i></a>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-md-12 text-center"><span class="text-danger">Product not available.</span></div>
                @endforelse
                    {{--<!--Item 1-->
                    <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                        <div class="ic-product-item">
                            <div class="ic-thumbnil">
                                <a href="{{route('product-details')}}"><img src="{{asset('frontend/images/product/product-1.png')}}" class="img-fluid" alt="product"></a>
                                <span class="ic-badge">over</span>
                            </div>
                            <div class="ic-content">
                                <div class="title-price">
                                    <a href="{{route('product-details')}}">
                                        <h5>apple watch</h5>
                                        <p>$400.00</p>
                                    </a>
                                </div>
                                <div class="ic-btn-group">
                                    <a href="{{route('cart')}}" class="buy-btn">buy now</a>
                                    <a href="#" class="bid-btn">bid now</a>
                                    <a href="#" data-toggle="modal" data-target="#bidModal" class="icon-btn"><i class="flaticon-time-left"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Item 2-->
                    <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                        <div class="ic-product-item">
                            <div class="ic-thumbnil">
                                <a href="{{route('product-details')}}"><img src="{{asset('frontend/images/product/product-2.png')}}" class="img-fluid" alt="product"></a>
                                <span class="ic-badge">over</span>
                            </div>
                            <div class="ic-content">
                                <div class="title-price">
                                    <a href="{{route('product-details')}}">
                                        <h5>apple watch</h5>
                                        <p>$400.00</p>
                                    </a>
                                </div>
                                <div class="ic-btn-group">
                                    <a href="{{route('cart')}}" class="buy-btn">buy now</a>
                                    <a href="#" class="bid-btn">bid now</a>
                                    <a href="#" data-toggle="modal" data-target="#bidModal" class="icon-btn"><i class="flaticon-time-left"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Item 3-->
                    <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                        <div class="ic-product-item">
                            <div class="ic-thumbnil">
                                <a href="{{route('product-details')}}><img src="{{asset('frontend/images/product/product-3.png')}}" class="img-fluid" alt="product"></a>
                                <span class="ic-badge">over</span>
                            </div>
                            <div class="ic-content">
                                <div class="title-price">
                                    <a href="{{route('product-details')}}">
                                        <h5>apple watch</h5>
                                        <p>$400.00</p>
                                    </a>
                                </div>
                                <div class="ic-btn-group">
                                    <a href="{{route('cart')}}" class="buy-btn">buy now</a>
                                    <a href="#" class="bid-btn">bid now</a>
                                    <a href="#" data-toggle="modal" data-target="#bidModal" class="icon-btn"><i class="flaticon-time-left"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Item 4-->
                    <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                        <div class="ic-product-item">
                            <div class="ic-thumbnil">
                                <a href="{{route('product-details')}}"><img src="{{asset('frontend/images/product/product-4.png')}}" class="img-fluid" alt="product"></a>
                                <span class="ic-badge">over</span>
                            </div>
                            <div class="ic-content">
                                <div class="title-price">
                                    <a href="{{route('product-details')}}">
                                        <h5>apple watch</h5>
                                        <p>$400.00</p>
                                    </a>
                                </div>
                                <div class="ic-btn-group">
                                    <a href="{{route('cart')}}" class="buy-btn">buy now</a>
                                    <a href="#" class="bid-btn">bid now</a>
                                    <a href="#" data-toggle="modal" data-target="#bidModal" class="icon-btn"><i class="flaticon-time-left"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Item 5-->
                    <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                        <div class="ic-product-item">
                            <div class="ic-thumbnil">
                                <a href="{{route('product-details')}}"><img src="{{asset('frontend/images/product/product-5.png')}}" class="img-fluid" alt="product"></a>
                                <span class="ic-badge">over</span>
                            </div>
                            <div class="ic-content">
                                <div class="title-price">
                                    <a href="{{route('product-details')}}">
                                        <h5>apple watch</h5>
                                        <p>$400.00</p>
                                    </a>
                                </div>
                                <div class="ic-btn-group">
                                    <a href="{{route('cart')}}" class="buy-btn">buy now</a>
                                    <a href="#" class="bid-btn">bid now</a>
                                    <a href="#" data-toggle="modal" data-target="#bidModal" class="icon-btn"><i class="flaticon-time-left"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Item 6-->
                    <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                        <div class="ic-product-item">
                            <div class="ic-thumbnil">
                                <a href="{{route('product-details')}}"><img src="{{asset('frontend/images/product/product-6.png')}}" class="img-fluid" alt="product"></a>
                                <span class="ic-badge">over</span>
                            </div>
                            <div class="ic-content">
                                <div class="title-price">
                                    <a href="{{route('product-details')}}">
                                        <h5>apple watch</h5>
                                        <p>$400.00</p>
                                    </a>
                                </div>
                                <div class="ic-btn-group">
                                    <a href="{{route('cart')}}" class="buy-btn">buy now</a>
                                    <a href="#" class="bid-btn">bid now</a>
                                    <a href="#" data-toggle="modal" data-target="#bidModal" class="icon-btn"><i class="flaticon-time-left"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Item 7-->
                    <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                        <div class="ic-product-item">
                            <div class="ic-thumbnil">
                                <a href="{{route('product-details')}}"><img src="{{asset('frontend/images/product/product-7.png')}}" class="img-fluid" alt="product"></a>
                                <span class="ic-badge">over</span>
                            </div>
                            <div class="ic-content">
                                <div class="title-price">
                                    <a href="{{route('product-details')}}">
                                        <h5>apple watch</h5>
                                        <p>$400.00</p>
                                    </a>
                                </div>
                                <div class="ic-btn-group">
                                    <a href="{{route('cart')}}" class="buy-btn">buy now</a>
                                    <a href="#" class="bid-btn">bid now</a>
                                    <a href="#" data-toggle="modal" data-target="#bidModal" class="icon-btn"><i class="flaticon-time-left"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Item 8-->
                    <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                        <div class="ic-product-item">
                            <div class="ic-thumbnil">
                                <a href="{{route('product-details')}}"><img src="{{asset('frontend/images/product/product-8.png')}}" class="img-fluid" alt="product"></a>
                                <span class="ic-badge">over</span>
                            </div>
                            <div class="ic-content">
                                <div class="title-price">
                                    <a href="{{route('product-details')}}">
                                        <h5>apple watch</h5>
                                        <p>$400.00</p>
                                    </a>
                                </div>
                                <div class="ic-btn-group">
                                    <a href="{{route('cart')}}" class="buy-btn">buy now</a>
                                    <a href="#" class="bid-btn">bid now</a>
                                    <a href="#" data-toggle="modal" data-target="#bidModal" class="icon-btn"><i class="flaticon-time-left"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--Item End-->--}}
            </div>
            <div class="ic-pagination">
                <ul>
                    <li><a href="#">01</a></li>
                    <li><a href="#">02</a></li>
                    <li><a href="#" class="active">03</a></li>
                    <li><a href="#">04</a></li>
                    <li><a href="#">05</a></li>
                </ul>
            </div>
        </div>
    </div>
</section>

@endsection

@section('js')
    <script>
        $(document).ready(function(){
            var csrf = "{{csrf_token()}}";
            $(document).on("click", ".all-pro", function(){
                $("#loading").show();
                ajax_call_for_product('all-pro');
            });

            $(document).on("click", ".new-pro", function(){
                $("#loading").show();
                ajax_call_for_product('new-pro');
            });

            $(document).on("click", ".fea-pro", function(){
                $("#loading").show();
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

                var id         = $(this).parents().find('.custom-add-to-cart-par').attr('data-id');
                var name       = $(this).parents().find('.custom-add-to-cart-par').attr('data-name');
                var quantity   = 1;
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