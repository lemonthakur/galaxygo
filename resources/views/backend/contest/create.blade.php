@extends("backend.master.main-layout")
@section("page-title","Contest-Create")
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
                        <div class="card card-dark">
                            <div class="card-header">
                                <h3 class="card-title">Create Contest</h3>
                            </div>
                            <!-- /.card-header -->
                            <!-- form start -->
                            <form method="post" action="{{route("contest.store")}}">
                                @csrf
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="name">Game Date<span class="text-danger">*</span></label>
                                                <input readonly type="text"
                                                       class="form-control datepicker {{$errors->has("name") ? "is-invalid":""}}"
                                                       id="name" data-target="#name" data-toggle="datetimepicker"
                                                       name="name" placeholder="Select Game Date"
                                                       value="{{old("name")}}">
                                                <span
                                                    class="text-danger"> {{$errors->has("name") ? $errors->first("name") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="time_start">Count Down Begin<span class="text-danger">*</span></label>
                                                <input readonly type="text"
                                                       class="form-control datetimepicker {{$errors->has("time_start") ? "is-invalid":""}}"
                                                       id="time_start" data-target="#time_start"
                                                       data-toggle="datetimepicker" name="time_start"
                                                       placeholder="Select Count Down Begin Time"
                                                       value="{{old("time_start")}}">
                                                <span
                                                    class="text-danger"> {{$errors->has("time_start") ? $errors->first("time_start") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="win_coin">Win Coin<span class="text-danger">*</span></label>
                                                <select class="form-control {{$errors->has("win_coins") ? "is-invalid":""}}"
                                                       id="win_coin" name="win_coins[]" multiple>
                                                    <option></option>
                                                    @foreach($winCoins as $winCoin)
                                                        <option value="{{$winCoin->id}}">
                                                            {{$winCoin->win}} Of {{$winCoin->out_of}} Win {{$winCoin->coin}} {{$winCoin->coin_name}}
                                                        </option>
                                                    @endforeach
                                                </select>
                                                <span
                                                    class="text-danger"> {{$errors->has("win_coins") ? $errors->first("win_coins") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="contest_type">Contest Type<span class="text-danger">*</span></label>
                                                <select class="form-control {{$errors->has("contest_type") ? "is-invalid":""}}"
                                                        id="contest_type" name="contest_type">
                                                    <option @if(empty(old("contest_type"))) selected @endif disabled hidden>Select Contest Type</option>
                                                    <option @if(old("contest_type") == "Fantasy score") selected @endif value="Fantasy score">Fantasy score</option>
                                                    <option @if(old("contest_type") == "Passing yards") selected @endif value="Passing yards">Passing yards</option>
                                                    <option @if(old("contest_type") == "Rushing score") selected @endif value="Rushing score">Rushing score</option>
                                                    <option @if(old("contest_type") == "Receiving score") selected @endif value="Receiving score">Receiving score</option>
                                                    <option @if(old("contest_type") == "Shot") selected @endif value="Shot">Shot</option>
                                                </select>
                                                <span class="text-danger">
                                                    {{$errors->has("contest_type") ? $errors->first("contest_type") : ""}}
                                                </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label for="is_paid">Is Paid<span class="text-danger">*</span></label>
                                                <select class="form-control {{$errors->has("is_paid") ? "is-invalid":""}}"
                                                        id="is_paid" name="is_paid">
                                                    <option @if(empty(old("is_paid"))) selected @endif disabled hidden>Select One</option>
                                                    <option @if(old("is_paid") == 2) selected @endif value="2">Yes</option>
                                                    <option @if(old("is_paid") == 1) selected @endif value="1">No</option>
                                                </select>
                                                <span class="text-danger">
                                                    {{$errors->has("is_paid") ? $errors->first("is_paid") : ""}}
                                                </span>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div class="form-group @if(empty(old("is_paid")) || old("is_paid") != 2) d-none @endif" id="is-paid-amount">
                                                <label for="amount">Amount<span class="text-danger">*</span></label>
                                                <input type="number"
                                                       class="form-control {{$errors->has("amount") ? "is-invalid":""}}"
                                                       id="amount" value="{{old("amount")}}" min="1" name="amount">
                                                <span
                                                    class="text-danger"> {{$errors->has("amount") ? $errors->first("amount") : ""}} </span>
                                            </div>
                                        </div>

{{--                                        <div class="col-md-4">--}}
{{--                                            <div class="form-group">--}}
{{--                                                <label for="time_end">Count Down End<span class="text-danger">*</span></label>--}}
{{--                                                <input readonly type="text"--}}
{{--                                                       class="form-control datetimepicker {{$errors->has("time_end") ? "is-invalid":""}}"--}}
{{--                                                       id="time_end" data-target="#time_end"--}}
{{--                                                       data-toggle="datetimepicker" name="time_end"--}}
{{--                                                       placeholder="Select Count Down End Time"--}}
{{--                                                       value="{{old("time_end")}}">--}}
{{--                                                <span--}}
{{--                                                    class="text-danger"> {{$errors->has("time_end") ? $errors->first("time_end") : ""}} </span>--}}
{{--                                            </div>--}}
{{--                                        </div>--}}

                                        <div class="col-md-12" id="forTarget">
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
                                                               id="player_name" placeholder="Player Name" autocomplete="off">

                                                        <input type="text" class="d-none" id="player_id" name="player_id">

                                                        <div id="playerSearch"></div>
                                                        <span class="text-danger"></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="played_on">Played On<span class="text-red">*</span></label>
                                                        <input readonly type="text"
                                                               class="form-control datetimepicker {{$errors->has("played_on") ? "is-invalid":""}}"
                                                               id="played_on" data-target="#played_on"
                                                               data-toggle="datetimepicker" placeholder="Play Time">
                                                        <span class="text-danger"></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="versus">Versus<span
                                                                class="text-red">*</span></label>
                                                        <input type="text"
                                                               class="form-control {{$errors->has("versus") ? "is-invalid":""}}"
                                                               id="versus" placeholder="Versus">
                                                        <span class="text-danger"></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="score">Score<span class="text-red">*</span></label>
                                                        <input type="number" step="any"
                                                               class="form-control {{$errors->has("score") ? "is-invalid":""}}"
                                                               id="score" placeholder="Score">
                                                        <span class="text-danger"></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="score">Player Image<span class="text-red">*</span></label><br/>
                                                        <img id="output" src="{{asset('/demo-pic/upload-image.jpg')}}" width="120"/><br/>
                                                        <input type="text" class="form-control image d-none" id="player_image">
                                                        <span style="font-weight: normal" class="text-danger d-block"></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-4 text-right">
                                                    <button type="button" style="margin-top: 24%;" id="cancel-player"
                                                            class="btn btn-danger d-none">Cancel
                                                    </button>
                                                    <input type="hidden" id="edit_id" name="edit_id">

                                                    <button type="button" style="margin-top: 24%;" id="add-player"
                                                            class="btn btn-info">Add Player
                                                    </button>

                                                    <button id="btn-loader" class="btn btn-info" type="button" style="margin-top: 24%;" disabled>
                                                        <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
                                                        Add Player...
                                                    </button>
                                                </div>

                                            </div>
                                        </div>

                                        <table id="player-table" class="table table-bordered table-striped mt-3">
                                            <thead>
                                            <tr>
                                                <th colspan="5" class="text-center">Added Player</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            @php
                                                $sl = 1;
                                            @endphp
                                            @foreach(Cart::content() as $row)
                                                <tr>
                                                    <td class="text-center">{{$sl++}}</td>
                                                    <td>
                                                        <img src="{{asset($row->options['player_image'])}}"
                                                             style="width: 100px;"/>
                                                    </td>
                                                    <td>
                                                        Name: {{ucwords($row->name)}} <br/>
{{--                                                        Location: {{strtoupper($row->options['location'])}} <br/>--}}
                                                        Played On: {{$row->options['played_on']}}
                                                    </td>
                                                    <td>
                                                        Versus: {{strtoupper($row->options['versus'])}} <br/>
                                                        Score: {{$row->options['score']}}
                                                    </td>
                                                    <td class="text-center align-middle">
                                                        <button rowId="{{$row->rowId}}" type="button"
                                                                class="btn btn-danger btn-xs removeCart"><i
                                                                class="fas fa-trash"></i></button>
                                                        <button editRowId="{{$row->rowId}}" type="button" class="btn btn-success btn-xs editCart"
                                                                attr-player="{{$row->name}}" attr-player-id="{{$row->id}}" attr-played-on="{{$row->options['played_on']}}"
                                                                attr-versus="{{$row->options['versus']}}" attr-score="{{$row->options['score']}}"
                                                                attr-player-image="{{$row->options['player_image']}}">
                                                            <i class="fas fa-edit"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            @endforeach
                                            </tbody>
                                        </table>

                                    </div>
                                </div>
                                <!-- /.card-body -->

                                <div class="card-footer text-right">
                                    <button type="submit" class="btn btn-dark">Submit</button>
                                    <a href="{{route('contest.index')}}" class="btn btn-default cancel">Back</a>
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

        $("#is_paid").on("change",function () {
            const isPaidAmount = $("#is-paid-amount");
            const isPaidAmountIn = $("#is-paid-amount input");
            if ($(this).val() == 2){
                isPaidAmount.removeClass("d-none");
                isPaidAmountIn.prop('required',true);
            }else{
                isPaidAmount.addClass("d-none");
                isPaidAmountIn.prop('required',false);
            }
        });


        $('#win_coin').select2({
            placeholder: "Select a win condition",
            allowClear: true
        });

        $("#player_name").on('focus',function () {
            var search = $(this).val();
            var _token = "{{csrf_token()}}";
            $.ajax({
                url: '{{route("player.search")}}',
                method: 'POST',
                data: {_token:_token},
                success:function (data) {
                    $("#playerSearch").empty();
                    $("#playerSearch").append(data);
                    $("#playerSearch").css('display','block');
                    $("#playerSearch").css('overflow-y','scroll');
                }
            });
        });

        $("#player_name").on('input',function () {
            var search = $(this).val();
            var _token = "{{csrf_token()}}";
            $.ajax({
                url: '{{route("player.search")}}',
                method: 'POST',
                data: {search:search, _token:_token},
                success:function (data) {
                    $("#playerSearch").empty();
                    $("#playerSearch").append(data);
                    $("#playerSearch").css('display','block');
                    $("#playerSearch").css('overflow-y','scroll');
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

        // Add Player
        $('#btn-loader').hide();
        $('#add-player').on('click', function () {

            $('#add-player').hide();
            $('#btn-loader').show();

            let playerName = $('#player_name').val();
            let playerId = $('#player_id').val();
            // let location = $('#location').val();
            let playedOn = $('#played_on').val();
            let versus = $('#versus').val();
            let score = $('#score').val();
            let playerImage = $('#player_image').val();
            let edit_id = $('#edit_id').val();
            let _token = '{{ csrf_token() }}';

            $('#player_name').closest('.form-group').find('.text-danger').text('');
            // $('#location').closest('.form-group').find('.text-danger').text('');
            $('#played_on').closest('.form-group').find('.text-danger').text('');
            $('#versus').closest('.form-group').find('.text-danger').text('');
            $('#score').closest('.form-group').find('.text-danger').text('');
            $('#player_image').closest('.form-group').find('.text-danger').text('');

            let formData = new FormData();
            formData.append('player_name', playerName);
            formData.append('player_id', playerId);
            // formData.append('location', location);
            formData.append('played_on', playedOn);
            formData.append('versus', versus);
            formData.append('score', score);
            formData.append('player_image', playerImage);
            formData.append('_token', _token);
            formData.append('rowId', edit_id);

            $.ajax({
                url: '{{route("player.add.cart")}}',
                method: 'POST',
                contentType: false,
                processData: false,
                data: formData,
                success: function (data) {
                    $('#add-player').show();
                    $('#btn-loader').hide();
                    $('#output').attr('src',"{{asset('/demo-pic/upload-image.jpg')}}");
                    if (data.status === 1) {
                        validate(data);
                        return;
                    }

                    $('#player-table tbody').empty();
                    $('#player-table tbody').append(data);

                    $('#player_name').val('');
                    $('#player_id').val('');
                    $('#played_on').val('');
                    $('#location').val('');
                    $('#versus').val('');
                    $('#score').val('');
                    $('#player_image').val('');
                    $('#edit_id').val('');

                    $("#add-player").html("Add Player");
                    $("#cancel-player").addClass("d-none");
                },
                error: function () {
                    $('#add-player').css('display','block');
                    $('#btn-loader').css('display','none');
                    $('#output').attr('src',"{{asset('/demo-pic/upload-image.jpg')}}");
                    Swal.fire(
                        '',
                        "Unable to add player",
                        'error'
                    )
                }
            })


        });

        $(document).on('click', '.removeCart', function () {
            let selectBtn = $(this);
            let rowId = selectBtn.attr('rowId');
            let _token = '{{ csrf_token() }}';
            $.ajax({
                type: 'post',
                url: '{{route("player.remove.cart")}}',
                data: {rowId, _token},
                success: function (data) {
                    $('#player-table tbody').empty();
                    $('#player-table tbody').append(data);
                }
            });
        })

        // show validation message
        function validate(data) {
            $.each(data.errors, function (key, value) {
                $('#' + key).closest('.form-group').find('.text-danger').text(value[0]);
                // $('#'+key).addClass('is-invalid');
            })
        }

        // Edit contest player
        $(document).on("click", ".editCart", function(){
            let editRowId       = $(this).attr("editRowId");
            let edt_player_id   = $(this).attr("attr-player-id");
            let edt_player      = $(this).attr("attr-player");
            let edt_played_on   = $(this).attr("attr-played-on");
            let edt_versus      = $(this).attr("attr-versus");
            let edt_score       = $(this).attr("attr-score");
            let edt_player_image      = $(this).attr("attr-player-image");

            $("#player_name").val(edt_player);
            $("#player_id").val(edt_player_id);
            $("#played_on").val(edt_played_on);
            $("#versus").val(edt_versus);
            $("#score").val(edt_score);

            $("#output").attr('src',edt_player_image);
            $("#player_image").val(edt_player_image);

            $("#add-player").html("Update Player");
            $("#cancel-player").removeClass("d-none");
            $("#edit_id").val(editRowId);

            $('html, body').animate({
                scrollTop: $("#forTarget").offset().top
            }, 200);
        });

        $(document).on("click", "#cancel-player", function(){
            $('#player_name').val('');
            $('#player_id').val('');
            $('#played_on').val('');
            $('#location').val('');
            $('#versus').val('');
            $('#score').val('');
            $('#player_image').val('');
            $("#output").attr('src','');
            $('#edit_id').val('');

            $("#add-player").html("Add Player");
            $("#cancel-player").addClass("d-none");
        });
    </script>
@endsection
