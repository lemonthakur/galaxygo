@extends("backend.master.main-layout")
@section("page-title","Order List")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Order List</h1>
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
                                <div class="col-md-12">
                                    <form method="get" action="{{route("backend.order.view")}}">
                                        @csrf
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="name">Order no.</label>
                                                    <input type="text" class="form-control" id="order_no" name="order_no" placeholder="Enter Order no." value="{{$request->order_no}}">
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group select2-parent">
                                                    <label for="name">Order Status</label>
                                                    <select name="order_status" class="form-control single-select2" id="order_status" style="width: 100%;" required>
                                                        <option selected disabled>Select One</option>
                                                        <option value="1" @if($request->order_status==1) selected @endif>Pending</option>
                                                        <option value="2" @if($request->order_status==2) selected @endif>Processing</option>
                                                        <option value="3" @if($request->order_status==3) selected @endif>Complete</option>
                                                        <option value="4" @if($request->order_status==4) selected @endif>On Holod</option>
                                                        <option value="5" @if($request->order_status==5) selected @endif>Cancel</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="start_date">Start Date</label>
                                                    <input type="text" class="form-control datepicker" id="start_date" name="start_date" value="{{$request->start_date}}" autocomplete="off" readonly="">
                                                </div>
                                            </div>

                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="end_date">End Date</label>
                                                    <input type="text" class="form-control " id="end_date" name="end_date" value="{{$request->end_date}}" readonly="">
                                                </div>
                                            </div>
                                            <div class="col-md-2" style="padding-top: 32px;">
                                                <button type="submit" class="btn btn btn-dark float-right text-white">
                                                    <i class="fas fa-search"></i>
                                                    Search
                                                </a>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                    <tr>
                                        <th>SL</th>
                                        <th>Order</th>
                                        <th>Total Qty</th>
                                        <th>Total Cost</th>
                                        <th>Payment Method</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    @php
                                        use App\CustomClass\OwnLibrary;
                                        $i = OwnLibrary::paginationSerial($orders);
                                    @endphp
                                    @forelse($orders as $order)
                                        <tr>
                                            <td>{{$i++}}</td>
                                            <td>{{ $order->oid }}</td>
                                            <td class="text-right">{{ $order->quantity }}</td>
                                            <td class="text-right">{{ $order->total }}</td>
                                            <td class="text-center">
                                                @if($order->payment_type == 1)
                                                    <button class="btn btn-xs btn-warning">Payment On Delivery</button>
                                                @else
                                                    <button class="btn btn-xs btn-warning">Payment On Bkash<br></button><br>
                                                    <button class="btn btn-xs btn-warning">Transection Id - {!! $order->tran_id !!}</button>
                                                @endif
                                            </td>
                                            
                                            <td class="text-center">
                                                @if($order->status == 1)
                                                    <button class="btn btn-xs btn-warning">Pending</button>
                                                @elseif($order->status == 2)
                                                    <button class="btn btn-xs btn-warning">Processing</button>
                                                @elseif($order->status == 3)
                                                    <button class="btn btn-xs btn-success">Complete</button>
                                                @elseif($order->status == 4)
                                                    <button class="btn btn-xs btn-warning">On Holod</button>
                                                @elseif($order->status == 5)
                                                    <button class="btn btn-xs btn-danger">Cancel</button>
                                                @endif
                                            </td>
                                            <td class="text-center">
                                                @if(!empty($aclList[19][8]))
                                                    <a class="btn btn-xs btn-primary text-white" href="{{route('backend.order.details',$order->oid)}}" title="Details" target="_blank">
                                                        <i class="fas fa-eye"></i>
                                                    </a>
                                                @endif
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="7" class="text-center">Nothing Found</td>
                                        </tr>
                                    @endforelse

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer clearfix text-right">
                                {{$orders->links()}}
                            </div>
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
        var expired_date_start = "";
        $('.datepicker').datetimepicker({
                format: 'yyyy-mm-dd',
                weekStart: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
                minView: 2, 
                pickTime: false, 
                //showMeridian: 1,

            }).on('changeDate', function(ev){
                var orgDate = new Date(ev.date);
                var getDate = orgDate.getFullYear()+'-'+(orgDate.getMonth()+1)+'-'+orgDate.getDate()+" "+orgDate.getHours()+":"+orgDate.getMinutes();
                expired_date_start = getDate;

                $("expired_date").val("");
                $('#end_date').datetimepicker({
                    format: 'yyyy-mm-dd',
                    weekStart: 1,
                    autoclose: 1,
                    todayHighlight: 1,
                    startView: 2,
                    forceParse: 0,
                    minView: 2, 
                    pickTime: false, 
                    startDate: expired_date_start
                });
            });
    });

</script>
@endsection
