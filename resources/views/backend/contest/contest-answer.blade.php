@extends("backend.master.main-layout")
@section("page-title","Contest-Answer")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Contest</h1>
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
                    <div class="col-md-10 offset-md-1">

                        {{--                        Edit Players--}}
                        <div class="card card-dark mt-3">
                            <div class="card-header">
                                <h3 class="card-title">Submit Contest Answer</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->

                            <div class="card-body">
                                <form method="post" action="{{route("contest.answer.submit")}}">
                                    @csrf
                                    <input type="hidden" name="contest_id" value="{{$contest->id}}">
                                    <table id="player-table" class="table table-bordered table-striped mt-3">
                                        <tbody>
                                        @foreach($contest->contestPlayers as $player)
                                            <tr>
                                                <td>
                                                    <img src="{{asset($player->player_image)}}"
                                                         style="width: 50px;height:50px;border-radius:50%;"/>
                                                </td>
                                                <td>
                                                    Name: {{ucwords($player->name)}} <br/>
                                                    Location: {{ucwords($player->location)}}
                                                </td>
                                                <td>
                                                    Versus: {{ucwords($player->versus)}} <br/>
                                                    Score: {{$player->score}}
                                                </td>
                                                <td>
                                                    @if($player->answer == 0)
                                                        Status: <small class="bg-danger p-1 text-white">No Answer</small>
                                                    @elseif($player->answer == 1)
                                                        Final Score: {{$player->final_score}} <br />
                                                        Status: <small class="bg-warning p-1 text-white">Under</small>
                                                    @else
                                                        Final Score: {{$player->final_score}} <br />
                                                        Status: <small class="bg-info p-1 text-white">Over</small>
                                                    @endif
                                                </td>
                                                <td class="text-center align-middle">
                                                    <input name="contest_player_id[]" type="hidden"
                                                           value="{{$player->id}}">
                                                    <input type="number" step="any" min="0" class="form-control" name="final_score[]" placeholder="Enter final score"/>
                                                </td>
                                            </tr>
                                        @endforeach
                                        </tbody>
                                        <tfoot>
                                        <tr>
                                            <td colspan="5" class="text-right">
                                                <a href="{{route('contest.index')}}" class="btn btn-default">Back</a>
                                                <button class="btn btn-primary" type="submit">Submit Answer</button>
                                            </td>
                                        </tr>
                                        </tfoot>
                                    </table>
                                </form>
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
