@php
 if (!isset($_COOKIE['galaxy_guest']) || empty($_COOKIE['galaxy_guest']) ||  $_COOKIE['galaxy_guest'] == null){
            $cookieId = Str::random(3).rand(000,999).Str::random(3).date('ymd');
            setcookie('galaxy_guest',$cookieId,time()+315360000, "/");
        }
@endphp

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="HTML5,CSS3,SASS,Bootstrap,JavaScript,Jquery">
    <meta name="author" content="ITCLAN BD" />

    {{--meta tag for social share--}}
    <meta property="og:title" content="{{$siteSetting->site_title ?? env("APP_NAME")}}">
    <!-- <meta property="og:description" content="{{$siteSetting->meta_description ?? ''}}">
    <meta property="og:image" content="{{asset('upload/fbshare/share.jpeg')}}">
    <meta property="og:url" content="{{route('home')}}"> -->
    @if(View::hasSection('facebook_meta'))
        @yield('facebook_meta')
    @else
    <meta property="og:description" content="{{$siteSetting->meta_description ?? ''}}">
        @if($siteSetting->facebook_and_share_image)
            <meta property="og:image" content="{{asset($siteSetting->facebook_and_share_image)}}">
        @else
            <meta property="og:image" content="{{asset('upload/fbshare/share3.jpeg')}}">    
        @endif    
    <meta property="og:url" content="{{route('home')}}">
    @endif
    <meta name="twitter:card" content="{{$siteSetting->logo ?? ''}}">
    <meta property="og:site_name" content="{{$siteSetting->site_title ?? env("APP_NAME")}}">
    <meta name="twitter:image:alt" content="Site Logo">

    <title>@yield('title') - {{$siteSetting->site_title ?? env("APP_NAME")}}</title>
    <!-- Favicon -->
    @if(!empty($siteSetting->icon))
        <link rel="shortcut icon" type="image/jpg" href="{{asset($siteSetting->icon)}}"/>
    @endif

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="{{asset('/frontend/css/bootstrap.min.css')}}">
    <!--Ico Font-->
    <link rel="stylesheet" href="{{asset('frontend/css/icofont.min.css')}}">
    <link rel="stylesheet" href="{{asset('frontend/fonts/flaticon/flaticon.css')}}">
    <!--Nice Select-->
    <link rel="stylesheet" href="{{asset('frontend/css/nice-select.css')}}">
    <!--Owl Carosuel CSS-->
    <link rel="stylesheet" href="{{asset('frontend/css/owl.carousel.min.css')}}">
    <!--Animated Css-->
    <link rel="stylesheet" href="{{asset('frontend/css/animate.css')}}">
    <!--Eazyzoom css--->
    <link rel="stylesheet" href="{{asset('frontend/css/easyzoom.css')}}">
    <!--Video js css--->
    <link rel="stylesheet" href="{{asset('frontend/css/video-js.css')}}">
    <!--venobox js css--->
    <link rel="stylesheet" href="{{asset('frontend/css/venobox.min.css')}}">
    <!-- sweetalert2 css--->
    <link rel="stylesheet" href="{{asset("/admin-lte/plugins/toastr/toastr.min.css")}}">
    <!--Main CSS-->
    <link rel="stylesheet" href="{{asset('frontend/css/style.css')}}">
    <!--Custom CSS-->
    <link rel="stylesheet" href="{{asset('frontend/css/custom.css')}}">

    @yield('css')


    {{------------------------------
    -----------Javascript-----------
    ------------------------------}}

    <!--Jquery-->
    <script src="{{asset('frontend/js/jquery-3.5.1.min.js')}}"></script>
    <!--popper Js-->
    <script src="{{asset("/admin-lte/plugins/popper/umd/popper.min.js")}}"></script>
    <!--Bootstrap Js-->
    <script src="{{asset('frontend/js/bootstrap.min.js')}}"></script>
    <!--sweetalert2 js-->
    <script src="{{asset("/admin-lte/plugins/toastr/toastr.min.js")}}"></script>
</head>

<body class="ic-body" style="background-image: url('{{asset('frontend/images/background-bg.png')}}');">

<div id="loading" class="ic-loading">
    <div id="loading-center">
        <div id="loading-center-absolute">
            <div class="object" id="object_one"></div>
            <div class="object" id="object_two"></div>
            <div class="object" id="object_three"></div>
        </div>
    </div>
</div>

@include('frontend.include.toastr')

@if (Auth::check() && Auth::user()->role_id == 0)
    @include('frontend.include.profile-header')
@else
    @include('frontend.include.header')
@endif

@yield('content');

@include('frontend.include.footer')


<!--===Scroll Top Area Start===-->
<a href="#" class="ic-scroll-top"><i class="icofont-rounded-up"></i></a>
<!--===Scroll Top Area Start===-->

<!--Owl Carosuel Js-->
<script src="{{asset('frontend/js/owl.carousel.min.js')}}"></script>
<!--Nice Select js-->
<script src="{{asset('frontend/js/jquery.nice-select.js')}}"></script>
<!--particles Js-->
<!-- <script src="assets/js/particles.js"></script>
<script src="assets/js/particals-app.js"></script> -->
<!--Eazyzoom js-->
<script src="{{asset('frontend/js/easyzoom.js')}}"></script>
<script src="{{asset('frontend/js/video.min.js')}}"></script>
{{--venobox js--}}
<script src="{{asset('frontend/js/venobox.min.js')}}"></script>
<!--Main Js-->
<script src="{{asset('frontend/js/main.js')}}"></script>
<!--Custom Js-->
<script src="{{asset('frontend/js/custom.js')}}"></script>
<!--Wow Js-->
<script src="{{asset('frontend/js/wow.js')}}"></script>

@if($siteSetting->chat_widget)
    {!! $siteSetting->chat_widget !!}
    @endif

<script>
    new WOW().init();

    $(document).ready(function(){
        $(document).on("click", ".bid-list", function(){
            var id = $(this).parent().parent().find('.custom-add-to-cart-par').attr('data-id');
            var csrf = "{{csrf_token()}}";
            $("#loading").show();

            $.ajax({
                type:'post',
                url: "{{route('bid-user.list')}}",
                data:{
                    _token:csrf,
                    id:id,
                },
                success:function (data) {
                    $("#list_bidder").empty().html(data.table_data);
                    $("#exampleModalLabel").empty().html(data.model_title);
                    $("#loading").hide();
                }
            });
        });
    });
</script>

@yield('js')

</body>

</html>
