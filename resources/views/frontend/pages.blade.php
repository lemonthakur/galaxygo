@extends('frontend.layout.master')
@section('title','Privacy Policy')

@section('content')
    <section class="ic-privacy-policy-area">
        <div class="container">
            <div class="ic-privacy-policy-tab">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" data-toggle="tab" href="#privacyPolicy" role="tab">privacy policy</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#termsCondition" role="tab">terms & conditions</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" data-toggle="tab" href="#rules" role="tab">Rules</a>
                    </li>

                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="privacyPolicy">
                        <div class="ic-privacy-policy-tab-content">
                            <h2>Privacy Policy</h2>
                            <div>
                                {!! $otherPage->privacy_policy !!}
                            </div>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="termsCondition">
                        <div class="ic-privacy-policy-tab-content">
                            <h2>terms & conditions</h2>
                            {!! $otherPage->terms_condition !!}
                        </div>
                    </div>

                    <div class="tab-pane fade" id="rules">
                        <div class="ic-privacy-policy-tab-content">
                            <h2>Rules</h2>
                            {!! $otherPage->rules !!}
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
@endsection
