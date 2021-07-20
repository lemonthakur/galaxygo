@extends("backend.master.main-layout")
@section("page-title","Contest-Create")
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
                    <div class="col-md-8 offset-md-2">
                        <div class="card card-dark">
                            <div class="card-header">
                                <h3 class="card-title">Create Contest</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="{{route("contest.store")}}">
                                @csrf
                                <div class="card-body">
                                    <div class="row">

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">Name<span class="text-danger">*</span></label>
                                                <input readonly type="text" class="form-control datepicker {{$errors->has("name") ? "is-invalid":""}}" id="name" data-target="#name" data-toggle="datetimepicker" name="name" placeholder="Enter User Name" value="{{old("name")}}">
                                                <span class="text-danger"> {{$errors->has("name") ? $errors->first("name") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="expaire_time">Count Down Timer<span class="text-danger">*</span></label>
                                                <input readonly type="text" class="form-control timepicker {{$errors->has("name") ? "is-invalid":""}}" id="expaire_time" data-target="#expaire_time" data-toggle="datetimepicker" name="expaire_time" placeholder="Enter Count Down Time" value="{{old("expaire_time")}}">
                                                <span class="text-danger"> {{$errors->has("expaire_time") ? $errors->first("expaire_time") : ""}} </span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer text-right">
                                    <button type="submit" class="btn btn-dark">Submit</button>
                                    <a href="{{route('contest.index')}}" class="btn btn-default cancel">Cancel</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
@endsection
