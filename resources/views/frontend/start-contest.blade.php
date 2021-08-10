@extends('frontend.layout.master')
@section('title','Home')

@section('content')

    <section class="ic-today-tomorrow-area">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="ic-today-tomorrow-card">
                        <div class="ic-heading">
                            <h2>how to <span>Play</span></h2>
                        </div>
                        <div class="content">
                            <p>You can win {{$winCoins[0]['coin'] ?? 00}} coins daily. Start now!!</p>
                            @forelse($winCoins as $winCoin)
                                <p>{{$winCoin->win}} of {{$winCoin->out_of}} win {{$winCoin->coin}} coins</p>
                            @empty
                                <p>Nothing Found</p>
                            @endforelse
                        </div>
                        <div class="ic-game-start-btn">
                            @if (Auth::check() && Auth::user()->role_id == 0)
                            <a href="{{route('entries')}}" class="ic-btn">start the contest</a>
                            @else
                            <a href="{{route('entries')}}" class="ic-btn">Guest try out</a>
                            <a href="{{route('login')}}" class="ic-btn">login</a>
                            <a href="{{route('register')}}" class="ic-btn">register</a>
                            @endif
                        </div>
                    </div>
                    <!-- <div class="ic-guest-btn">
                        <div class="ic-get-share-btn">
                            <a href="#" class="ic-chat-icon">
                                <span class="chat-svg-warper">
                                    <svg id="Layer_1" enable-background="new 0 0 512 512" height="512" viewBox="0 0 512 512" width="512" xmlns="http://www.w3.org/2000/svg">
                                        <g>
                                            <g>
                                                <path d="m512 219.649c0-121.309-98.789-219.649-220.651-219.649-121.863 0-220.652 98.34-220.652 219.649s98.789 219.65 220.652 219.65c25.577 0 50.13-4.347 72.974-12.314l67.316 32.51v-70.301c49.076-40.287 80.361-101.279 80.361-169.545z" fill="#ff9e5e" />
                                                <path d="m291.349 0c-6.949 0-13.819.336-20.604.961 112.2 10.345 200.048 104.297 200.048 218.688 0 112.497-90.212 208.074-200.36 218.661 6.886.645 13.861.988 20.916.988 25.577 0 50.13-4.347 72.974-12.314l67.316 32.51v-70.301c49.076-40.286 80.361-101.278 80.361-169.544 0-121.309-98.789-219.649-220.651-219.649z" fill="#fa8d46" />
                                                <g fill="#fff7e8">
                                                    <circle cx="189.238" cy="224.035" r="31.119" />
                                                    <circle cx="291.348" cy="224.035" r="31.119" />
                                                    <circle cx="393.459" cy="224.035" r="31.119" />
                                                </g>
                                            </g>
                                            <path d="m0 393.758c0-59.804 48.702-108.285 108.779-108.285s108.78 48.481 108.78 108.285c0 59.805-48.702 108.286-108.78 108.286-12.609 0-24.714-2.143-35.976-6.071l-33.185 16.027v-34.658c-24.194-19.861-39.618-49.929-39.618-83.584z" fill="#ffd88f" />
                                            <g>
                                                <path d="m108.779 285.472c-7.045 0-13.931.675-20.603 1.948 50.224 9.587 88.176 53.546 88.176 106.338 0 52.773-37.925 96.72-88.123 106.327 6.657 1.27 13.521 1.959 20.55 1.959 60.077 0 108.78-48.481 108.78-108.286s-48.702-108.286-108.78-108.286z" fill="#ffc963" />
                                            </g>
                                        </g>
                                    </svg>
                                </span>

                                <span class="public-chat-txt">public <br> chat</span>
                            </a>
                            <a href="#" class="ic-faceboob-share-btn">
                                <span class="facebook-svg-warper">
                                    <svg width="36" height="36" viewBox="0 0 36 36" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M18 36C27.9411 36 36 27.9411 36 18C36 8.05888 27.9411 0 18 0C8.05888 0 0 8.05888 0 18C0 27.9411 8.05888 36 18 36Z" fill="#3B5998" />
                                        <path d="M22.5254 18.7046H19.3135V30.4715H14.4472V18.7046H12.1328V14.5693H14.4472V11.8933C14.4472 9.97961 15.3562 6.98303 19.3568 6.98303L22.9614 6.99811V11.0122H20.346C19.917 11.0122 19.3138 11.2265 19.3138 12.1394V14.5731H22.9505L22.5254 18.7046Z" fill="white" />
                                    </svg>
                                </span>

                                <span class="facebook-bonus-txt">Share, Get <br> Instant Bonus!</span>

                            </a>


                        </div>
                    </div> -->
                </div>
            </div>
        </div>
    </section>

@endsection
