<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reset Password - {{ucwords($setting->site_title)}}</title>
</head>
<body style="background-color: #000;">
<div style="text-align: center;margin-bottom: 20px;margin-top: 50px">
    <img style="width: 200px" src="{{asset($setting->logo)}}"/>
</div>
<h3 style="text-align: center;color: #C39A35;">Reset Password</h3>

<p style="text-align: center;margin-top:50px;color: #fff;">You can reset password from bellow link</p>

<div style="text-align: center;margin-top:50px;">
    <a
        style="text-align: center;padding: 20px 10px;font-size: 20px;color:#C39A35;
        background-color: #212529;text-decoration: none;"
        href="{{ route('reset.password.get', $token) }}">Reset Password</a>
</div>

<div style="margin-top:100px;margin-bottom: 50px;color: #fff;text-align: center;">
    © 2021 <a style="color: #C39A35;text-decoration: none;" href="{{route('home')}}">{{ucwords($setting->site_title)}} Go</a>. All Right Reserved
</div>

</body>
</html>
