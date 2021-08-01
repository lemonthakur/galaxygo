@extends('frontend.layout.master')
@section('title','Home')

@section('content')
@include('frontend.include.profile-header')

<section class="ic-cart-area">
    <div class="container">
        <form action="" method="post" id="update-cart-form">
            @csrf
            <div class="ic-cart-card">
                <div class="title">
                    <h2>Shopping Cart</h2>
                </div>
                @if(Cart::count() > 0)
                    @foreach(Cart::content() as $row)
                        <div class="ic-cart-item @if($loop->iteration % 2 != 0){{'item-bg'}}@else{{'mobile-item-bg'}}@endif">
                            <div class="image">
                                <img src="{{asset('upload/product-thumbnail-82-82/'.$row->options->image_name)}}" alt="">
                            </div>
                            <div class="title">
                                <h5>{{$row->name}}</h5>
                                <p class="product-code">#{{$row->options->slug}}</p>
                                <p class="mobile-date">Date: {{ date('d/m/Y', strtotime($row->options->add_date_time)) }} </p>
                                <p class="mobile-time">Time: {{ strtoupper(date('h:i a', strtotime($row->options->add_date_time))) }}</p>
                            </div>
                            <div class="date">
                                <p>Date & Time</p>
                                <p>{{ strtoupper(date('d/m/Y h:i a', strtotime($row->options->add_date_time))) }}</p>
                            </div>
                            <div class="quantity">
                                <div class="product-count">
                                    <input type="hidden" name="upd_id[]" value="{{$row->rowId}}">
                                    <input type="hidden" class="price" value="{{$row->price}}">
                                    <a href="javascript:void(0)" class="qty-minus"><i class="flaticon-minus"></i></a>
                                    <input type="number" value="{{$row->qty}}" class="qty" name="qty[]" readonly>
                                    <a href="javascript:void(0)" class="qty-plus"><i class="flaticon-plus"></i></a>
                                </div>
                            </div>
                            <div class="price">
                                <p>price</p>
                                <p class="qty-price">{{$row->qty}} X ${{$row->price}}</p>
                            </div>
                            <div class="remove">
                                <a href="javascript:void(0)" class="reomve-item" data-remvId="{{$row->rowId}}"><i class="flaticon-error"></i></a>
                            </div>
                        </div>
                    @endforeach
                @endif

                {{--<div class="ic-cart-item item-bg">
                    <div class="image">
                        <img src="{{asset('frontend/images/cart-item.png')}}" alt="">
                    </div>
                    <div class="title">
                        <h5>Product name</h5>
                        <p class="product-code">#ID26598</p>
                        <p class="mobile-date">Date: 03/03/2021 </p>
                        <p class="mobile-time">Time: 10:44 AM</p>
                    </div>
                    <div class="date">
                        <p>Date & Time</p>
                        <p>03/03/2021 10:44 AM</p>
                    </div>
                    <div class="quantity">
                        <div class="product-count">
                            <a href="#" class="qty-minus"><i class="flaticon-minus"></i></a>
                            <input type="number" value="01" class="qty" readonly>
                            <a href="#" class="qty-plus"><i class="flaticon-plus"></i></a>
                        </div>
                    </div>
                    <div class="price">
                        <p>price</p>
                        <p>1 X $540</p>
                    </div>
                    <div class="remove">
                        <a href="#"><i class="flaticon-error"></i></a>
                    </div>
                </div>
                <div class="ic-cart-item mobile-item-bg">
                    <div class="image">
                        <img src="{{asset('frontend/images/cart-item.png')}}" alt="">
                    </div>
                    <div class="title">
                        <h5>Product name</h5>
                        <p class="product-code">#ID26598</p>
                        <p class="mobile-date">Date: 03/03/2021 </p>
                        <p class="mobile-time">Time: 10:44 AM</p>
                    </div>
                    <div class="date">
                        <p>Date & Time</p>
                        <p>03/03/2021 10:44 AM</p>
                    </div>
                    <div class="quantity">
                        <div class="product-count">
                            <a href="#" class="qty-minus"><i class="flaticon-minus"></i></a>
                            <input type="number" value="01" class="qty" readonly>
                            <a href="#" class="qty-plus"><i class="flaticon-plus"></i></a>
                        </div>
                    </div>
                    <div class="price">
                        <p>price</p>
                        <p>1 X $540</p>
                    </div>
                    <div class="remove">
                        <a href="#"><i class="flaticon-error"></i></a>
                    </div>
                </div>
                <div class="ic-cart-item item-bg">
                    <div class="image">
                        <img src="{{asset('frontend/images/cart-item.png')}}" alt="">
                    </div>
                    <div class="title">
                        <h5>Product name</h5>
                        <p class="product-code">#ID26598</p>
                        <p class="mobile-date">Date: 03/03/2021 </p>
                        <p class="mobile-time">Time: 10:44 AM</p>
                    </div>
                    <div class="date">
                        <p>Date & Time</p>
                        <p>03/03/2021 10:44 AM</p>
                    </div>
                    <div class="quantity">
                        <div class="product-count">
                            <a href="#" class="qty-minus"><i class="flaticon-minus"></i></a>
                            <input type="number" value="01" class="qty" readonly>
                            <a href="#" class="qty-plus"><i class="flaticon-plus"></i></a>
                        </div>
                    </div>
                    <div class="price">
                        <p>price</p>
                        <p>1 X $540</p>
                    </div>
                    <div class="remove">
                        <a href="#"><i class="flaticon-error"></i></a>
                    </div>
                </div>--}}
                <div class="ic-contunue-shipping-total">
                    <div class="contunue-shop-update-btn">
                        <a href="{{route('shop')}}">continue shopping</a>
                        <a href="{{route('shopping.cart')}}" class="update-btn">update cart</a>
                    </div>
                    <div class="ic-subtotal">
                        <h3 id="subtotal_amount">SUBTOTAl: ${{Cart::subtotal()}}</h3>
                        <p>Discounts will be applied during Check Out</p>
                    </div>
                </div>
            </div>
        </form>
        <div class="ic-continue-checkout-btn">
            <a href="{{route('checkout')}}" class="ic-btn">continue checkout</a>
        </div>
    </div>
</section>

<!-- Modal -->
<div class="modal fade" id="deleteModel" tabindex="-1" role="dialog" aria-labelledby="eleteModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-body" style="padding: 2rem;">
                Do you want to delete this item?
                <input type="hidden" id="del_itme_id">
            </div>
            <div class="modal-footer" style="padding: 0.25rem;">
                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-danger delete-btn btn-sm">Delete</button>
            </div>
        </div>
    </div>
</div>

@endsection

@section('js')
    <script>
        $(document).ready(function(){
            var csrf = "{{csrf_token()}}";
            var thsRem = '';
            $(document).on("click", ".reomve-item", function(){
                thsRem = $(this);
                var remId = $(this).attr('data-remvId');
                // Confirm box
                $("#del_itme_id").val('');
                $("#deleteModel").modal('show');
                $("#del_itme_id").val(remId);
            });

            $(document).on("click", ".delete-btn", function(){
                var remId = $("#del_itme_id").val();
                $("#loading").show();
                if(remId){
                    $.ajax({
                        type:'post',
                        url: "{{route('cart.remove')}}",
                        data:{
                            _token:csrf,
                            id:remId,
                        },
                        success:function (data) {
                            $("#loading").hide();
                            $("#subtotal_amount").text('SUBTOTAl: $'+data);
                            thsRem.parent().parent().remove();
                            $('#deleteModel').modal('toggle');
                        }
                    });
                }

            });

            $(document).on("click", ".update-btn", function(e){
                e.preventDefault();
                $("#loading").show();
                var the_form = $(this).closest("form");
                var formdata = the_form.serialize();
                $.ajax({
                    type:'post',
                    url: "{{route('cart.update')}}",
                    data: formdata,
                    success:function (data) {
                        $("#loading").hide();
                        $('.qty').each(function(i, obj) {
                            var qty = $(this).val();
                            var price = $(this).closest('div').find('.price').val();
                            $(this).parent().parent().parent().find('.qty-price').text(qty +' X $'+ price);
                        });
                        $("#subtotal_amount").text('SUBTOTAl: $'+data);
                        alert('success');
                    }
                });

            });

        });
    </script>
@endsection
