@if($product_lists)

    @foreach ($product_lists as $apk => $apv)
        <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
            <div class="ic-product-item">
                <div class="ic-thumbnil">
                    <a href="{{route('product-details', $apv->slug)}}"><img src="{{asset('upload/product-thumbnail-255-200/'.$apv->feature_image)}}" class="img-fluid" alt="product"></a>
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
                    <div class="ic-btn-group  custom-add-to-cart-par" data-id="{{$apv->id}}" data-name="{{$apv->name}}" data-price="{{$price}}"
                         data-discount="{{$apv->discount_amount}}" data-image="{{$apv->feature_image}}"
                         data-slug="{{$apv->slug}}" data-delivery-charge="{{$apv->deliver_charge}}">
                        @if($apv->remaining_qty>0)
                            <a href="{{route('shopping.cart')}}" class="buy-btn custom_add_to_cart">buy now</a>
                        @endif
                        @if( $apv->auction_end_date.' '.$apv->auction_end_time >= date('Y-m-d H:i:s'))
                            <a href="{{ route('product-details', $apv->slug) }}" class="bid-btn">bid now</a>
                            <a href="javascript:void(0);" data-toggle="modal" data-target="#bidModal" class="icon-btn bid-list"><i class="flaticon-time-left"></i></a>
                        @endif
                    </div>
                </div>
            </div>
        </div>
    @endforeach

    <div class="col-md-12">
        <div class="ic-pagination">
            {{$product_lists->links('vendor.pagination.frontend')}}
        </div>
    </div>

@else
    <div class="col-md-12 text-center"><span class="text-danger">Product not available.</span></div>
@endif