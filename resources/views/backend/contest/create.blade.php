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
                                                <label for="expaire_time">Game Begin At<span
                                                        class="text-danger">*</span></label>
                                                <input readonly type="text"
                                                       class="form-control timepicker {{$errors->has("expaire_time") ? "is-invalid":""}}"
                                                       id="expaire_time" data-target="#expaire_time"
                                                       data-toggle="datetimepicker" name="expaire_time"
                                                       placeholder="Select Game Begin Time"
                                                       value="{{old("expaire_time")}}">
                                                <span
                                                    class="text-danger"> {{$errors->has("expaire_time") ? $errors->first("expaire_time") : ""}} </span>
                                            </div>
                                        </div>

                                        <div class="col-md-12">
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
                                                        <div id="playerSearch">
                                                            <div class="d-flex flex-row align-content-center player" pid="1">
                                                                <div class="">
                                                                    <img class="img-fluid" src="{{asset('upload/player/210906/Nk9zadS8fV.png')}}" alt="">
                                                                </div>
                                                                <div class="name">
                                                                    Drake Lamb
                                                                </div>
                                                            </div>
                                                            <div class="d-flex flex-row align-content-center player" pid="2">
                                                                <div class="">
                                                                    <img class="img-fluid" src="{{asset('upload/player/210906/y0jmvBwIKD.png')}}" alt="">
                                                                </div>
                                                                <div class="name">
                                                                    Drake Lamb
                                                                </div>
                                                            </div>
                                                            <div class="d-flex flex-row align-content-center player" pid="3">
                                                                <div class="">
                                                                    <img class="img-fluid" src="{{asset('upload/player/210906/Nk9zadS8fV.png')}}" alt="">
                                                                </div>
                                                                <div class="name">
                                                                    Drake Lamb
                                                                </div>
                                                            </div>
                                                            <div class="d-flex flex-row align-content-center player">
                                                                <div class="">
                                                                    <img class="img-fluid" src="{{asset('upload/player/210906/y0jmvBwIKD.png')}}" alt="">
                                                                </div>
                                                                <div class="name">
                                                                    Drake Lamb
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <span class="text-danger"></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="location">Location<span
                                                                class="text-red">*</span></label>
                                                        <input type="text"
                                                               class="form-control {{$errors->has("location") ? "is-invalid":""}}"
                                                               id="location" placeholder="Location">
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

                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="versus">Versus<span
                                                                class="text-red">*</span></label>
                                                        <input type="text"
                                                               class="form-control {{$errors->has("versus") ? "is-invalid":""}}"
                                                               id="versus" placeholder="Versus">
                                                        <span class="text-danger"></span>
                                                    </div>
                                                </div>

                                                <div class="col-md-3">
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
                                                        <label for="player_image">
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <p>Player Image<span class="text-red">*</span></p>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <img id="output" src="{{asset('/demo-pic/upload-image.jpg')}}" width="100"/>
                                                                </div>
                                                                <div class="col-md-12">
                                                                    <span style="font-weight: normal" class="text-danger"></span>
                                                                </div>
                                                            </div>
                                                            <input type="file"
                                                                   class="form-control image d-none {{$errors->has("player_image") ? "is-invalid":""}}"
                                                                   accept="image/png, image/gif, image/jpeg"
                                                                   id="player_image" placeholder="Player Image">
                                                        </label>

                                                    </div>
                                                </div>

                                                <div class="col-md-2 text-right">
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
                                                             style="width: 50px;height:50px;border-radius:50%;"/>
                                                    </td>
                                                    <td>
                                                        Name: {{ucwords($row->name)}} <br/>
                                                        Location: {{strtoupper($row->options['location'])}} <br/>
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

        $("#player_name").on('input',function () {
            $("#playerSearch").css('display','block')
        });

        $(document).on('click','.player',function () {
            alert($(this).attr('pid'));
            $("#playerSearch").css('display','none');
        });

        $('#btn-loader').hide();
        $('#add-player').on('click', function () {

            $('#add-player').hide();
            $('#btn-loader').show();

            let playerName = $('#player_name').val();
            let location = $('#location').val();
            let playedOn = $('#played_on').val();
            let versus = $('#versus').val();
            let score = $('#score').val();
            let playerImage = $('#player_image')[0].files[0];
            let _token = '{{ csrf_token() }}';

            $('#player_name').closest('.form-group').find('.text-danger').text('');
            $('#location').closest('.form-group').find('.text-danger').text('');
            $('#played_on').closest('.form-group').find('.text-danger').text('');
            $('#versus').closest('.form-group').find('.text-danger').text('');
            $('#score').closest('.form-group').find('.text-danger').text('');
            $('#player_image').closest('.form-group').find('.text-danger').text('');

            let formData = new FormData();
            formData.append('player_name', playerName);
            formData.append('location', location);
            formData.append('played_on', playedOn);
            formData.append('versus', versus);
            formData.append('score', score);
            formData.append('player_image', playerImage);
            formData.append('_token', _token);

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
                    $('#location').val('');
                    $('#versus').val('');
                    $('#score').val('');
                    $('#player_image').val(null);
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
    </script>
@endsection
