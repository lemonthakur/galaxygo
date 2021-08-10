@extends("backend.master.main-layout")
@section("page-title","Product")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Product</h1>
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
                                <h3 class="card-title">Product List</h3>
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
                                        <th>Name</th>
                                        <th>Category</th>
                                        <th>Sub Category</th>
                                        <th>Brand</th>
                                        <th>Auction On</th>
                                        <th>Rem. Qty</th>
                                        <th>Price($)</th>
                                        {{--<th>Discount($)</th>--}}
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
                            title: 'Product List - {{date("d-m-Y")}}',
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
                        'url': '{{route("product.index")}}',
                        "type": "GET",
                        "data": formData
                    },
                    'columns': [
                        {data: 'DT_RowIndex'},
                        {data: 'name'},
                        /*{data: 'categoryName.name'},
                        {data: 'subCategoryName.name'},*/
                        { "data": function ( data, type, row ) {
                                let res = '';
                                if (data.category_name){
                                    res = data.category_name.name;
                                }
                                return res;
                            }
                        },
                        { "data": function ( data, type, row ) {
                                let res = '';
                                if (data.sub_category_name){
                                    res = data.sub_category_name.name;
                                }
                                return res;
                            }
                        },
                        { "data": function ( data, type, row ) {
                                let res = '';
                                if (data.brandName){
                                    res = data.brandName.name;
                                }
                                return res;
                            }
                        },
                        { "data": function ( data, type, row ) {
                                let pro_type = 'No';
                                if (data.product_type == "Auction Product"){
                                    pro_type = 'Yes';
                                }
                                return pro_type;
                            }
                        },
                        {data: 'remaining_qty'},
                        /*{data: 'product_type'},*/
                        {data: 'price'},
                        /*{data: 'discount_amount'},*/
                        { "data": function ( data, type, row ) {
                                let status = '<span class="btn btn-danger btn-xs">Inactive</span>';
                                if (data.status == 1){
                                    status = '<span class="btn btn-success btn-xs">Active</span>';
                                }
                                return status;
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
