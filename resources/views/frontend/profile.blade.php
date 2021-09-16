@extends('frontend.layout.master')
@section('title','Home')

@section('content')

    <section class="ic-profile-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="ic-profile-left">
                        <div class="ic-user">
                            <div class="ic-cover-bg">

                                @if(auth()->user()->cover_photo)
                                    <img id="cover_photo" src="{{asset(auth()->user()->cover_photo)}}" class="img-fluid" alt="cover">
                                @else
                                    <img id="cover_photo" src="{{asset('frontend/images/profile-cover.png')}}" class="img-fluid" alt="default cover">
                                @endif

                                <div class="ic-edit-cover-photo">
                                    <input class="d-none" id="cover_photo_upload" type="file" name="cover_photo">
                                    <a href="#">
                                        <i class="icofont-camera"></i>
                                        <label id="cover_photo_label" for="cover_photo_upload">edit cover photo</label>
                                    </a>
                                </div>
                            </div>
                            <div class="user-profile">

                                    @if(auth()->user()->photo)
                                        <img id="profile_pic" src="{{auth()->user()->photo}}" alt="user">
                                    @else
                                        <img id="profile_pic" src="{{asset('demo-pic/download.png')}}" alt="user">
                                    @endif

                                <div class="ic-edit-profile">
                                    <input class="d-none" id="photo" type="file" name="photo">
                                    <a href="#">
                                        <label for="photo">
                                            <i class="icofont-camera"></i>
                                        </label>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="ic-win-btn">
                            <a href="#">{{$entryWon ?? 00}} <span>Entries Won</span></a>
                            <a href="#">{{ (int) auth()->user()->total_coin ?? 00}} <span>Coins Won</span></a>
                        </div>
                        <div class="ic-total-balance">
                            <p>Current Coins Balance</p>
                            <h4>{{(int) auth()->user()->current_coin ?? 00}}</h4>
                        </div>
                    </div>
                </div>

{{--                Profile Info update form--}}
                <div class="col-lg-8 col-md-7">
                    <div class="ic-profile-right">
                        <div class="title">
                            <h4>Basic info</h4>
                        </div>
                        <form action="{{route('profile.update')}}" method="post" class="ic-profile-basic-info">
                            @csrf
                            @method('put')
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="name">User Name<span class="text-danger">*</span></label>
                                        <input type="text" id="name" class="form-control" placeholder="User Name"
                                               value="{{old('name',auth()->user()->name)}}"
                                        name="name">
                                        <span class="text-danger">{{$errors->has("name") ? $errors->first("name") : ""}}</span>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="paypal_email">paypal email<span class="text-danger">*</span></label>
                                        <input type="text" id="paypal_email" class="form-control"
                                               placeholder="User Paypal email"
                                               value="{{old('paypal_email',auth()->user()->paypal_email)}}"
                                        name="paypal_email">
                                        <span class="text-danger">{{$errors->has("paypal_email") ? $errors->first("paypal_email") : ""}}</span>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="email">email<span class="text-danger">*</span></label>
                                        <input type="email" id="email" class="form-control"
                                               placeholder="User email"
                                               value="{{old('email',auth()->user()->email)}}"
                                        name="email">
                                      <span class="text-danger"> {{$errors->has("email") ? $errors->first("email") : ""}}</span>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <h5 class="text-center text-white my-3">Enter password and confirm password field if you want to change password.</h5>
                                </div>

                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="password">Password</label>
                                        <input type="password" id="password" class="form-control"
                                               placeholder="Enter password if you want to change"
                                               value=""
                                               name="password">
                                        <span class="text-danger" >{{$errors->has("password") ? $errors->first("password") : ""}}</span>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <div class="form-group">
                                        <label for="confirm_password">Confirm Password</label>
                                        <input type="password" id="confirm_password" class="form-control"
                                               placeholder="Confirm Password"
                                               value=""
                                               name="confirm_password">
                                        <span class="text-danger">{{$errors->has("confirm_password") ? $errors->first("confirm_password") : ""}}</span>
                                    </div>
                                </div>

                                <div class="col-12">
                                    <button type="submit" class="ic-btn">update now</button>
                                </div>
                            </div>
                        </form>

                        {{--                    withdraw amount--}}
                        <div class="ic-withdraw" id="withdraw">
                            <div class="title">
                                <h4>Withdraw Coin</h4>
                            </div>
                            <form action="{{route('withdraw.request')}}" method="post" class="ic-profile-basic-info">
                                @csrf
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="amount">Withdraw Amount<span class="text-danger">*</span></label>
                                            <input type="number" step="any" id="amount" class="form-control" placeholder="Enter amount"
                                                   value="{{old('amount')}}"
                                                   name="amount" min="2500">
                                            <span class="text-danger">{{$errors->has("amount") ? $errors->first("amount") : ""}}</span>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <button type="submit" class="ic-btn">Withdraw</button>
                                    </div>
                                </div>
                            </form>
                            <<h6 class="text-warning text-center">1 USD = 100. Minimum withdraw amount is 2500</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection

@section('js')
    <script>
        // change cover photo
        $(document).on('change','#cover_photo_upload',function (){
            let coverPhoto = $('#cover_photo_upload')[0].files[0];
            let _token = '{{ csrf_token() }}';

            let formData = new FormData();

            formData.append('cover_photo', coverPhoto);
            formData.append('_token', _token);
            $('#cover_photo_label').text('Uploading...')
            $.ajax({
                url: '{{route("change.cover.photo")}}',
                method: 'POST',
                contentType: false,
                processData: false,
                data: formData,
                success: function (data) {
                    $('#cover_photo_label').text('edit cover photo');

                    if (data.status === 1 || data.status === 3) {
                        toastr.options =
                            {
                                "closeButton" : true,
                                "progressBar" : true
                            }
                        toastr.error("Unable to change cover photo");
                        return;
                    }
                $('#cover_photo').attr("src", data.data);
                },
                error: function () {
                    $('#cover_photo_label').text('edit cover photo')
                    toastr.options =
                        {
                            "closeButton" : true,
                            "progressBar" : true
                        }
                    toastr.error("Unable to change cover photo");
                }
            })
        });

        // change profile picture
        $(document).on('change','#photo',function (){
            let photo = $('#photo')[0].files[0];
            let _token = '{{ csrf_token() }}';

            let formData = new FormData();

            formData.append('photo', photo);
            formData.append('_token', _token);
            $('#profile_pic').attr("src", "{{asset('demo-pic/loder.gif')}}");
            $.ajax({
                url: '{{route("change.profile.photo")}}',
                method: 'POST',
                contentType: false,
                processData: false,
                data: formData,
                success: function (data) {
                    $('#profile_pic').attr("src", "{{asset('demo-pic/download.png')}}");

                    if (data.status === 1 || data.status === 3) {
                        toastr.options =
                            {
                                "closeButton" : true,
                                "progressBar" : true
                            }
                        toastr.error("Unable to change profile photo");
                        return;
                    }
                    $('#profile_pic').attr("src", data.data);
                },
                error: function () {
                    $('#profile_pic').attr("src", "{{asset('demo-pic/download.png')}}");
                    toastr.options =
                        {
                            "closeButton" : true,
                            "progressBar" : true
                        }
                    toastr.error("Unable to change profile photo");
                }
            })
        });
    </script>
@endsection
