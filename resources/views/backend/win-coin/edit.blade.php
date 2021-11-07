@extends("backend.master.main-layout")
@section("page-title","Win Coin Edit")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Win Coin</h1>
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
                    <div class="col-md-6 offset-md-3">
                        <div class="card card-dark">
                            <div class="card-header">
                                <h3 class="card-title">Edit Win Coin</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="{{route("win-coin.update",$winCoin->id)}}">
                            @csrf
                            @method('put')

                            <!-- /.card-body -->
                                <div class="card-body">
                                    <div class="row">

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="win">Number of win<span class="text-danger">*</span></label>
                                                <input type="number" min="1"
                                                       class="form-control {{$errors->has("win") ? "is-invalid":""}}"
                                                       id="win" name="win" placeholder="Enter Number Of Win"
                                                       value="{{old("win",$winCoin->win)}}" required>
                                                <span
                                                    class="text-danger"> {{$errors->has("win") ? $errors->first("win") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="out_of">Out of<span class="text-danger">*</span></label>
                                                <input type="number" min="1"
                                                       class="form-control {{$errors->has("out_of") ? "is-invalid":""}}"
                                                       id="out_of" name="out_of" placeholder="Enter Out Of"
                                                       value="{{old("out_of",$winCoin->out_of)}}" required>
                                                <span
                                                    class="text-danger"> {{$errors->has("out_of") ? $errors->first("out_of") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="coin">Win Coin<span class="text-danger">*</span></label>
                                                <input type="number" min="1"
                                                       class="form-control {{$errors->has("coin") ? "is-invalid":""}}"
                                                       id="coin" name="coin" placeholder="Enter Win Coin"
                                                       value="{{old("coin",$winCoin->coin)}}" required>
                                                <span
                                                    class="text-danger"> {{$errors->has("coin") ? $errors->first("coin") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="coin_name">Coin Name</label>
                                                <input type="text" maxlength="100"
                                                       class="form-control {{$errors->has("coin_name") ? "is-invalid":""}}"
                                                       id="coin_name" name="coin_name" placeholder="Enter Coin Name"
                                                       value="{{old("coin_name",$winCoin->coin_name)}}" required>
                                                <span
                                                    class="text-danger"> {{$errors->has("coin_name") ? $errors->first("coin_name") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group select2-parent">
                                                <label>Status</label>
                                                <select name="status" class="form-control single-select2" style="width: 100%;" data-select2-id="1" tabindex="-1" aria-hidden="true">
                                                    <option value="0" {{(old("status") == 0 || $winCoin->status == 0 ) ? "selected" : "" }}>Inactive</option>
                                                    <option value="1" {{(old("status") == 1 || $winCoin->status == 1 ) ? "selected" : "" }}>Active</option>
                                                </select>
                                            </div>
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
