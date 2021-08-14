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
    
@endforelse