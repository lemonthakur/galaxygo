@extends("backend.master.main-layout")
@section("page-title","Product Details")
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
                                <h3 class="card-title">Product Details</h3>
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body table-responsive">
                                <table class="table table-bordered table-hover table-striped">
                                    <tbody>
                                    <tr>
                                        <th>Product Name</th>
                                        <td colspan="3">{!! $product->name !!}</td>
                                    </tr>
                                    <tr>
                                        <th style="width: 15%;">Category</th>
                                        <td style="width: 35%;">{!! $product->category_name->name ?? '' !!}</td>
                                        <th style="width: 15%;">Sub Category</th>
                                        <td style="width: 35%;">{!! $product->sub_category_name->name ?? '' !!}</td>
                                    </tr>
                                    <tr>
                                        <th>Brand Name</th>
                                        <td>{!! $product->brand_name->name ?? '' !!}</td>
                                        <th>Model Number</th>
                                        <td>{!! $product->model_number ?? '' !!}</td>
                                    </tr>
                                    <tr>
                                        <th>Price</th>
                                        <td>${!! $product->price !!}</td>
                                        <th>Discount Amount</th>
                                        <td>${!! $product->discount_amount  !!}</td>
                                    </tr>
                                    <tr>
                                        <th>Quantity</th>
                                        <td>{!! $product->quantity !!}</td>
                                        <th>Remaining Qty</th>
                                        <td>{!! $product->remaining_qty !!}</td>
                                    </tr>
                                    <tr>
                                        <th>Deliver Charge</th>
                                        <td>{!! $product->deliver_charge !!}</td>
                                        <th>Auction On</th>
                                        <td>
                                            {!! $product->product_type == 'General Product' ? 'No':'Yes' !!}
                                        </td>
                                    </tr>
                                    @if($product->product_type == 'Auction Product')
                                        <tr>
                                            <th>Bid Start From</th>
                                            <td>${{ $product->starting_bid_amount }}</td>
                                            <th>Start - End</th>
                                            <td>
                                                {{ date("d-m-Y h:i A", strtotime($product->auction_start_date_time)) }} -
                                                {{ date("d-m-Y h:i A", strtotime($product->auction_end_date_time)) }}
                                            </td>
                                        </tr>
                                    @endif
                                    <!--  -->
                                    <tr>
                                        <th>Product Description</th>
                                        <td colspan="3">{!! $product->product_description !!}</td>
                                    </tr>
                                    <tr>
                                        <th>Return Policy</th>
                                        <td colspan="3">{!! $product->return_policy	 !!}</td>
                                    </tr>

                                    <tr>
                                        <th>Meta</th>
                                        <td>{!! $product->pro_meta	 !!}</td>
                                        <th>Meta Description</th>
                                        <td colspan="3">{!! $product->pro_mt_description	 !!}</td>
                                    </tr>

                                    <tr>
                                        <th>Feature Product</th>
                                        <td colspan="3">{!! ucfirst($product->featureproduct)  !!}</td>
                                    </tr>
                                    <tr>
                                        <th>Feature Image</th>
                                        <td>
                                            <a href="{{ URL::to('image_show/1/' . $product->id ) }}" target="_blank">
                                                <img id="output" src="{{asset('upload/product-feature-image/'.$product->feature_image)}}" width="180"/>
                                            </a>
                                        </td>
                                        <th>Gallery Images</th>
                                        <td>
                                            @if($product->galler_images)
                                                <?php $gallery_images = json_decode($product->galler_images); ?>
                                                @if(count($gallery_images)>0)
                                                    <p>
                                                        @foreach($gallery_images as $gs)
                                                            <a href="{{ URL::to('image_show/2/' . $gs ) }}" target="_blank">
                                                            <img id="output" src="{{asset('/upload/product-galler-images/'.$gs.'')}}" width="60"/>
                                                            </a>
                                                        @endforeach
                                                    </p>
                                                @endif
                                            @endif
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Attach File</th>
                                        <td>
                                            @if($product->attached_file)
                                            @php
                                                $fil = explode('/', $product->attached_file);
                                            @endphp
                                            {{--<a href="{{ URL::to('image_show/3/' . $product->id ) }}" target="_blank">
                                                {!! $product->attached_file !!}
                                            </a>--}}
                                            <a href="{{ URL::to('image_show/3/' . $product->id ) }}" target="_blank">
                                                {!! $fil[3] !!}
                                            </a>
                                            @endif
                                        </td>
                                        <th>Video Url</th>
                                        <td>{!! $product->video_url !!}</td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <td colspan="3">
                                            @if($product->status == 1)
                                                <button class="btn btn-xs btn-success">Active</button>
                                            @else
                                                <button class="btn btn-xs btn-danger">Inactive</button>
                                            @endif
                                        </td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                            <div class="card-footer clearfix text-right">

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
