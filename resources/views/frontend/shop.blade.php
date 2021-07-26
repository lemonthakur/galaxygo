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
                <a href="#" class="ic-btn ic-active-link active">all products</a>
                <a href="#" class="ic-btn ic-active-link">new products</a>
                <a href="#" class="ic-btn ic-active-link">feature products</a>
            </div>
        </div>
        <div class="ic-product-warper">
            <div class="row">
                <!--Item 1-->
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
                <!--Item End-->
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
