@extends('frontend.layout.master')
@section('title','About Us')

@section('content')
    <section class="ic-about-area">
        <div class="container">
            <div class="row">
                @if($about)
                        <div class="col-md-6">
                            <div class="ic-about-left">
                                <img src="{{asset($about->image)}}" class="img-fluid" alt="about">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="ic-about-right">
                                <h2>{{ucwords($about->title)}}</h2>
                                <div>
                                    {!! $about->description !!}
                                </div>
                                <a href="{{$about->button_url}}" class="ic-btn ">{{ucwords($about->button_text)}}</a>
                            </div>
                        </div>
                        @if($about->video_url)
                        <div class="col-12">
                            <div class="ic-about-video">
                                <div class="video-banner">
                                    <img src="{{asset($about->video_banner)}}" class="img-fluid" alt="about video">
                                    <a class="ic-about-video-popup" data-autoplay="true" data-vbtype="video" href="{{$about->video_url}}">
                                        <img src="{{asset('/frontend/images/play-icon.png')}}" class="img-fluid play-icon" alt="play"></a>
                                </div>
                            </div>
                        </div>
                    @endif
                @else
                    <div class="col-12">
                        <img src="{{ asset('upload/coming-soon.jpg') }}" class="img-fluid" alt="About us" width="100%">
                    </div>
                @endif
            </div>
        </div>
    </section>
@endsection
