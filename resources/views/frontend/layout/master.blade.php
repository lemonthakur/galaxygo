<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="HTML5,CSS3,SASS,Bootstrap,JavaScript,Jquery">
    <meta name="author" content="ITCLAN BD" />
    <title>@yield('title') - Galaxy</title>
    <!-- Favicon -->
    <!--    <link rel="icon" href="assets/images/icon/favicon.png" type="image/x-icon">-->
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
    <!-- sweetalert2 css--->
    <link rel="stylesheet" href="{{asset("/admin-lte/plugins/sweetalert2/sweetalert2.min.css")}}">

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
    <script src="{{asset("/admin-lte/plugins/sweetalert2/sweetalert2.min.js")}}"></script>
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

@include('backend.include.errormsg')

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
<!--Main Js-->
<script src="{{asset('frontend/js/main.js')}}"></script>
<!--Custom Js-->
<script src="{{asset('frontend/js/custom.js')}}"></script>
<!--Wow Js-->
<script src="{{asset('frontend/js/wow.js')}}"></script>
<!--Main CSS-->
<link rel="stylesheet" href="{{asset('frontend/css/style.css')}}">
<!--Custom CSS-->
<link rel="stylesheet" href="{{asset('frontend/css/custom.css')}}">
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
