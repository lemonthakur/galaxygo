@extends('frontend.layout.master')
@section('title','Withdraw')

@section('content')

    <section class="ic-profile-area">
        <div class="container">
            <div class="row">
                <div class="offset-lg-3 offset-md-3 col-lg-6 col-md-6">
                    <div class="ic-profile-right">
                        {{--                    withdraw amount--}}
                        <div class="ic-withdraw" id="withdraw">
                            <div class="title">
                                <h4>Withdraw Coin</h4>
                            </div>
                            <form action="{{route('withdraw.request')}}" method="post" class="ic-profile-basic-info">
                                @csrf
                                <div class="row">
                                    {{-- @if(!auth()->user()->paypal_email) --}}
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="amount">PayPal Email or SHIBA wallet address<span class="text-danger">*</span></label>
                                            <input type="email" id="paypal_email" class="form-control" placeholder="Enter paypal email"
                                                   value="{{old("paypal_email", auth()->user()->paypal_email)}}"
                                                   name="paypal_email" required>
                                            <span class="text-danger">{{$errors->has("paypal_email") ? $errors->first("paypal_email") : ""}}</span>
                                        </div>
                                    </div>
                                    {{-- @endif --}}

                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="amount">Withdraw Amount<span class="text-danger">*</span></label>
                                            <input type="number" step="any" id="amount" class="form-control" placeholder="Enter amount"
                                                   value="{{old('amount')}}"
                                                   name="amount" min="{{ $site_setting->min_withdraw_amount }}" required="">
                                            <span class="text-danger">{{$errors->has("amount") ? $errors->first("amount") : ""}}</span>
                                        </div>
                                    </div>

                                    <div class="col-12">
                                        <button type="submit" class="ic-btn">Withdraw</button>
                                    </div>
                                </div>
                            </form>
                            <!-- <<h6 class="text-warning text-center">Minimum withdraw 100 Dogecoin</h6> -->
                            <<h6 class="text-warning text-center">@if($site_setting->withdraw_message) {!! nl2br($site_setting->withdraw_message) !!} @else Minimum withdraw 100 Dogecoin @endif</h6>
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
