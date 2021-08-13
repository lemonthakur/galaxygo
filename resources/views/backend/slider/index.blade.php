@extends("backend.master.main-layout")
@section("page-title","Sliders")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Sliders</h1>
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
                                <h3 class="card-title">Sliders List</h3>
                                @if(!empty($aclList[1][2]))
                                    <a href="{{route('slider.create')}}" class="btn btn-primary float-right text-white">
                                        <i class="fas fa-plus-circle"></i>
                                        Add New
                                    </a>
                                @endif
                            </div>
                            <!-- /.card-header -->
                            <div class="card-body table-responsive">
                                <table class="table table-bordered table-hover table-striped">
                                    <thead>
                                    <tr>
                                        <th>SL</th>
                                        <th>Black Title</th>
                                        <th>Color Title</th>
                                        <th>Description</th>
                                        <th>Button Label</th>
                                        <th>Button Link</th>
                                        <th>Serial No.</th>
                                        <th>Image</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    @php
                                        use App\CustomClass\OwnLibrary;
                                        $i = OwnLibrary::paginationSerial($sliders);
                                    @endphp
                                    @forelse($sliders as $slider)
                                        <tr>
                                            <td>{{$i++}}</td>
                                            <td>{{ $slider->title_black }}</td>
                                            <td>{{ $slider->title_color }}</td>
                                            <td>{!! nl2br($slider->description) !!}</td>
                                            <td>{{ $slider->button_label }}</td>
                                            <td>{{ substr($slider->link, 0, 20) }}</td>
                                            <td>{{ $slider->order_serial }}</td>
                                            <td>
                                                @if(!empty($slider->slider_name))
                                                <a href="{{ URL::to('slider_image_show/' . $slider->id ) }}" target="_blank">
                                                    <img src="{{ asset($slider->slider_name) }}" width="100">
                                                </a>
                                                @endif
                                            </td>
                                            <td class="text-center">
                                                @if($slider->status == 1)
                                                    <button class="btn btn-xs btn-success">Active</button>
                                                @else
                                                    <button class="btn btn-xs btn-danger">Inactive</button>
                                                @endif
                                            </td>
                                            <td class="text-center">
                                                @if(!empty($aclList[1][3]) || !empty($aclList[1][4]))
                                                    <form method="post" action="{{ route('slider.destroy',$slider->id) }}">
                                                        @if(!empty($aclList[1][3]))
                                                            <a class="btn btn-xs btn-warning text-white" href="{{route('slider.edit',$slider->id)}}" title="Edit">
                                                                <i class="fas fa-pencil-alt"></i>
                                                            </a>
                                                        @endif
                                                        @if(!empty($aclList[1][4]))
                                                            @method('delete')
                                                            @csrf
                                                            <button type="submit" class="btn btn-xs btn-danger text-white delete" title="Delete">
                                                                <i class="fas fa-trash-alt"></i>
                                                            </button>
                                                        @endif
                                                    </form>
                                                @endif
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="10" class="text-center">Nothing Found</td>
                                        </tr>
                                    @endforelse

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.card-body -->
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div><!-- /.container-fluid -->
        </div>
        <!-- /.content -->
    </div>
@endsection
