@extends("backend.master.main-layout")
@section("page-title","Contest")
@section("main-content")

    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Contest</h1>
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
                                <h3 class="card-title">Contest List</h3>
                                <a href="{{route('contest.create')}}" class="btn btn-primary float-right text-white">
                                    <i class="fas fa-plus-circle"></i>
                                    Add New
                                </a>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body ">
                                <form id="filterForm">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <input type="text" class="form-control datepicker" name="name" id="name"
                                                       placeholder="Enter Contest Name"
                                                       readonly data-target="#name" data-toggle="datetimepicker">
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
                                            <th>Game Date</th>
                                            <th>Count Down Begin</th>
                                            <th>Count Down End</th>
                                            <th>Is Answer Submit</th>
                                            <th>Action</th>
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
        $(document).ready(function () {
            let formData = {};

            function loadDataTable(formData) {
                $('#dTable').dataTable({
                    dom: 'Blrtip',
                    // dom: 'Blfrtip',
                    buttons: [
                        {
                            extend: 'print',
                            title: 'Contest List - {{date("m/d-/Y")}}',
                            exportOptions: {
                                stripHtml: false,
                                columns: [0, 1, 2],
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            title: 'Contest List - {{date("m/d-/Y")}}',
                            exportOptions: {
                                columns: [0, 1, 2]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            title: 'Contest List - {{date("m/d-/Y")}}',
                            exportOptions: {
                                columns: [0, 1, 2]
                            }
                        }
                    ],
                    columnDefs: [
                        { className: 'text-center', targets: [3,4] },
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
                        'url': '{{route("contest.index")}}',
                        "type": "GET",
                        "data": formData
                    },
                    'columns': [
                        {data: 'DT_RowIndex'},
                        { "data": function ( data, type, row ) {
                                let name = moment(data.name).format('MM/DD/YYYY');
                                return name;
                            }
                        },
                        { "data": function ( data, type, row ) {
                                return moment(data.time_start).format('h:mm A');
                            }
                        },
                        { "data": function ( data, type, row ) {
                                return moment(data.time_end).format('h:mm A');
                            }
                        },
                        { "data": function ( data, type, row ) {
                                let answer = "";
                                if (data.is_final_answer == 0){
                                    answer = ' <label class="btn btn-danger btn-xs">No</label>'
                                }else {
                                    answer = ' <label class="btn btn-success btn-xs">Yes</label>'
                                }
                                return answer;
                            }
                        },
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
        });
    </script>
@endsection
