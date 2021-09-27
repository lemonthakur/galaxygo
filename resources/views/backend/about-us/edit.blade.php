@extends("backend.master.main-layout")
@section("page-title","About Us")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">About Us</h1>
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
                                <h3 class="card-title">Edit About Us</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="{{route("about-us.update")}}" id="slider_form"
                                  enctype="multipart/form-data">
                                @method('put')
                                @csrf

                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="title">Title<span class="text-red">*</span></label>
                                                <input type="text"
                                                       class="form-control {{$errors->has("title") ? "is-invalid":""}}"
                                                       id="title" name="title" placeholder="Enter page title"
                                                       value="{{old("title",$aboutUs->title)}}"
                                                       required maxlength="50">
                                                <span
                                                    class="text-danger"> {{$errors->has("title") ? $errors->first("title") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="button_text">Button Text<span
                                                        class="text-red">*</span></label>
                                                <input type="text"
                                                       class="form-control {{$errors->has("button_text") ? "is-invalid":""}}"
                                                       id="button_text" name="button_text"
                                                       placeholder="Enter button text"
                                                       value="{{old("button_text",$aboutUs->button_text)}}"
                                                       required maxlength="30">
                                                <span
                                                    class="text-danger"> {{$errors->has("button_text") ? $errors->first("button_text") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="button_url">Button Url<span
                                                        class="text-red">*</span></label>
                                                <input type="url"
                                                       class="form-control {{$errors->has("button_url") ? "is-invalid":""}}"
                                                       id="button_url" name="button_url" placeholder="Enter button url"
                                                       value="{{old("button_url",$aboutUs->button_url)}}"
                                                       required maxlength="255">
                                                <span
                                                    class="text-danger"> {{$errors->has("button_url") ? $errors->first("button_url") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="video_url">Video Url</label>
                                                <input type="url"
                                                       class="form-control {{$errors->has("video_url") ? "is-invalid":""}}"
                                                       id="video_url" name="video_url" placeholder="Enter video url"
                                                       value="{{old("video_url",$aboutUs->video_url)}}"
                                                       maxlength="255">
                                                <span
                                                    class="text-danger"> {{$errors->has("video_url") ? $errors->first("video_url") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="description">Description</label>
                                                <textarea
                                                    class="txt-editor form-control {{$errors->has("description") ? "is-invalid":""}}"
                                                    id="description" name="description"
                                                    placeholder="Enter page description">{{old("description",$aboutUs->description)}}</textarea>
                                                <span
                                                    class="text-danger"> {{$errors->has("description") ? $errors->first("description") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <label>
                                                {{--Upload Company Logo (128x128)--}}
                                                Upload Image
                                            </label>
                                            <p><input type="file" accept="image/*" name="image" class="logo" id="logo"
                                                      style="display: none;"></p>
                                            <p><label for="logo" style="cursor: pointer;">
                                                    @if(!$aboutUs->image)
                                                        <img id="outputLogo"
                                                             src="{{asset('/demo-pic/upload-image.jpg')}}"
                                                             width="180"/>
                                                    @else
                                                        <img id="outputLogo" src="{{asset($aboutUs->image)}}"
                                                             width="180"/>
                                                    @endif
                                                </label></p>
                                            <span
                                                class="text-danger"> {{$errors->has("logo") ? $errors->first("logo") : ""}} </span>
                                        </div>

                                        <div class="col-md-6">
                                            <label>
                                                {{--Upload video banner--}}
                                                Upload video banner
                                            </label>
                                            <p><input type="file" accept="image/*" name="video_banner" class="image"
                                                      id="image" style="display: none;"></p>
                                            <p><label for="image" style="cursor: pointer;">
                                                    @if(!$aboutUs->video_banner)
                                                        <img id="output" src="{{asset('/demo-pic/upload-image.jpg')}}"
                                                             width="180"/>
                                                    @else
                                                        <img id="output" src="{{asset($aboutUs->video_banner)}}"
                                                             width="180"/>
                                                    @endif
                                                </label></p>
                                            <span
                                                class="text-danger"> {{$errors->has("video_banner") ? $errors->first("video_banner") : ""}} </span>
                                        </div>

                                    </div>
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer text-right">
                                    <button type="submit" class="btn btn-dark">Update</button>
                                    <!-- <button type="button" class="btn btn-default cancel">Cancel</button> -->
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
        $(document).ready(function () {
            tinymceInitial();
        })
    </script>
@endsection
