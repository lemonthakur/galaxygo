@extends("backend.master.main-layout")
@section("page-title","Auction Product")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Auction Product</h1>
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
                            <div class="card-header">
                                <h3 class="card-title">Auction Product List</h3>
                                <a href="{{route('product.create')}}" class="btn btn-primary float-right text-white">
                                    <i class="fas fa-plus-circle"></i>
                                    Add New
                                </a>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body table-responsive">
                                <table class="table table-bordered table-hover" id="dTable">
                                    <thead>
                                    <tr>
                                        <th>SL</th>
                                        <th>Product Name</th>
                                        <th>Customer Name</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Bids Start Amt.</th>
                                        <th>Bid Amount</th>
                                        <th>Bid Date</th>
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
    <script>
        $(document).ready(function () {
            let formData = {};
            let send_val = "{{ request()->segment(count(request()->segments()))}}";

            function loadDataTable(formData) {
                $('#dTable').dataTable({
                    dom: 'Blrtip',
                    // dom: 'Blfrtip',
                    buttons: [
                        {
                            extend: 'print',
                            title: 'Auction Product Bid User List - {{date("d-m-Y")}}',
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
                        'url': '{{route("bid.users.list")}}',
                        "type": "GET",
                        "data": {
                           formData,
                           id: send_val,
                           // etc..
                        },
                        /*"data": formData*/
                    },
                    'columns': [
                        {data: 'DT_RowIndex'},
                        {data: 'product_name'},
                        { "data": function ( data, type, row ) {
                                let biddr_name = '';
                                if (data.bidder_name){
                                    biddr_name = data.bidder_name +' '+ data.bidder_last_name;
                                }
                                return biddr_name;
                            }
                        },
                        {data: 'bidder_email'},
                        {data: 'bidder_contact_no'},
                        {data: 'pwb_starting_bid_amount'},
                        {data: 'user_bid_amount'},
                        
                        { "data": function ( data, type, row ) {
                            let dateString = data.user_bid_date;

                            let allDate = dateString.split(' ');
                            let thisDate = allDate[0].split('-');
                            let thisTime = allDate[1].split(':');
                            let newDate = [thisDate[2],thisDate[1],thisDate[0] ].join("-");

                            let suffix = thisTime[0] >= 12 ? " PM":" AM";
                            let hour = thisTime[0] > 12 ? thisTime[0] - 12 : thisTime[0];
                                hour = hour < 10 ? hour : hour;
                            let min = thisTime[1] ;
                            let sec = thisTime[2] ;
                            let newTime = hour + ':' + min + suffix;
                            return newDate + ' ' + newTime;
                            }
                        },
                        
                    ]
                });
            }

            loadDataTable();

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
        });
    </script>
@endsection
