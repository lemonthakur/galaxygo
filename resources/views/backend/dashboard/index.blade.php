@extends("backend.master.main-layout")
@section("page-title","Dashboard")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Dashboard</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <h3 style="font-size: 25px;" id="wc" class="card-title h3 text-center w-100">Welcome To Galaxy DashBoard</h3>
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
@section('js');
<script>
    setInterval(
        function() {
            let randomColor = "#" + Math.floor(Math.random() * 16777215).toString(16);
            $('#wc').css("color",randomColor);
        }, 1500);
</script>
    @endsection
