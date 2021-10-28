<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Contact - {{ucwords($setting->site_title)}}</title>
</head>
<body style="background-color: #fff;">
<div style="text-align: center;margin-bottom: 20px;margin-top: 50px">
    <img style="width: 200px" src="{{asset($setting->logo)}}"/>
</div>
<div style="margin-bottom: 30px;"></div>
<p><strong>First Name:</strong> {{$request->first_name}}</p>
<p><strong>Last Name:</strong> {{$request->last_name}}</p>
<p><strong>Email:</strong> {{$request->email}}</p>

<h3 style="text-align: center">Message</h3>
<div>{{$request->message}}</div>

<div style="margin-top:100px;margin-bottom: 50px;color: #fff;text-align: center;">
    © 2021 <a style="color: #C39A35;text-decoration: none;" href="{{route('home')}}">{{ucwords($setting->site_title)}} Go</a>. All Right Reserved
</div>

</body>
</html>
