@extends("backend.master.main-layout")
@section("page-title","Win Coin")
@section("main-content")

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Win Coin</h1>
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
                                <h3 class="card-title">Win Coin List</h3>
                                <a href="{{route('win-coin.create')}}" class="btn btn-primary float-right text-white">
                                    <i class="fas fa-plus-circle"></i>
                                    Add New
                                </a>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body ">
{{--                                <form id="filterForm">--}}
{{--                                    <div class="row">--}}
{{--                                        <div class="col-md-4">--}}
{{--                                            <div class="form-group">--}}
{{--                                                <input type="text" class="form-control" name="name" id="name" placeholder="Enter User Name">--}}
{{--                                            </div>--}}
{{--                                        </div>--}}
{{--                                        <div class="col-md-2">--}}
{{--                                            <button type="submit" class="btn btn-dark">Search</button>--}}
{{--                                            <button id="reset" type="reset" class="btn btn-danger">Reset</button>--}}
{{--                                        </div>--}}
{{--                                    </div>--}}
{{--                                </form>--}}
                                    <table class="table table-bordered table-hover" id="dTable">
                                        <thead>
                                        <tr>
                                            <th>SL</th>
                                            <th>Number Of Win</th>
                                            <th>Out Of</th>
                                            <th>Win Coin</th>
                                            <th>Status</th>
                                            <th>Action</th>
                                        </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
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
        $(document).ready( function () {
            let formData = {};

            function loadDataTable(formData){
                $('#dTable').dataTable({
                    dom: 'Blrtip',
                    // dom: 'Blfrtip',
                    buttons: [
                        {
                            extend: 'print',
                            title: 'Win Coin List - {{date("d-m-Y")}}',
                            exportOptions: {
                                stripHtml : false,
                                columns: [ 0, 1, 2,3,4],
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            title: 'Win Coin List - {{date("d-m-Y")}}',
                            exportOptions: {
                                columns: [ 0, 1, 2,3,4]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            title: 'Win Coin List - {{date("d-m-Y")}}',
                            exportOptions: {
                                columns: [ 0, 1, 2,3,4 ]
                            }
                        }
                    ],
                    columnDefs: [
                        { className: 'text-center', targets: [0,1,2,3,4,5]},
                    ],
                    responsive: true,
                    'processing': true,
                    'serverSide': true,
                    "pageLength": 10,
                    "lengthMenu": [[5,10, 20,30,40, 50,100, -1], [5,10, 20,30,40, 50,100, "All"]],

                    "bSort" : false,
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
                        'url':'{{route("win-coin.index")}}',
                        "type": "GET",
                        "data": formData
                    },
                    'columns': [
                        { data: 'DT_RowIndex' },
                        { data: 'win' },
                        { data: 'out_of' },
                        { data: 'coin' },
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

            // $('#filterForm').on('submit',function (event) {
            //     event.preventDefault();
            //     formData = getFormData($(this));
            //
            //     $('#dTable').DataTable().destroy();
            //     $('#dTable tbody').empty();
            //     loadDataTable(formData);
            // });
            //
            // function getFormData($form){
            //     let unindexed_array = $form.serializeArray();
            //     let indexed_array = {};
            //
            //     $.map(unindexed_array, function(n, i){
            //         indexed_array[n['name']] = n['value'];
            //     });
            //
            //     return indexed_array;
            // }
            //
            // $(document).on('input','#name',function (){
            //     $('#filterForm').submit();
            // });
            //
            // $('#reset').on('click',function () {
            //     formData = {};
            //     $('#dTable').DataTable().destroy();
            //     $('#dTable tbody').empty();
            //     loadDataTable(formData);
            // });
        });
    </script>
    @endsection
