@extends("backend.master.main-layout")
@section("page-title","User")
@section("main-content")

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Frontend User</h1>
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
                                <h3 class="card-title">Frontend User List</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body ">
                                <form id="filterForm">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="text" class="form-control" name="name" id="name" placeholder="Enter User Name">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="email" class="form-control" name="email" id="email" placeholder="Enter User Email">
                                            </div>
                                        </div>
                                        <div class="col-md-2">
                                            <button type="submit" class="btn btn-dark">Search</button>
                                            <button id="reset" type="reset" class="btn btn-danger">Reset</button>
                                        </div>
                                    </div>
                                </form>
                                <div class="table-responsive">
                                    <table class="table table-bordered table-hover" id="dTable">
                                        <thead>
                                        <tr>
                                            <th>SL</th>
                                            <th>Photo</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>PayPal Email</th>
                                            <th>Total Coin</th>
                                            <th>Current Coin</th>
                                            <th>Total Withdraw</th>
                                        </tr>
                                        </thead>
                                        <tbody></tbody>
                                    </table>
                                </div>
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
                            title: 'Frontend User List - {{date("m/d-/Y")}}',
                            exportOptions: {
                                stripHtml : false,
                                columns: [ 0, 1, 2,3,4, 5 ],
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            title: 'Frontend User List - {{date("m/d-/Y")}}',
                            exportOptions: {
                                columns: [ 0, 1, 2,3,4, 5 ]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            title: 'Frontend User List - {{date("m/d-/Y")}}',
                            exportOptions: {
                                columns: [ 0, 1, 2,3,4, 5 ]
                            }
                        }
                    ],
                     "responsive": true,
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
                        'url':'{{route("user.frontend")}}',
                        "type": "GET",
                        "data": formData
                    },
                    'columns': [
                        { data: 'DT_RowIndex' },
                        { "data": function ( data, type, row ) {
                                if(!data.photo){
                                    return '<img width="100" src="{{asset('/demo-pic/download.png')}}"/>';
                                }
                                return '<img width="100" src="'+data.photo+'"/>';
                            }
                        },
                        { data: 'name' },
                        { data: 'email' },
                        {data: 'paypal_email'},
                        { data: 'total_coin' },
                        { data: 'current_coin' },
                        { data: 'withdraw' },

                    ]
                });
            }

            loadDataTable();

            $('#filterForm').on('submit',function (event) {
                event.preventDefault();
                formData = getFormData($(this));

                $('#dTable').DataTable().destroy();
                $('#dTable tbody').empty();
                loadDataTable(formData);
            });

            function getFormData($form){
                let unindexed_array = $form.serializeArray();
                let indexed_array = {};

                $.map(unindexed_array, function(n, i){
                    indexed_array[n['name']] = n['value'];
                });

                return indexed_array;
            }

            $(document).on('input','#name,#email',function (){
                $('#filterForm').submit();
            });

            $('#reset').on('click',function () {
                formData = {};
                $('#dTable').DataTable().destroy();
                $('#dTable tbody').empty();
                loadDataTable(formData);
            });
        });
    </script>
    @endsection
