@extends("backend.master.main-layout")
@section("page-title","Brand")
@section("main-content")

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Brand</h1>
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
                                <h3 class="card-title">Brand List</h3>
                                @if(!empty($aclList[1][2]))
                                    <a href="{{route('brand.create')}}" class="btn btn-primary float-right text-white">
                                        <i class="fas fa-plus-circle"></i>
                                        Add New
                                    </a>
                                @endif
                            </div>
                            <!-- /.card-header -->

                            <div class="card-body table-responsive">
                                <table class="table table-bordered table-hover" id="dTable">
                                    <thead>
                                    <tr>
                                        <th>SL</th>
                                        <th>Name</th>
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
                            title: 'Brand List - {{date("d-m-Y")}}',
                            exportOptions: {
                                stripHtml: false,
                                columns: [0, 1, 2],
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            title: 'Brand List - {{date("d-m-Y")}}',
                            exportOptions: {
                                columns: [0, 1, 2]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            title: 'Brand List - {{date("d-m-Y")}}',
                            exportOptions: {
                                columns: [0, 1, 2]
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
                        'url': '{{route("brand.index")}}',
                        "type": "GET",
                        "data": formData
                    },
                    'columns': [
                        {data: 'DT_RowIndex'},
                        {data: 'name'},
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
