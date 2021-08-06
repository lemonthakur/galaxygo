@extends("backend.master.main-layout")
@section("page-title","Product-Create")
@section('css')
<style>
    /*Seo show hide*/
    /*.showSeo{
        display: none;
    }*/
    /*Image Galler*/
    .upload-btn-wrapper {
        position: relative;
        overflow: hidden;
        display: inline-block;
    }

    .gal_img_btn {
        /*border: 2px solid gray !important;*/
        color: #FFF !important;

        background-color: #2d3274 !important;
        padding: 8px 20px !important;
        /*border-radius: 8px !important;*/
    }

    .upload-btn-wrapper input[type=file] {
        font-size: 100px;
        position: absolute;
        left: 0;
        top: 0;
        opacity: 0;
    }
</style>
@endsection
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Product</h1>
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
                        <div class="card card-dark">
                            <div class="card-header">
                                <h3 class="card-title">Create Product</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="{{route("product.store")}}" id="product_form" enctype="multipart/form-data">
                                @csrf
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="name">Name <span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control {{$errors->has("name") ? "is-invalid":""}}" id="name" name="name" placeholder="Enter Category Name" value="{{old("name")}}" required>
                                                        <span class="text-danger"> {{$errors->has("name") ? $errors->first("name") : ""}} </span>
                                                    </div>
                                                </div><!-- end Name -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="name">Slug<span class="text-danger">*</span></label>
                                                        <input type="text" class="form-control {{$errors->has("slug") ? "is-invalid":""}}"
                                                               id="slug" name="slug" value="{{old("slug")}}" required>
                                                        <span class="text-danger"> {{$errors->has("slug") ? $errors->first("slug") : ""}} </span>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group select2-parent">
                                                        <label for="category_id">Category</label>
                                                        <select name="category_id" class="form-control single-select2" id="category_id" style="width: 100%;" required>
                                                            <option selected disabled>Select One</option>
                                                            @foreach($categorys as $category)
                                                                <option value="{{ $category->id }}" {{(old('category_id') == $category->id) ? 'selected' : ''}}>{{$category->name}}</option>
                                                            @endforeach
                                                        </select>
                                                        <span class="text-danger"> {{$errors->has("category_id") ? $errors->first("category_id") : ""}} </span>
                                                        <div class="spinner">&nbsp;</div>
                                                    </div>
                                                </div><!-- end Category -->
                                                <div class="col-md-6">
                                                    <div class="form-group select2-parent">
                                                        <label for="sub_category_id">Sub Category</label>
                                                        <select name="sub_category_id" class="form-control single-select2" id="sub_category_id" style="width: 100%;"></select>
                                                        <span class="text-danger"> {{$errors->has("sub_category_id") ? $errors->first("sub_category_id") : ""}} </span>
                                                    </div>
                                                </div><!-- end sub category -->
                                                <div class="col-md-6">
                                                    <div class="form-group select2-parent">
                                                        <label for="brand_id">Brand Name</label>
                                                        <select name="brand_id" class="form-control single-select2" id="brand_id" style="width: 100%;">
                                                            <option selected disabled>Select One</option>
                                                            @foreach($brands as $brand)
                                                                <option value="{{ $brand->id }}" {{(old('brand_id') == $brand->id) ? 'selected' : ''}}>{{$brand->name}}</option>
                                                            @endforeach
                                                        </select>
                                                        <span class="text-danger"> {{$errors->has("brand_id") ? $errors->first("brand_id") : ""}} </span>
                                                    </div>
                                                </div><!-- end brand name -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="model_number">Model Number</label>
                                                        <input type="text" class="form-control {{$errors->has("model_number") ? "is-invalid":""}}" id="model_number" name="model_number" placeholder="Enter model number" value="{{old("model_number")}}">
                                                        <span class="text-danger"> {{$errors->has("model_number") ? $errors->first("model_number") : ""}} </span>
                                                    </div>
                                                </div><!-- end model_number -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="price">Price <span class="text-danger">*</span></label>
                                                        <input type="number" step="any" class="form-control {{$errors->has("price") ? "is-invalid":""}}" id="price" name="price" placeholder="Enter price" value="{{old("price")}}">
                                                        <span class="text-danger"> {{$errors->has("price") ? $errors->first("price") : ""}} </span>
                                                    </div>
                                                </div><!-- end price -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="discount_price">Discount Amount</label>
                                                        <input type="number" step="any" class="form-control {{$errors->has("discount_amount") ? "is-invalid":""}}" id="discount_amount" name="discount_amount" placeholder="Enter Discount Amount" value="{{old("discount_amount")}}">
                                                        <span class="text-danger"> {{$errors->has("discount_amount") ? $errors->first("discount_amount") : ""}} </span>
                                                    </div>
                                                </div><!-- end discount price -->
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label for="quantity">Quantity</label>
                                                        <input type="number" class="form-control {{$errors->has("quantity") ? "is-invalid":""}}" id="quantity" name="quantity" placeholder="Enter quantity" value="{{old("quantity")}}">
                                                        <span class="text-danger"> {{$errors->has("quantity") ? $errors->first("quantity") : ""}} </span>
                                                    </div>
                                                </div><!-- end discount price -->
                                                <div class="col-md-6 product_type_parent">
                                                    <div class="form-group">
                                                        <label>Product Type <span class="text-danger">*</span></label>
                                                        <div class="checkbox checkbox-success">
                                                            <input type="radio" class="product_type" name="product_type" id="general_product" value="General Product" {{(old('product_type') == "General Product") ? 'checked': ''}} required checked>
                                                            <label for="general_product" style="font-weight: bold;">Auction No</label>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <input type="radio" class="product_type" name="product_type" id="auction_product" value="Auction Product" {{(old('product_type') == "Auction Product") ? 'checked': ''}} required>
                                                            <label for="auction_product" style="font-weight: bold;">Auction Yes</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                @if(old("product_type") == 'Auction Product')
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="discount_price">Starting Bid Amount</label>
                                                            <input type="number" step="any" required class="form-control {{$errors->has("starting_bid_amount") ? "is-invalid":""}}" id="starting_bid_amount" name="starting_bid_amount" placeholder="Enter Starting Bid Amount" value="{{old("starting_bid_amount")}}">
                                                            <span class="text-danger"> {{$errors->has("starting_bid_amount") ? $errors->first("starting_bid_amount") : ""}} </span>
                                                        </div>
                                                    </div><!-- end starting bid amount price -->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="name">Auction Start Date<span class="text-danger">*</span></label>
                                                            <input readonly type="text" required class="form-control datepicker {{$errors->has("auction_start_date") ? "is-invalid":""}}" id="auction_start_date" data-target="#auction_start_date"
                                                                   data-toggle="datetimepicker" name="auction_start_date" placeholder="Auction start date" value="{{old("auction_start_date")}}">
                                                            <span class="text-danger"> {{$errors->has("auction_start_date") ? $errors->first("auction_start_date") : ""}} </span>
                                                        </div>
                                                    </div><!-- end Auction Start Date -->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="expaire_time">Auction Start Time<span class="text-danger">*</span></label>
                                                            <input readonly type="text" required class="form-control timepicker {{$errors->has("auction_start_time") ? "is-invalid":""}}" id="auction_start_time"
                                                                   data-target="#auction_start_time" data-toggle="datetimepicker" name="auction_start_time" placeholder="Enter auction start time" value="{{old("auction_start_time")}}">
                                                            <span class="text-danger"> {{$errors->has("auction_start_time") ? $errors->first("auction_start_time") : ""}} </span>
                                                        </div>
                                                    </div><!-- end AuctionStart time -->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="name">Auction End Date<span class="text-danger">*</span></label>
                                                            <input readonly type="text" required class="form-control datepicker {{$errors->has("auction_end_date") ? "is-invalid":""}}" id="auction_end_date" data-target="#auction_end_date"
                                                                   data-toggle="datetimepicker" name="auction_end_date" placeholder="Auction end date" value="{{old("auction_end_date")}}">
                                                            <span class="text-danger"> {{$errors->has("auction_end_date") ? $errors->first("auction_end_date") : ""}} </span>
                                                        </div>
                                                    </div><!-- end Auction End Date -->
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label for="expaire_time">Auction End Time<span class="text-danger">*</span></label>
                                                            <input readonly type="text" required class="form-control timepicker {{$errors->has("auction_end_time") ? "is-invalid":""}}" id="auction_end_time"
                                                                   data-target="#auction_end_time" data-toggle="datetimepicker" name="auction_end_time" placeholder="Enter auction end time" value="{{old("auction_end_time")}}">
                                                            <span class="text-danger"> {{$errors->has("auction_end_time") ? $errors->first("auction_end_time") : ""}} </span>
                                                        </div>
                                                    </div><!-- end Auction End time -->
                                                @endif
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="product_description">Product Description <span class="text-danger">*</span></label>
                                                        <textarea class="txt-editor form-control {{$errors->has("product_description") ? "is-invalid":""}}" id="product_description" name="product_description" placeholder="Enter Product Description">{{old("product_description")}}</textarea>
                                                        <span class="text-danger"> {{$errors->has("product_description") ? $errors->first("product_description") : ""}} </span>
                                                    </div>
                                                </div><!-- end product decription -->
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="return_policy">Return Policy</label>
                                                        <textarea class="txt-editor form-control {{$errors->has("return_policy") ? "is-invalid":""}}" id="return_policy" name="return_policy" placeholder="Enter Return Policy">{{old("return_policy")}}</textarea>
                                                        <span class="text-danger"> {{$errors->has("return_policy") ? $errors->first("return_policy") : ""}} </span>
                                                    </div>
                                                </div><!-- end return_policy -->

                                                {{--<div class="col-md-12">
                                                    <div class="checkbox checkbox-success">
                                                        <input type="checkbox" name="seo_allow" value="1" id="seo_allow" {{(old('seo_allow') == "1") ? 'checked': ''}}>
                                                        <label for="seo_allow" style="font-weight: bold;">Allow Product SEO</label>
                                                    </div>
                                                </div>--}}

                                                <div class="col-md-12">
                                                    <div class="card-footer text-right">
                                                        <button type="submit" class="btn btn-dark submit_button">Submit</button>
                                                        <button type="button" class="btn btn-default cancel">Cancel</button>
                                                        <div class="spinner">&nbsp;</div>
                                                    </div>
                                                </div>
                                            </div><!-- end row -->
                                        </div><!-- /.card-body -->
                                    </div><!-- /.col -->
                                    <div class="col-md-4" style="border-left: 10px solid #f4f6f9;">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label>Feature Product <span class="text-danger">*</span></label>
                                                        <div class="checkbox checkbox-success">
                                                            <input type="radio" class="featureproduct" name="featureproduct" id="yes_f" value="yes" {{(old('featureproduct') == "yes") ? 'checked': ''}} required>
                                                            <label for="yes_f" style="font-weight: bold;">Yes</label>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                                            <input type="radio" class="featureproduct" name="featureproduct" id="no_f" value="no" {{(old('featureproduct') == "no") ? 'checked': ''}} checked required>
                                                            <label for="no_f" style="font-weight: bold;">No</label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <label>
                                                        Upload Feature Image (1200 × 969) <span class="text-danger">*</span>
                                                    </label>
                                                    <input name="feature_image" type="file" accept="image/*" name="feature_image" class="image" id="image" style="display: none;"  data-parsley-fileextension='jpg,png,jpeg'>
                                                    <p>
                                                        <label for="image" style="cursor: pointer;">
                                                            <img id="output" src="{{asset('/demo-pic/upload-image.jpg')}}" width="180"/>
                                                        </label>
                                                    </p>
                                                    <span class="text-danger"> {{$errors->has("feature_image") ? $errors->first("feature_image") : ""}} </span>
                                                </div><!-- /.feature_image -->
                                                <div class="col-md-12">
                                                    <label>
                                                        Upload Gallery Images
                                                    </label>
                                                    <br>
                                                    <div class="upload-btn-wrapper">
                                                        <button class="btn gal_img_btn"><i class="fas fa-plus"></i> Set Gallery</button>
                                                        <input type="file" name="galler_images[]" accept="image/*" multiple />
                                                    </div>
                                                </div><!-- /.galler_images -->
                                                <div class="col-md-12" style="padding-top: 15px;">
                                                    <label>
                                                        Upload Attached File
                                                    </label>
                                                    <br>
                                                    <div class="upload-btn-wrapper">
                                                        <button class="btn gal_img_btn">Attached File</button>
                                                        <input type="file" name="attached_file" />
                                                    </div>
                                                </div><!-- /.Attached File -->

                                                <div class="col-md-12 com_for_hide_show {{(old('seo_allow') == "1") ? '': 'showSeo'}}">
                                                    <div class="form-group">
                                                        <label for="pro_meta">Meta (Comma separated)</label>
                                                        <input type="text" class="form-control {{$errors->has("pro_meta") ? "is-invalid":""}}" id="pro_meta" name="pro_meta" placeholder="Enter Meta" value="{{old("pro_meta")}}">
                                                        <span class="text-danger"> {{$errors->has("pro_meta") ? $errors->first("pro_meta") : ""}} </span>
                                                    </div>
                                                </div><!-- end meta -->
                                                <div class="col-md-12 com_for_hide_show {{(old('seo_allow') == "1") ? '': 'showSeo'}}">
                                                    <div class="form-group">
                                                        <label for="pro_mt_description">Meta Description</label>
                                                        <textarea class="form-control {{$errors->has("pro_mt_description") ? "is-invalid":""}}" id="pro_mt_description" name="pro_mt_description" placeholder="Enter Meta Description">{{old("pro_mt_description")}}</textarea>
                                                        <span class="text-danger"> {{$errors->has("pro_mt_description") ? $errors->first("pro_mt_description") : ""}} </span>
                                                    </div>
                                                </div><!-- end Meta Description -->

                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="video_url">Video URL</label>
                                                        <input type="text" class="form-control {{$errors->has("video_url") ? "is-invalid":""}}" id="video_url" name="video_url" placeholder="Enter Video URL" value="{{old("video_url")}}">
                                                        <span class="text-danger"> {{$errors->has("video_url") ? $errors->first("video_url") : ""}} </span>
                                                    </div>
                                                </div><!-- end youtube url -->
                                                <div class="col-md-12">
                                                    <div class="form-group select2-parent">
                                                        <label for="status">Status <span class="text-danger">*</span></label>
                                                        <select name="status" class="form-control single-select2" id="status" style="width: 100%;">
                                                            <option value="1">Active</option>
                                                            <option value="0">Inactive</option>
                                                        </select>
                                                        <span class="text-danger"> {{$errors->has("status") ? $errors->first("status") : ""}} </span>
                                                    </div>
                                                </div><!-- end Category -->

                                            </div><!-- /.row -->
                                        </div><!-- /.card-body -->
                                    </div><!-- /.col -->

                                </div><!-- /.first row -->

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
<script src="{{asset("/admin-lte/plugins/bs-custom-file-input/bs-custom-file-input.min.js")}}"></script>
<script src="{{asset("/admin-lte/plugins/tinymce/tinymce.min.js")}}"></script>
<script>
    $(document).ready(function(){
        bsCustomFileInput.init();
        tinymceInitial();

        $('body').on('click','.datepicker, .timepicker', function() {
            initializeDatePicker();
        });

        function initializeDatePicker (){
            $('.datepicker').datetimepicker({
                ignoreReadonly: true,
                toolbarPlacement:'top',
                keepOpen:false,
                buttons:{
                    showToday: true,
                    showClear: true,
                    showClose: true
                },
                useCurrent:false,
                format: 'DD-MM-YYYY',
                icons: {
                    time: "fas fa-clock",
                    date: "fas fa-calendar",
                    up: "fas fa-arrow-up",
                    down: "fas fa-arrow-down",
                    previous: "fas fa-chevron-left",
                    next: "fas fa-chevron-right",
                    today: "fas fa-calendar-check",
                    clear: "fas fa-trash"
                }
            });
            $('.timepicker').datetimepicker({
                ignoreReadonly: true,
                format: 'LT',
                toolbarPlacement:'top',
                keepOpen:false,
                buttons:{
                    showClear: true,
                    showClose: true
                },
                icons: {
                    time: "fas fa-clock",
                    date: "fas fa-calendar",
                    up: "fas fa-arrow-up",
                    down: "fas fa-arrow-down",
                    previous: "fas fa-chevron-left",
                    next: "fas fa-chevron-right",
                    today: "fas fa-calendar-check",
                    clear: "fas fa-trash"
                }
            });
        }

        $(document).on('change', '#category_id', function(){
            var me = $(this);

            var category_id = $(this).val();
            var url= "{{route('product-product-sub-category.get')}}";
            $.ajax({
                type: "post",
                url: url,
                data: {
                    _token: '{{csrf_token()}}',
                    'category_id': category_id
                },
                dataType: "html",
                success: function(data) {
                    $("#sub_category_id").html(data);
                },
                complete: function(){

                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert(textStatus+errorThrown);
                }
            });
        });

        function slug_create(str) {
            var $slug = '';
            var trimmed = $.trim(str);
            $slug = trimmed.toLowerCase().replace(/ /g, '-')
                .replace(/[&\/\\#,+()$~%.'":*?<>{}|]/g, '');
            return $slug+'-'+Math.floor(1000 + Math.random() * 9000);
        }

        $(document).on("input", "#name", function(){
            var val = $(this).val();
            var ret_val = slug_create(val);
            $("#slug").val(ret_val);
        });

        $("input[type='button']").click(function(){
            var radioValue = $("input[name='gender']:checked").val();
            if(radioValue){
                alert("Your are a - " + radioValue);
            }
        });

        $(document).on("click", "input[name=product_type]", function() {
            var radioValue = $(this).val();
            if(radioValue == 'Auction Product') {
                var append_html = '<div class="col-md-6 apn"><div class="form-group"><label for="discount_price">Starting Bid Amount</label><input type="number" step="any" required class="form-control" id="starting_bid_amount" name="starting_bid_amount" placeholder="Enter Starting Bid Amount" value=""></div></div>\n' +
                    '<div class="col-md-6 apn"><div class="form-group"><label for="name">Auction Start Date<span class="text-danger">*</span></label><input readonly type="text" required class="form-control datepicker" id="auction_start_date" data-target="#auction_start_date" data-toggle="datetimepicker" name="auction_start_date" placeholder="Auction start date" value=""></div></div>' +
                    '<div class="col-md-6 apn"><div class="form-group"><label for="expaire_time">Auction Start Time<span class="text-danger">*</span></label><input readonly type="text" required class="form-control timepicker " id="auction_start_time"data-target="#auction_start_time" data-toggle="datetimepicker" name="auction_start_time" placeholder="Enter auction start time" value=""></div></div>' +
                    '<div class="col-md-6 apn"><div class="form-group"><label for="name">Auction End Date<span class="text-danger">*</span></label><input readonly type="text" required class="form-control datepicker" id="auction_end_date" data-target="#auction_end_date" data-toggle="datetimepicker" name="auction_end_date" placeholder="Auction end date" value=""></div></div>' +
                    '<div class="col-md-6 apn"><div class="form-group"><label for="expaire_time">Auction End Time<span class="text-danger">*</span></label><input readonly type="text" required class="form-control timepicker" id="auction_end_time" data-target="#auction_end_time" data-toggle="datetimepicker" name="auction_end_time" placeholder="Enter auction end time" value=""></div></div>';
                $( append_html ).insertAfter( $( ".product_type_parent" ) );
            }else{
                $( ".apn" ).remove();
            }
        });

        });
</script>
@endsection
