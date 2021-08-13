@extends('frontend.layout.master')
@section('title','Privacy Policy')

@section('content')
    <section class="ic-contact-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4">
                    <div class="ic-contact-left">
                        <h2>Contact Us</h2>
                        <div class="ic-address">
                            <h6>Address</h6>
                            <p>{{$siteSetting->address ??''}}</p>
                        </div>
                        <div class="ic-phone">
                            <h6>Phone</h6>
                            <a href="tel:{{$siteSetting->contact_no ??''}}">{{$siteSetting->contact_no ??''}}</a>
                        </div>
                        <div class="ic-email">
                            <h6>email</h6>
                            <a href="mailto:galaxy.go@gmail.com">{{$siteSetting->email ??''}}</a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-7 col-md-8 offset-lg-1">
                    <div class="ic-contact-right">
                        <h2>Contact Us</h2>
                        <form action="{{route('contact.message')}}" method="post">
                            @csrf
                            <div class="row">

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">First Name</label>
                                        <input type="text" class="form-control" placeholder="Mr." name="first_name"  value="{{old('first_name')}}" />
                                        <span class="text-danger">{{$errors->has("first_name") ? $errors->first("first_name") : ""}}</span>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="">Last Name</label>
                                        <input type="text" class="form-control" placeholder="Jaxson" name="last_name" value="{{old('last_name')}}" />
                                        <span class="text-danger">{{$errors->has("last_name") ? $errors->first("last_name") : ""}}</span>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="email">email</label>
                                        <input type="email" id="email" class="form-control" placeholder="mrjaxson@gmail.com" name="email"  value="{{old('email')}}" />
                                        <span class="text-danger">{{$errors->has("email") ? $errors->first("email") : ""}}</span>
                                    </div>
                                </div>

                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="message">Message</label>
                                        <textarea id="message" class="form-control" placeholder="Write Message here" name="message">{{old('message')}}</textarea>
                                        <span class="text-danger">{{$errors->has("message") ? $errors->first("message") : ""}}</span>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <button type="submit" class="ic-btn ic-btn-golden2">Send Messasge</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-12">
                    <div class="ic-contact-map">
                        @if($siteSetting->google_map)
                        {!! $siteSetting->google_map !!}
                        @endif
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
