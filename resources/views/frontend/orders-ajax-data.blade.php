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
    
@endforelse