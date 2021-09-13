@extends("backend.master.main-layout")
@section("page-title","Footer Circle Image")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Footer Circle Image</h1>
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
                                <h3 class="card-title">Create Circle Image</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="{{route("footer-circle-image.store")}}" id="slider_form" enctype="multipart/form-data" data-parsley-validate>
                                @csrf

                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="headings">Title</label>
                                                <input type="text" class="form-control {{$errors->has("title") ? "is-invalid":""}}" id="title"
                                                       name="title" placeholder="Enter title" value="{{old("title")}}" required>
                                                <span class="text-danger"> {{$errors->has("title") ? $errors->first("title") : ""}} </span>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="link">Link</label>
                                                <input type="text" class="form-control {{$errors->has("link") ? "is-invalid":""}}" id="link"
                                                       name="link" placeholder="Enter link" value="{{old("link")}}">
                                                <span class="text-danger"> {{$errors->has("link") ? $errors->first("link") : ""}} </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="order_serial">Serial No.</label>
                                                <input type="text" class="form-control {{$errors->has("order_serial") ? "is-invalid":""}}" id="order_serial" name="order_serial" placeholder="Enter serial number" value="{{old("order_serial")}}" data-parsley-trigger="keyup" data-parsley-minlength="1" data-parsley-maxlength="11" data-parsley-required-message="The Serial is required." data-parsley-type="digits" required>
                                                <span class="text-danger"> {{$errors->has("order_serial") ? $errors->first("order_serial") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group select2-parent">
                                                <label for="status">Status</label>
                                                <select name="status" class="form-control single-select2" id="status" style="width: 100%;">
                                                    <option value="1">Active</option>
                                                    <option value="0">Inactive</option>
                                                </select>
                                                <span class="text-danger"> {{$errors->has("status") ? $errors->first("status") : ""}} </span>
                                            </div>
                                        </div><!-- end Category -->
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <label>
                                        Upload Image (460X300 px)
                                    </label>
                                    <p><input name="image_name" type="file"  accept="image/*" name="image" class="image" id="image" style="display: none;"></p>
                                    <p><label for="image" style="cursor: pointer;">
                                            <img id="output" src="{{asset('/demo-pic/upload-image.jpg')}}" width="180"/>
                                        </label></p>
                                    <span class="text-danger"> {{$errors->has("image_name") ? $errors->first("image_name") : ""}} </span>
                                </div>

                                <!-- /.card-body -->

                                <div class="card-footer text-right">
                                    <button type="submit" class="btn btn-dark submit_button">Submit</button>
                                    <button type="button" class="btn btn-default cancel">Cancel</button>
                                    <div class="spinner">&nbsp;</div>
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

@section('js')
<script>
    $(document).ready(function(){

    });
</script>
@endsection