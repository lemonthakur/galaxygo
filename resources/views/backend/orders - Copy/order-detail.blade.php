@extends("backend.master.main-layout")
@section("page-title","Order Details")
<style type="text/css">
    .table td, .table th {
    padding: .25rem !important;
}
</style>
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Order Details</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            {{--<li class="breadcrumb-item"><a href="#">Home</a></li>--}}
                            {{--<li class="breadcrumb-item active">Starter Page</li>--}}
                        </ol>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <!-- /.card-header -->
                            <div class="card-body table-responsive">
                                <table class="table table-borderless">
                                    <tr>
                                        <td>Order Date:</td>
                                        <td>{!! $orders->created_at->format('d-M-Y') !!}</td>
                                        <td>Billing Address:</td>
                                        <td>{!! $order_shipping->address.', '.$order_shipping->thana->name.', '.$order_shipping->district->name.', '.$order_shipping->division->name !!}</td>
                                    </tr>
                                    <tr>
                                        <td>Order No:</td>
                                        <td>{!! $orders->id !!}</td>
                                        <td>Billing Email:</td>
                                        <td>{!! $order_shipping->email !!}</td>
                                    </tr>
                                    <tr>
                                        <td>Customer Name:</td>
                                        <td>{!! $order_shipping->user->name !!}</td>
                                        <td>Billing Phone:</td>
                                        <td>{!! $order_shipping->contact_no !!}</td>
                                    </tr>
                                    <tr>
                                        <td>Payment Method</td>
                                        <td>
                                            @if($orders->payment_type == 1)
                                                Payment On Delivery
                                            @else
                                                Payment On Bkash
                                            @endif
                                        </td>
                                        @if($orders->payment_type != 1)
                                            <td>Bkash Transection Id</td>
                                            <td>{!! $orders->tran_id !!}</td>
                                        @endif
                                    </tr>
                                </table><br>
                                @if($order_details)
                                    <table class="table table-bordered table-hover table-striped">
                                        <thead>
                                        <tr>
                                            <th>SL</th>
                                            <th>Product</th>
                                            <th>Quantity</th>
                                            <th>Cost</th>
                                            <th>Total Cost</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <?php 
                                            $i = 1; 
                                            $total_sub = 0;
                                        ?>
                                        @forelse($order_details as $od)
                                            <tr>
                                                <td>{{ $i++ }}</td>
                                                <td>
                                                    <img src="{!! asset($od->product->feature_image) !!}" alt="" style="height: 50px;width: 50px;"> &nbsp;&nbsp; {{ $od->product->name }}
                                                    @if($od->product->product_type=='yes')
                                                        @php
                                                            $explode_variants        = explode(",", $od->concat_variants);
                                                            $explode_variant_options = explode(",", $od->concat_variant_options);
                                                        @endphp
                                                        @foreach($explode_variants as $k => $v)
                                                            | {!! $v.' - '.$explode_variant_options[$k] !!}
                                                        @endforeach
                                                    @endif
                                                </td>
                                                <td class="text-right">{{ $od->quantity }}</td>
                                                <td class="text-right">{!! $siteSetting->currency_symbol !!} {{ $od->price }}</td>
                                                <td class="text-right">{!! $siteSetting->currency_symbol !!} {{ $od->price*$od->quantity }}</td>
                                            </tr>
                                            @php
                                                $total_sub += $od->price*$od->quantity;
                                            @endphp
                                        @empty
                                            <tr>
                                                <td colspan="5" class="text-center">Nothing Found</td>
                                            </tr>
                                        @endforelse

                                        @if($orders->delivery_charge OR $orders->vat_tax OR $orders->discount)
                                            <tr>
                                                <td colspan="4" class="text-right"><b>Sub Total</b></td>
                                                <td class="text-right"><b>{!! $siteSetting->currency_symbol !!} {{ $total_sub }}</b></td>
                                            </tr>

                                            @if($orders->vat_tax)
                                                <tr>
                                                    <td colspan="4" class="text-right">VAT</td>
                                                    <td class="text-right">{!! $siteSetting->currency_symbol !!} {{ $orders->vat_tax }}</td>
                                                </tr>
                                                @php
                                                    $total_sub += $orders->vat_tax;
                                                @endphp
                                            @endif
                                            @if($orders->delivery_charge)
                                                <tr>
                                                    <td colspan="4" class="text-right">Delivery Charge</td>
                                                    <td class="text-right">{!! $siteSetting->currency_symbol !!} {{ $orders->delivery_charge }}</td>
                                                </tr>
                                                @php
                                                    $total_sub += $orders->delivery_charge;
                                                @endphp
                                            @endif
                                            @if($orders->delivery_charge OR $orders->vat_tax)
                                                <tr>
                                                    <td colspan="4" class="text-right"><b>Total</b></td>
                                                    <td class="text-right"><b>{!! $siteSetting->currency_symbol !!} {{ $total_sub }}</b></td>
                                                </tr>
                                            @endif
                                            @if($orders->discount)
                                                <tr>
                                                    <td colspan="4" class="text-right">(Discoun)</td>
                                                    <td class="text-right">{!! $siteSetting->currency_symbol !!} {{ $orders->discount }}</td>
                                                </tr>
                                                @php
                                                    $total_sub -= $orders->discount;
                                                @endphp
                                                <tr>
                                                    @if($orders->delivery_charge OR $orders->vat_tax)
                                                        <td colspan="4" class="text-right"><b>Grand total</b></td>
                                                    @else
                                                        <td colspan="4" class="text-right"><b>Total</b></td>
                                                    @endif
                                                    <td class="text-right"><b>{!! $siteSetting->currency_symbol !!} {{ $total_sub }}</b></td>
                                                </tr>
                                            @endif

                                        @else
                                            <tr>
                                                <td colspan="4" class="text-right"><b>Total</b></td>
                                                <td class="text-right"><b>{!! $siteSetting->currency_symbol !!} {{ $total_sub }}</b></td>
                                            </tr>
                                        @endif

                                        </tbody>
                                    </table>
                                @endif
                                
                                <div class="row" style="padding-top: 15px;">
                                    <div class="col-md-5"></div>
                                    <div class="col-md-1">Status:</div>
                                    <div class="col-md-3">
                                        <div class="form-group select2-parent">
                                            <select name="order_status" class="form-control single-select2" id="order_status" style="width: 100%;" required>
                                                <option selected disabled>Select One</option>
                                                <option value="1" @if($orders->status==1) selected @endif>Pending</option>
                                                <option value="2" @if($orders->status==2) selected @endif>Processing</option>
                                                <option value="3" @if($orders->status==3) selected @endif>Complete</option>
                                                <option value="4" @if($orders->status==4) selected @endif>On Holod</option>
                                                <option value="5" @if($orders->status==5) selected @endif>Cancel</option>
                                            </select>
                                            <div class="spinner">&nbsp;</div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        @if(!empty($aclList[19][7]))
                                            <a href="{{route('backend.order.details',$orders->id.'/print')}}" id="print" class="btn btn-primary cancel" target="_blank">Print</a>
                                            <a href="{!! url('orders') !!}" class="btn btn-warning cancel">Back</a>
                                        @endif
                                    </div>
                                </div>
                            

                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>

@endsection

@section('js')
<script>

    $(document).ready(function(){
        
        $('#order_status').on('change', function (e) {
            var me = $(this);
            var spinner = $(this).closest('div').find('.spinner');
            spinner.show();

            var value       = $('#order_status option:selected').text();
            var order_value = $('#order_status').val();
            var order_id    = "{!! $orders->id !!}";
            var order_status_default_select = "{!! $orders->status !!}";;
            
            e.preventDefault();
            swal.fire({
                title: 'Please Confirm',
                text: "Order Is "+value+" ??",
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                cancelButtonText: ' No!',
                confirmButtonText: 'Yes!'
            }).then((result) => {
                if (result.value) {
                $.ajax({
                    url: "{{ route('backend.orders-status-change')}}",
                    type: "post",
                    data: {"order_value": order_value,"order_id":order_id, _token: '{{csrf_token()}}'},
                    success:function(data) {
                        var message_txt = null;
                        var msg_type = null;
                        if(data=='success'){
                            var message_txt = "Order Is "+value;
                            msg_type = 'success';
                        }
                        else if(data=="faild"){
                            var message_txt = "Something went wrong. Please try again later.";
                            msg_type = 'error';
                        }
                        
                        swal.fire({
                            text: message_txt,
                            type: msg_type
                        });
                        spinner.hide();
                    }
                });

            }else{
                $('#order_status').val(order_status_default_select).select2();
                spinner.hide();
            }
        });

             
        });

    });

</script>
@endsection
