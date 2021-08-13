@extends("backend.master.main-layout")
@section("page-title","Other Page")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Other Page</h1>
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
                                <h3 class="card-title">Other Page</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="{{route("other-page.update")}}" id="slider_form"
                                  enctype="multipart/form-data">
                                @method('put')
                                @csrf

                                <div class="col-md-12">
                                    <div class="row">

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="privacy_policy">Privacy Policy<span class="text-red">*</span></label>
                                                <textarea
                                                    class="txt-editor form-control {{$errors->has("privacy_policy") ? "is-invalid":""}}"
                                                    id="privacy_policy" name="privacy_policy"
                                                    placeholder="Enter site privacy policy">{{old("privacy_policy",$otherPage->privacy_policy)}}</textarea>
                                                <span
                                                    class="text-danger"> {{$errors->has("privacy_policy") ? $errors->first("privacy_policy") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="terms_condition">Terms & Conditions<span class="text-red">*</span></label>
                                                <textarea
                                                    class="txt-editor form-control {{$errors->has("terms_condition") ? "is-invalid":""}}"
                                                    id="terms_condition" name="terms_condition"
                                                    placeholder="Enter site terms and conditions">{{old("terms_condition",$otherPage->terms_condition)}}</textarea>
                                                <span
                                                    class="text-danger"> {{$errors->has("terms_condition") ? $errors->first("terms_condition") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="rules">Rules<span class="text-red">*</span></label>
                                                <textarea
                                                    class="txt-editor form-control {{$errors->has("terms_condition") ? "is-invalid":""}}"
                                                    id="rules" name="rules"
                                                    placeholder="Enter site rules">{{old("rules",$otherPage->rules)}}</textarea>
                                                <span
                                                    class="text-danger"> {{$errors->has("rules") ? $errors->first("rules") : ""}} </span>
                                            </div>
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
