@extends("backend.master.main-layout")
@section("page-title","Footer")
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
                                <h3 class="card-title">Circle Image List</h3>
                                @if(!empty($aclList[24][2]))
                                    <a href="{{route('footer-circle-image.create')}}" class="btn btn-primary float-right text-white">
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
                                        <th>Title</th>
                                        <th>Link</th>
                                        <th>Serial No.</th>
                                        <th>Image</th>
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    @php
                                        $i = 1;
                                    @endphp
                                    @forelse($cir_images as $cir_image)
                                        <tr>
                                            <td>{{$i++}}</td>
                                            <td>{{ $cir_image->title }}</td>
                                            <td>{{ substr($cir_image->link, 0, 20) }}</td>
                                            <td>{{ $cir_image->order_serial }}</td>
                                            <td>
                                                @if(!empty($cir_image->image_name))
                                                <a href="{{ URL::to('circle_image_show/' . $cir_image->id ) }}" target="_blank">
                                                    <img src="{{ asset($cir_image->image_name) }}" width="100">
                                                </a>
                                                @endif
                                            </td>
                                            <td class="text-center">
                                                @if($cir_image->status == 1)
                                                    <button class="btn btn-xs btn-success">Active</button>
                                                @else
                                                    <button class="btn btn-xs btn-danger">Inactive</button>
                                                @endif
                                            </td>
                                            <td class="text-center">
                                                @if(!empty($aclList[24][3]) || !empty($aclList[24][4]))
                                                    <form method="post" action="{{ route('footer-circle-image.destroy',$cir_image->id) }}">
                                                        @if(!empty($aclList[24][3]))
                                                            <a class="btn btn-xs btn-warning text-white" href="{{route('footer-circle-image.edit',$cir_image->id)}}" title="Edit">
                                                                <i class="fas fa-pencil-alt"></i>
                                                            </a>
                                                        @endif
                                                        @if(!empty($aclList[24][4]))
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
                                            <td colspan="7" class="text-center">Nothing Found</td>
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
