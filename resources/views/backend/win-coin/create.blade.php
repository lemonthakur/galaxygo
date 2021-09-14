@extends("backend.master.main-layout")
@section("page-title","Win Coin Create")
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
                                <h3 class="card-title">Create Win Coin</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="{{route("win-coin.store")}}">
                                @csrf
                                <div class="card-body">
                                    <div class="row">

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="win">Number of win<span class="text-danger">*</span></label>
                                                <input type="number" min="0"
                                                       class="form-control {{$errors->has("win") ? "is-invalid":""}}"
                                                       id="win" name="win" placeholder="Enter Number Of Win"
                                                       value="{{old("win")}}" required>
                                                <span
                                                    class="text-danger"> {{$errors->has("win") ? $errors->first("win") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="out_of">Out of<span class="text-danger">*</span></label>
                                                <input type="number" min="10"
                                                       class="form-control {{$errors->has("out_of") ? "is-invalid":""}}"
                                                       id="out_of" name="out_of" placeholder="Enter Out Of"
                                                       value="{{old("out_of")}}" required>
                                                <span
                                                    class="text-danger"> {{$errors->has("out_of") ? $errors->first("out_of") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label for="coin">Win Coin<span class="text-danger">*</span></label>
                                                <input type="number" min="10"
                                                       class="form-control {{$errors->has("coin") ? "is-invalid":""}}"
                                                       id="coin" name="coin" placeholder="Enter Win Coin"
                                                       value="{{old("coin")}}" required>
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
                                                       value="{{old("coin_name")}}" required>
                                                <span
                                                    class="text-danger"> {{$errors->has("coin_name") ? $errors->first("coin_name") : ""}} </span>
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
