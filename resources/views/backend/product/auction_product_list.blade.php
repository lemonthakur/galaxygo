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
                                        <th>Bid From($)</th>
                                        <th>Start Time</th>
                                        <th>End Time</th>
                                        <th>Bid Status</th>
                                        <th>Bids</th>
                                        <th>Height Bid($)</th>
                                        <th>Height Bidder Name</th>
                                        <th>Allow User</th>
                                        <th>Payment</th>
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
                            title: 'Auction Product List - {{date("m-d-Y")}}',
                            exportOptions: {
                                stripHtml: false,
                                columns: [0, 1, 2, 3, 4, 5, 6, 7],
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            title: 'Product List - {{date("m-d-Y")}}',
                            exportOptions: {
                                columns: [0, 1, 2, 3, 4, 5, 6, 7]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            title: 'Product List - {{date("m-d-Y")}}',
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
                        'url': '{{route("auction-product.list")}}',
                        "type": "GET",
                        "data": formData
                    },
                    'columns': [
                        {data: 'DT_RowIndex'},
                        {data: 'name'},
                        {data: 'pwb_starting_bid_amount'},
                        /*{data: 'categoryName.name'},
                        {data: 'subCategoryName.name'},*/
                        { "data": function ( data, type, row ) {
                            let dateString = data.pwb_auction_start_date_time;

                            let allDate = dateString.split(' ');
                            let thisDate = allDate[0].split('-');
                            let thisTime = allDate[1].split(':');
                            let newDate = [thisDate[1],thisDate[2],thisDate[0] ].join("-");

                            let suffix = thisTime[0] >= 12 ? " PM":" AM";
                            let hour = thisTime[0] > 12 ? thisTime[0] - 12 : thisTime[0];
                                hour = hour < 10 ? hour : hour;
                            let min = thisTime[1] ;
                            let sec = thisTime[2] ;
                            let newTime = hour + ':' + min + suffix;
                            return newDate + ' ' + newTime;
                                //return res;
                            }
                        },
                        { "data": function ( data, type, row ) {
                            let dateString = data.pwb_auction_end_date_time;

                            let allDate = dateString.split(' ');
                            let thisDate = allDate[0].split('-');
                            let thisTime = allDate[1].split(':');
                            let newDate = [thisDate[1],thisDate[2],thisDate[0] ].join("-");

                            let suffix = thisTime[0] >= 12 ? " PM":" AM";
                            let hour = thisTime[0] > 12 ? thisTime[0] - 12 : thisTime[0];
                                hour = hour < 10 ? hour : hour;
                            let min = thisTime[1] ;
                            let sec = thisTime[2] ;
                            let newTime = hour + ':' + min + suffix;
                            return newDate + ' ' + newTime;
                                //return res;
                            }
                        },
                        // Bid status
                        { "data": function ( data, type, row ) {
                                const date1 = new Date();
                                const date2 = new Date(data.pwb_auction_end_date_time);
                                if(date1 > date2)
                                    return '<span class="btn btn-success btn-xs">End</span>';
                                else
                                    return '<span class="btn btn-warning btn-xs">Running</span>';


                                //return res;
                            }
                        },
                        { "data": function ( data, type, row ) {
                                let totla_bids = 0;
                                if (data.bid_this_auction){
                                    totla_bids = data.bid_this_auction.length;
                                }
                                return totla_bids;
                            }
                        },
                        { "data": function ( data, type, row ) {
                                let rote = "{{route('bid.users.list')}}";
                                let auid = data.id;
                                let url = rote+'/'+auid;

                                let Height_bid_amt = '<a href="'+url+'">0</a>';
                                if (data.pwb_height_bid_amount){
                                    Height_bid_amt = '<a href="'+url+'">'+data.pwb_height_bid_amount+'</a>';
                                }
                                return Height_bid_amt;
                            }
                        },
                        { "data": function ( data, type, row ) {
                                let height_biddr_name = '';
                                if (data.height_biddr_name){
                                    height_biddr_name = data.height_biddr_name +' '+ data.height_biddr_last_name;
                                }
                                return height_biddr_name;
                            }
                        },
                        { "data": function ( data, type, row ) {
                                let status = '<span class="btn btn-danger btn-xs">No</span>';
                                if (data.pwb_allow_to_user == 'yes'){
                                    status = '<span class="btn btn-success btn-xs">Yes</span>';
                                }
                                return status;
                            }
                        },
                        { "data": function ( data, type, row ) {
                                let pay_status = '<span class="btn btn-danger btn-xs">No</span>';
                                if (data.pwb_ordered == 'yes'){
                                    pay_status = '<span class="btn btn-success btn-xs">Yes</span>';
                                }
                                return pay_status;
                            }
                        },
                        {data: 'actions'},
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
