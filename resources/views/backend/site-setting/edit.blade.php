@extends("backend.master.main-layout")
@section("page-title","Site Setting")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Settings</h1>
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
                                <h3 class="card-title">Edit Settings</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="{{route("site.setting.update")}}" id="slider_form" enctype="multipart/form-data">
                                @method('put')
                                @csrf

                                <div class="col-md-12">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="site_title">Site Title<span class="text-red">*</span></label>
                                                <input type="text" class="form-control {{$errors->has("site_title") ? "is-invalid":""}}" id="site_title" name="site_title" placeholder="Enter site title" value="{{old("site_title",$setting->site_title)}}">
                                                <span class="text-danger"> {{$errors->has("site_title") ? $errors->first("site_title") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="email">Email<span class="text-red">*</span></label>
                                                <input type="email" class="form-control {{$errors->has("email") ? "is-invalid":""}}" id="tag_line" name="email" placeholder="Enter email" value="{{old("email",$setting->email)}}"  required>
                                                <span class="text-danger"> {{$errors->has("email") ? $errors->first("email") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="contact_no">Contact number<span class="text-red">*</span></label>
                                                <input type="text" class="form-control {{$errors->has("contact_no") ? "is-invalid":""}}" id="contact_no" name="contact_no" placeholder="Enter contact number" value="{{old("contact_no",$setting->contact_no)}}">
                                                <span class="text-danger"> {{$errors->has("contact_no") ? $errors->first("contact_no") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="address">Address<span class="text-red">*</span></label>
                                                <input type="text" class="form-control {{$errors->has("address") ? "is-invalid":""}}" id="address" name="address" placeholder="" value="{{old("address",$setting->address)}}">
                                                <span class="text-danger"> {{$errors->has("address") ? $errors->first("address") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="google_map">Map Code</label>
                                                <input type="text" class="form-control {{$errors->has("google_map") ? "is-invalid":""}}" id="google_map" name="google_map" placeholder="Google map iframge code" value="{{old("google_map",$setting->google_map)}}">
                                                <span class="text-danger"> {{$errors->has("google_map") ? $errors->first("google_map") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="chat_widget">Chat Widget Code</label>
                                                <input type="text" class="form-control {{$errors->has("chat_widget") ? "is-invalid":""}}" id="google_map" name="chat_widget" placeholder="Chat widget code" value="{{old("chat_widget",$setting->chat_widget)}}">
                                                <span class="text-danger"> {{$errors->has("chat_widget") ? $errors->first("chat_widget") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="google_map">Facebook Share Link</label>
                                                <input type="text" class="form-control {{$errors->has("facebook_share_link") ? "is-invalid":""}}" id="facebook_share_link" name="facebook_share_link" placeholder="Facebook share link" value="{{old("facebook_share_link",$setting->facebook_share_link)}}">
                                                <span class="text-danger"> {{$errors->has("facebook_share_link") ? $errors->first("facebook_share_link") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="meta_description">Meta Description</label>
                                                <textarea class="form-control {{$errors->has("meta_description") ? "is-invalid":""}}" id="meta_description" name="meta_description" placeholder="Enter meta description" maxlength="180">{{old("meta_description",$setting->meta_description)}}</textarea>

                                                <span class="text-danger"> {{$errors->has("contact_no") ? $errors->first("contact_no") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="meta_keyword">Meta Keywordst</label>
                                                <input type="text" class="form-control {{$errors->has("meta_keyword") ? "is-invalid":""}}" id="meta_keyword" name="meta_keyword" placeholder="" value="{{old("meta_keyword",$setting->meta_keyword)}}">
                                                <span class="text-danger"> {{$errors->has("meta_keyword") ? $errors->first("meta_keyword") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="copy_right">Copy Right</label>
                                                <input type="text" class="form-control {{$errors->has("copy_right") ? "is-invalid":""}}" id="copy_right" name="copy_right" placeholder="" value="{{old("copy_right",$setting->copy_right)}}">
                                                <span class="text-danger"> {{$errors->has("copy_right") ? $errors->first("copy_right") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <label>
                                                {{--                                                Upload Company Logo (128x128)--}}
                                                Upload Company Logo
                                            </label>
                                            <p><input type="file"  accept="image/*" name="logo" class="logo" id="logo" style="display: none;"></p>
                                            <p><label for="logo" style="cursor: pointer;">
                                                    @if($setting->logo && file_exists($setting->logo))
                                                        <img id="outputLogo" src="{{asset($setting->logo)}}" width="180"/>
                                                    @else
                                                        <img id="outputLogo" src="{{asset('/demo-pic/upload-image.jpg')}}" width="180"/>
                                                    @endif
                                                </label></p>
                                            <span class="text-danger"> {{$errors->has("logo") ? $errors->first("logo") : ""}} </span>
                                        </div>

                                        <div class="col-md-6">
                                            <label>
{{--                                                Upload Icon (50x50)--}}
                                                Upload Mobile Logo
                                            </label>
                                            <p><input type="file"  accept="image/*" name="mobile_logo" class="image" id="image" style="display: none;"></p>
                                            <p><label for="image" style="cursor: pointer;">
                                                    @if($setting->icon && file_exists($setting->icon))
                                                        <img id="output" src="{{asset($setting->icon)}}" width="180"/>
                                                    @else
                                                        <img id="output" src="{{asset('/demo-pic/upload-image.jpg')}}" width="180"/>
                                                    @endif
                                                </label></p>
                                            <span class="text-danger"> {{$errors->has("mobile_logo") ? $errors->first("mobile_logo") : ""}} </span>
                                        </div>

                                    </div>
                                </div>


                                <!-- /.card-body -->

                                <div class="card-footer text-right">
                                    <button type="submit" class="btn btn-dark">Update</button>
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
