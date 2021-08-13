@extends("backend.master.main-layout")
@section("page-title","Auction Order")

@section('css')
    <link rel="stylesheet" href="{{asset("/admin-lte/plugins/datepicker/bootstrap-datepicker.min.css")}}">
@endsection

@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Auction Order</h1>
                    </div><!-- /.col -->
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">

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
                            <div class="card-header">
                                <h3 class="card-title">Order List</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body table-responsive">
                                <div class="col-md-12">
                                    <form id="filterForm">
                                        <div class="row">
                                            <div class="col-md-3">
                                                <div class="form-group">
                                                    <label for="name">Order no.</label>
                                                    <input type="text" class="form-control" id="order_no" name="order_no" placeholder="Enter Order no." value="">
                                                </div>
                                            </div>

                                            <div class="col-md-3">
                                                <div class="form-group select2-parent">
                                                    <label for="name">Order Status</label>
                                                    <select name="order_status" class="form-control single-select2" id="order_status" style="width: 100%;" required>
                                                        <option selected disabled>Select One</option>
                                                        <option value="Pending">Pending</option>
                                                        <option value="Fulfilment">Fulfilment</option>
                                                        <option value="Cancle">Cancle</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="start_date">Start Date</label>
                                                    <input type="text" class="form-control onlydate" id="start_date" name="start_date" value="" autocomplete="off" readonly="">
                                                </div>
                                            </div>

                                            <div class="col-md-2">
                                                <div class="form-group">
                                                    <label for="end_date">End Date</label>
                                                    <input type="text" class="form-control onlydate" id="end_date" name="end_date" value="" readonly="">
                                                </div>
                                            </div>
                                            <div class="col-md-2">
                                                <div class="form-group" style="padding-top: 33px;">
                                                    <button class="btn btn-dark " type="submit" id="search_btn">Search</button>
                                                    <button id="reset" type="reset" class="btn btn-danger">Reset</button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <table class="table table-bordered table-hover" id="dTable">
                                    <thead>
                                    <tr>
                                        <th>SL</th>
                                        <th>Order No</th>
                                        <th>Total Qty</th>
                                        <th>Sub Total</th>
                                        <th>Deliver Charge</th>
                                        <th>Total</th>
                                        <th>Payment Method</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
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
    <script src="{{asset("/admin-lte/plugins/datepicker/bootstrap-datepicker.min.js")}}"></script>
    <script>
        $(document).ready(function () {
            let formData = {};

            function loadDataTable(formData) {
                $('#dTable').dataTable({
                    dom: 'Blrtip',
                    // dom: 'Blfrtip',
                    buttons: [
                        {
                            extend: 'print',
                            title: 'Auction Order List - {{date("d-m-Y")}}',
                            exportOptions: {
                                stripHtml: false,
                                columns: [0, 1, 2, 3, 4, 5, 6, 7],
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            title: 'Product List - {{date("d-m-Y")}}',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5, 6, 7]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            title: 'Product List - {{date("d-m-Y")}}',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5, 6, 7]
                            }
                        }
                    ],
                    "responsive": true,
                    'processing': true,
                    'serverSide': true,
                    "pageLength": 10,
                    "lengthMenu": [[5, 10, 20, 30, 40, 50, 100, -1], [5, 10, 20, 30, 40, 50, 100, "All"]],

                    "bSort": false,
                    "language": {

                        // Change the Pagination button labels
                        "paginate": {
                            "first": "First",
                            "last": "Last",
                            "previous": "Previous",
                            "next": "Next",
                        }
                    },
                    'ajax': {
                        'url': '{{route("backend.auction.order.view")}}',
                        "type": "GET",
                        "data": formData
                    },
                    'columns': [
                        {data: 'DT_RowIndex'},
                        {data: 'tran_id'},
                        {data: 'total_quantity'},
                        {data: 'subtotal'},
                        {data: 'delivery_charge'},
                        {data: 'total'},
                        {data: 'payment_type'},
                        {data: 'dropdown'},
                        {data: 'actions'},
                    ]
                });
            }

            loadDataTable();

            $('#filterForm').on('submit', function (event) {
                event.preventDefault();
                formData = getFormData($(this));

                $('#dTable').DataTable().destroy();
                $('#dTable tbody').empty();
                loadDataTable(formData);
            });

            function getFormData($form) {
                let unindexed_array = $form.serializeArray();
                let indexed_array = {};

                $.map(unindexed_array, function (n, i) {
                    indexed_array[n['name']] = n['value'];
                });

                return indexed_array;
            }

            $(document).on('input', '#name', function () {
                $('#filterForm').submit();
            });

            $('#reset').on('click',function () {
                formData = {};
                $('#dTable').DataTable().destroy();
                $('#dTable tbody').empty();
                loadDataTable(formData);
            });

            $('.onlydate').datepicker({
                //format: 'yyyy/mm/dd',
                format: 'dd-mm-yyyy',
                autoclose:true,
                clearBtn:true,
                todayHighlight:true,
            });

            //$('.order_status').on('change', function (e) {
            $(document).on('change', '.order_status', function (e) {
                var me = $(this);

                var value       = $(this).val();
                var order_value = $(this).val();
                var order_id    = $(this).attr('data-id');

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
                            }
                        });

                    }else{
                        /*$('#order_status').val(order_status_default_select).select2();*/
                    }
                });


            });

        });
    </script>
@endsection
