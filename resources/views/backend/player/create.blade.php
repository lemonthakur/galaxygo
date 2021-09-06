@extends("backend.master.main-layout")
@section("page-title","Player-Create")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Player</h1>
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-6 offset-md-3">
                        <div class="card card-dark">
                            <div class="card-header">
                                <h3 class="card-title">Create Player</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="{{route("players.store")}}" enctype="multipart/form-data">
                                @csrf
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="name">Name<span class="text-danger">*</span></label>
                                                <input type="text" class="form-control {{$errors->has("name") ? "is-invalid":""}}" id="name"
                                                       name="name" placeholder="Enter Player Name" value="{{old("name")}}">
                                                <span class="text-danger"> {{$errors->has("name") ? $errors->first("name") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <label>
                                                Upload Player Image<span class="text-danger">*</span>
                                            </label>
                                            <p><input type="file"  accept="image/*" name="image" class="image" id="image" style="display: none;"></p>
                                            <p class="text-center">
                                                <label for="image" style="cursor: pointer;">
                                                    <img id="output" src="{{asset('/demo-pic/upload-image.jpg')}}" width="200"/>
                                                </label>
                                            </p>
                                            <span class="text-danger"> {{$errors->has("image") ? $errors->first("image") : ""}} </span>
                                        </div>

                                    </div>
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer text-right">
                                    <button type="submit" class="btn btn-dark">Submit</button>
                                    <button type="button" class="btn btn-default cancel">Cancel</button>
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
