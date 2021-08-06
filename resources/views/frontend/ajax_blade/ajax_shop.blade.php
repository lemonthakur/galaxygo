@if($product_lists)

    @foreach ($product_lists as $apk => $apv)
        <div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
            <div class="ic-product-item">
                <div class="ic-thumbnil">
                    <a href="{{ route('product-details', $apv->slug) }}">
                    <img src="{{ asset('upload/product-thumbnail-255-200/'.$apv->feature_image) }}"
                    class="img-fluid" alt="product"></a>
                    <span class="ic-badge">over</span>
                </div>
                <div class="ic-content">
                    <div class="title-price">
                        <a href="{{ route('product-details', $apv->slug) }}">
                            <h5>{{ $apv->name }}</h5>
                            <?php
                                $price = $apv->price;
                                if($apv->discount_amount)
                                    $price = $apv->price-$apv->discount_amount;
                            ?>
                            <p>${{ number_format($price, 2) }}</p>
                        </a>
                    </div>
                    <div class="ic-btn-group">
                        @if($apv->product_type=='General Product')
                            <a href="{{ route('shopping.cart') }}" class="buy-btn">buy now</a>
                        @else
                            <a href="javascript:void(0)" class="bid-btn">bid now</a>
                            <a href="javascript:void(0)" data-toggle="modal" data-target="#bidModal" class="icon-btn"><i class="flaticon-time-left"></i></a>
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