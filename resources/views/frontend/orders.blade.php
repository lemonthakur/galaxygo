@extends('frontend.layout.master')
@section('title','Orders')

@section('content')

<section class="ic-order-area">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-5">
                <div class="ic-profile-left">
                    <div class="ic-user">
                        <div class="ic-cover-bg">
                            @if(auth()->user()->cover_photo)
                                <img id="cover_photo" src="{{asset(auth()->user()->cover_photo)}}" class="img-fluid" alt="cover">
                            @else
                                <img id="cover_photo" src="{{asset('frontend/images/profile-cover.png')}}" class="img-fluid" alt="default cover">
                            @endif
                        </div>
                        <div class="user-profile">
                            @if(auth()->user()->photo)
                                <img id="profile_pic" src="{{auth()->user()->photo}}" alt="user">
                            @else
                                <img id="profile_pic" src="{{asset('demo-pic/download.png')}}" alt="user">
                            @endif
                        </div>
                    </div>
                    <div class="ic-win-btn">
                        <a href="#">{{$entryWon ?? 00}} <span>Entries Won</span></a>
                        <a href="#">{{(int) auth()->user()->total_coin ?? 00}} <span>Coins Won</span></a>
                    </div>
                    <div class="ic-total-balance">
                        <p>Total Conis Balance</p>
                        <h4>{{(int) auth()->user()->current_coin ?? 00}}</h4>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-7">
                <div class="ic-order-right">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link " data-toggle="tab" href="#bidsApplied">Bids Applied</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#orders">Orders</a>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade" id="bidsApplied">
                            <div class="ic-order-tab-content">
                                <h4>Bid applied</h4>
                                @forelse($bid_applies as $bpv)
                                    <div class="ic-order-item @if($loop->iteration % 2 != 0){{'item-bg'}}@else{{'mobile-item-bg'}}@endif">
                                        <div class="image-title">
                                            <div class="image">
                                                <img src="{{asset('upload/product-thumbnail-82-82/'.$bpv->product_det->feature_image)}}" class="img-fluid" alt="">
                                            </div>
                                            <div class="title">
                                                <h5>{{$bpv->product_det->name}}</h5>
                                                <p>#{{$bpv->product_det->slug}}</p>
                                                <h5 class="m-price">price: <span>${{$bpv->user_bid_amount}}</span> </h5>
                                                <h5 class="m-date">Date: <span>{{ date('d/m/Y', strtotime($bpv->user_bid_date)) }}</span> </h5>
                                            </div>
                                        </div>
                                        <div class="price">
                                            <h5>Price</h5>
                                            <p>${{$bpv->user_bid_amount}}</p>
                                        </div>
                                        <div class="date">
                                            <h5>date</h5>
                                            <p>{{ date('d/m/Y', strtotime($bpv->user_bid_date)) }}</p>
                                        </div>
                                        <div class="status-btn">
                                            @if( $bpv->pwb_auction_end_date_time <= date('Y-m-d H:i:s'))

                                                @if($bpv->pwb_height_bider_id == \Auth::id())
                                                    @if($bpv->pwb_ordered == 'no')
                                                        <a href="{{ route('bid.checkout', encrypt($bpv->id)) }}" class="fulfilment-btn">Payment</a>
                                                    @elseif($bpv->pwb_ordered == 'yes' && $bpv->pwb_provied_to_user == 'yes')
                                                        <a href="javascript:void(0);" class="fulfilment-btn">Fulfilment</a>
                                                    @elseif($bpv->pwb_ordered == 'yes')
                                                        <a href="javascript:void(0);" class="fulfilment-btn">Ordered</a>
                                                    @endif
                                                @else
                                                    <a href="javascript:void(0);" class="cancle-btn">Canceled</a>
                                                @endif
                                            {{--if time not end--}}
                                            @else
                                                <a href="javascript:void(0);" class="pending-btn">Running</a>
                                            @endif

                                        </div>
                                    </div>
                                @empty
                                    <div class="ic-order-item mobile-item-bg">
                                        <p>No Bid Applied</p>
                                    </div>
                                @endforelse
                                <?php $bid_has_page =  1; /*$bid_has_page =  $bid_applies->lastPage();*/ ?>
                                <div class="ic-item-load-more @if($bid_has_page==1){{'d-none'}}@endif" id="bid_order_load_all">
                                    <a href="javascript:void(0)" id="bid_order_load"><i class="flaticon-loading"></i> load more</a>
                                </div>
                            </div>
                        </div>

                        <div class="tab-pane fade show active" id="orders">
                            <div class="ic-order-tab-content">
                                <h4>Order History</h4>
                                @forelse($orders as $odv)
                                    <div class="ic-order-item @if($loop->iteration % 2 != 0){{'item-bg'}}@else{{'mobile-item-bg'}}@endif">
                                        <div class="image-title">
                                            <div class="image">
                                                <img src="{{asset('upload/product-thumbnail-82-82/'.$odv->feature_image)}}" class="img-fluid" alt="">
                                            </div>
                                            <div class="title">
                                                <h5>{{$odv->product_name}}</h5>
                                                <p>#{{$odv->product_slug}}</p>
                                                <h5 class="m-price">price: <span>${{$odv->product_total}}</span> </h5>
                                                <h5 class="m-date">Date: <span>{{ date('d/m/Y', strtotime($odv->order_date)) }}</span> </h5>
                                            </div>
                                        </div>
                                        <div class="price">
                                            <h5>Price</h5>
                                            <p>${{$odv->product_total}}</p>
                                        </div>
                                        <div class="date">
                                            <h5>date</h5>
                                            <p>{{ date('d/m/Y', strtotime($odv->order_date)) }}</p>
                                        </div>
                                        <div class="status-btn">
                                            @if($odv->order_status == 'Pending')
                                                <a href="javascript:void(0);" class="pending-btn">Pending</a>
                                            @elseif($odv->order_status == 'Fulfilment')
                                                <a href="javascript:void(0);" class="fulfilment-btn">Fulfilment</a>
                                            @elseif($odv->order_status == 'Cancle')
                                                <a href="javascript:void(0);" class="cancle-btn">Canceled</a>
                                            @endif

                                        </div>
                                    </div>
                                @empty
                                    <div class="ic-order-item mobile-item-bg">
                                        <p>No orders found</p>
                                    </div>
                                @endforelse
                                <?php $has_page = 1; /*$has_page =  $orders->lastPage();*/ ?>
                                <div class="ic-item-load-more @if($has_page==1){{'d-none'}}@endif" id="order_load_all">
                                    <a href="javascript:void(0)" id="order_load"><i class="flaticon-loading"></i> load more</a>
                                </div>
                            </div>
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
        $(document).ready(function(){
            var csrf = "{{csrf_token()}}";
            var session_for_toa = '{{ Session::has('order_success') }}';
            var order_error = '{{ Session::has('order_error') }}';
            if(session_for_toa){
                toastr.options =
                    {
                        "closeButton" : true,
                        "progressBar" : true
                    }
                toastr.success("Order placed successfully.");
            }
            else if(order_error){
                toastr.options =
                    {
                        "closeButton" : true,
                        "progressBar" : true
                    }
                toastr.error("Order can not be placed. Please try again later.");
            }
        });

        // ajax order load more
        var page = 1;
        $(document).on('click', '#order_load', function(){
            page++;
            loadMoreData(page);
        });
        function loadMoreData(page){
            $.ajax(
                {
                    url: '?page=' + page+'&order=1',
                    type: "get",
                    beforeSend: function()
                    {
                        $("#loading").show();
                    }
                })
                .done(function(data)
                {
                    if(data.has_page == page){
                        $("#order_load_all").addClass('d-none');
                    }else{
                        $("#order_load_all").removeClass('d-none');
                    }
                    $("#loading").hide();
                    $( data.html ).insertBefore( "#order_load_all" );
                })
                .fail(function(jqXHR, ajaxOptions, thrownError)
                {
                    alert('server not responding...');
                });
        }

        // ajax order load more
        var bid_page = 1;
        $(document).on('click', '#bid_order_load', function(){
            bid_page++;
            loadMoreBidData(bid_page);
        });
        function loadMoreBidData(page){
            $.ajax(
                {
                    url: '?page=' + page+'&bid_order=1',
                    type: "get",
                    beforeSend: function()
                    {
                        $("#loading").show();
                    }
                })
                .done(function(data)
                {
                    if(data.bid_has_page == page){
                        $("#bid_order_load_all").addClass('d-none');
                    }else{
                        $("#bid_order_load_all").removeClass('d-none');
                    }
                    $("#loading").hide();
                    $( data.html ).insertBefore( "#bid_order_load_all" );
                })
                .fail(function(jqXHR, ajaxOptions, thrownError)
                {
                    alert('server not responding...');
                });
        }
    </script>
@endsection

