@extends("backend.master.main-layout")
@section("page-title","Contest-Edit")
@section("main-content")
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0 text-dark">Contest</h1>
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
                        {{--                        Edit Conttest--}}
                        <div class="card card-dark">
                            <div class="card-header">
                                <h3 class="card-title">Edit Contest</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="{{route("contest.update",$contest->id)}}">
                                @csrf
                                @method('put')
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="name">Game Date<span class="text-danger">*</span></label>
                                                <input readonly type="text"
                                                       class="form-control datepicker {{$errors->has("name") ? "is-invalid":""}}"
                                                       id="name" data-target="#name" data-toggle="datetimepicker"
                                                       name="name" placeholder="Select Game Date"
                                                       value="{{old("name",date('d-m-Y',strtotime($contest->name)))}}">
                                                <span
                                                    class="text-danger"> {{$errors->has("name") ? $errors->first("name") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="time_start">Count Down Begin<span class="text-danger">*</span></label>
                                                <input readonly type="text"
                                                       class="form-control timepicker {{$errors->has("time_start") ? "is-invalid":""}}"
                                                       id="time_start" data-target="#time_start"
                                                       data-toggle="datetimepicker" name="time_start"
                                                       placeholder="Select Count Down Begin Time"
                                                       value="{{old("time_start",$contest->time_start)}}">
                                                <span
                                                    class="text-danger"> {{$errors->has("time_start") ? $errors->first("time_start") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <label for="time_end">Count Down End<span class="text-danger">*</span></label>
                                                <input readonly type="text"
                                                       class="form-control timepicker {{$errors->has("time_end") ? "is-invalid":""}}"
                                                       id="time_end" data-target="#time_end"
                                                       data-toggle="datetimepicker" name="time_end"
                                                       placeholder="Select Count Down End Time"
                                                       value="{{old("time_end",$contest->time_end)}}">
                                                <span
                                                    class="text-danger"> {{$errors->has("time_end") ? $errors->first("time_end") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-2">
                                            <button style="margin-top: 15%;" type="submit" class="btn btn-dark">Update
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <!-- /.card-body -->
                            </form>
                        </div>

                        {{--                        Edit Players--}}
                        <div class="card card-dark mt-3">
                            <div class="card-header">
                                <h3 class="card-title">Edit Players</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->

                            <div class="card-body">
                                <form method="post" action="{{route("contest-player.store")}}" enctype="multipart/form-data">
                                    @csrf
                                    <input type="hidden" name="contest_id" value="{{$contest->id}}">
                                    <div class="row">

                                        <div class="col-md-12 text-center">
                                            <h4 class="text-center">Player Add</h4>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group" style="position: relative">
                                                <label for="player_name">Player Name<span
                                                        class="text-red">*</span></label>
                                                <input type="text"
                                                       class="form-control {{$errors->has("player_name") ? "is-invalid":""}}"
                                                       name="player_name" id="player_name" placeholder="Player Name"
                                                       value="{{old('player_name')}}" autocomplete="off">
                                                <input type="text" class="d-none" id="player_id" name="player_id" value="{{old('player_id')}}">

                                                <div id="playerSearch"></div>
                                                <span
                                                    class="text-danger">{{$errors->has("player_name") ? $errors->first("player_name") : ""}}</span>
                                            </div>
                                        </div>

{{--                                        <div class="col-md-4">--}}
{{--                                            <div class="form-group">--}}
{{--                                                <label for="location">Location<span class="text-red">*</span></label>--}}
{{--                                                <input type="text"--}}
{{--                                                       class="form-control {{$errors->has("location") ? "is-invalid":""}}"--}}
{{--                                                       id="location" placeholder="Location"--}}
{{--                                                name="location" value="{{old('location')}}">--}}
{{--                                                <span--}}
{{--                                                    class="text-danger">{{$errors->has("location") ? $errors->first("location") : ""}}</span>--}}
{{--                                            </div>--}}
{{--                                        </div>--}}

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="played_on">Played On<span class="text-red">*</span></label>
                                                <input type="text" readonly
                                                       class="form-control datetimepicker {{$errors->has("played_on") ? "is-invalid":""}}"
                                                       id="played_on" data-target="#played_on"
                                                       data-toggle="datetimepicker" placeholder="play time"
                                                       name="played_on" value="{{old('played_on')}}">
                                                <span
                                                    class="text-danger">{{$errors->has("location") ? $errors->first("location") : ""}}</span>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="versus">Versus<span class="text-red">*</span></label>
                                                <input type="text"
                                                       class="form-control {{$errors->has("versus") ? "is-invalid":""}}"
                                                       id="versus" placeholder="Versus"
                                                name="versus" value="{{old('versus')}}">
                                                <span
                                                    class="text-danger">{{$errors->has("versus") ? $errors->first("versus") : ""}}</span>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="score">Score<span class="text-red">*</span></label>
                                                <input type="number" step="any"
                                                       class="form-control {{$errors->has("score") ? "is-invalid":""}}"
                                                       id="score" placeholder="Score"
                                                name="score" value="{{old('score')}}">
                                                <span class="text-danger">{{$errors->has("score") ? $errors->first("score") : ""}}</span>
                                            </div>
                                        </div>

                                        <div class="col-md-4">
                                            <div class="form-group">
                                                <label for="score">Player Image<span class="text-red">*</span></label><br/>
                                                <img class="ml-5" id="output" src="{{asset('/demo-pic/upload-image.jpg')}}" width="120"/><br/>
                                                <input type="text" class="form-control image d-none" id="player_image" name="player_image" value="{{old('player_image')}}">
                                                <span class="text-danger">{{$errors->has("player_image") ? $errors->first("player_image") : ""}}</span>
                                            </div>
                                        </div>

                                        <div class="col-md-4 text-right">
                                            <button type="submit" style="margin-top: 24%;"
                                                    class="btn btn-info">Add Player
                                            </button>
                                        </div>

                                    </div>
                                </form>

                                <table id="player-table" class="table table-bordered table-striped mt-3">
                                    <thead>
                                    <tr>
                                        <th colspan="4" class="text-center">Added Player</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @php
                                        $sl = 1;
                                    @endphp
                                    @foreach($contest->contestPlayers as $player)
                                        <tr>
                                            <td class="text-center">{{$sl++}}</td>
                                            <td>
                                                <img src="{{$player->player_image}}"
                                                     style="width: 50px;height:50px;"/>
                                            </td>
                                            <td>
                                                Name: {{ucwords($player->player_name)}} <br/>
{{--                                                Location: {{strtoupper($player->location)}} <br/>--}}
                                                Played On: {{date('d-m-Y h:i a',strtotime($player->played_on))}}
                                            </td>
                                            <td>
                                                Versus: {{strtoupper($player->versus)}} <br/>
                                                Score: {{$player->score}}
                                            </td>
                                            <td class="text-center align-middle">
                                                <form method="post"
                                                      action="{{ route('contest-player.destroy',$player->id) }}">
                                                    @method('delete')
                                                    @csrf
                                                    <button type="submit"
                                                            class="btn btn-xs btn-danger text-white delete"
                                                            title="Delete">
                                                        <i class="fas fa-trash-alt"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    @endforeach
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

@section('js')
    <script>
        $("#player_name").on('input',function () {
            var search = $(this).val();
            $("#playerSearch").css('display','block');
            var _token = "{{csrf_token()}}";
            $.ajax({
                url: '{{route("player.search")}}',
                method: 'POST',
                data: {search:search, _token:_token},
                success:function (data) {
                    $("#playerSearch").empty();
                    $("#playerSearch").append(data);
                }
            });
        });

        $(document).on('click','.player',function () {

            $("#player_name").val($(this).attr('name'));
            $("#player_id").val($(this).attr('pid'));

            $("#output").attr('src',$(this).attr('imgUrl'));
            $("#player_image").val($(this).attr('imgUrl'));

            $("#playerSearch").css('display','none');
        });
    </script>
@endsection
