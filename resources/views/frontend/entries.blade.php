@extends('frontend.layout.master')
@section('title','Home')

@section('content')

    <section class="ic-entries-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="ic-profile-left">
                        <div class="ic-user">
                            <div class="ic-cover-bg">
                                <img src="{{asset('frontend/images/profile-cover.png')}}" class="img-fluid" alt="cover">
                            </div>
                            <div class="user-profile">
                                @guest()
                                    <img src="{{asset('frontend/images/user.png')}}" alt="user">
                                @endguest

                                @auth()
                                    @if(auth()->user()->photo)
                                        <img src="{{auth()->user()->photo}}" alt="user">
                                    @else
                                        <img src="{{asset('frontend/images/user.png')}}" alt="user">
                                    @endif
                                @endauth
                            </div>
                        </div>
                        <div class="ic-win-btn">
                            <a href="#">00 <span>Entries Won</span></a>
                            <a href="#">00 <span>Coins Won</span></a>
                        </div>
                        <div class="ic-total-balance">
                            <p>Total Coins Balance</p>
                            <h4>00</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7">
                    <div class="ic-entries-right">
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#openEntries">Open Entries</a>
                            </li>
                            <li class="nav-item second-nav-item">
                                <a class="nav-link" data-toggle="tab" href="#pendingEntries">Pending Entries</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#finalEntries">Final Entries</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            {{-- Open Enries--}}
                            <div class="tab-pane fade show active" id="openEntries">
                                <div class="ic-entries-tab-contents open-entries">
                                    @if(!empty($contest) && strtotime($contest->expaire_time) >= $now)
                                        <form method="post" action="{{route('entries.store')}}">
                                            @csrf
                                            <input type="hidden" name="contest_id" value="{{encrypt($contest->id)}}">
                                            <div class="ic-pending-entries-title">
                                                <h5>Played On
                                                    : {{$contest->name ? date('d M',strtotime($contest->name)) : ''}}</h5>
                                                <div class="ic-timer">
                                                    <span class="d-none"
                                                          id="timer-time">{{$contest->expaire_time ?? date('Y-m-d 0:00')}}</span>
                                                    {{--                                        <div class="days">--}}
                                                    {{--                                            <h4 id="day">0</h4>--}}
                                                    {{--                                            <p>days</p>--}}
                                                    {{--                                        </div>--}}
                                                    <div class="hours">
                                                        <h4 id="hour">00</h4>
                                                        <p>hours</p>
                                                    </div>
                                                    <div class="minute mr-3">
                                                        <h4 id="minute">00</h4>
                                                        <p>Minutes</p>
                                                    </div>
                                                    <div class="seconds">
                                                        <h4 id="second">00</h4>
                                                        <p>seconds</p>
                                                    </div>
                                                </div>
                                            </div>

                                            @forelse($contest->contestPlayers as $key => $contestPlayer)
                                            <!--Item-->
                                                <div
                                                    class="ic-item {{$loop->iteration % 2 == 0 ? 'item-bg-mobile' : 'item-bg'}}">
                                                    <div class="user">
                                                        <div class="image">
                                                            <img src="{{asset($contestPlayer->player_image)}}"
                                                                 alt="user">
                                                        </div>
                                                        <div class="name-title">
                                                            <p>{{ucwords($contestPlayer->player_name)}}</p>
                                                            <span>{{strtoupper($contestPlayer->location)}}</span>
                                                        </div>
                                                        <div class="mobile-name-title name-title">
                                                            <p>{{ucwords($contestPlayer->player_name)}}</p>
                                                            <span>{{strtoupper($contestPlayer->location)}}</span>
                                                            <p class="m-date">{{date('D, M y, h:i A',strtotime($contestPlayer->played_on))}}</p>
                                                            <p class="m-vs">
                                                                VS {{strtoupper($contestPlayer->versus)}}</p>
                                                            <p>
                                                                <span>project fantasy score</span> {{$contestPlayer->score}}
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="date">
                                                        <span>{{date('D, M y, h:i A',strtotime($contestPlayer->played_on))}}</span>
                                                        <p>VS {{strtoupper($contestPlayer->versus)}}</p>
                                                    </div>
                                                    <div class="score">
                                                        <p>{{$contestPlayer->score}}</p>
                                                        <span>projets score</span>
                                                    </div>
                                                    <div class="over-under-btn">
                                                        {{--Over--}}
                                                        <input class="d-none" type="radio"
                                                               id="over_{{$contestPlayer->id}}_2" value="2"
                                                               name="players[{{$contestPlayer->id}}]"
                                                        {{(!empty($contestPlayer->participant->participant_answer)
                                                        && $contestPlayer->participant->participant_answer == 2)
                                                            ? 'checked' : ''}}>
                                                        <label id="over_lavel_{{$contestPlayer->id}}"
                                                               pid="{{$contestPlayer->id}}" ltype="2"
                                                               for="over_{{$contestPlayer->id}}_2"
                                                               class="over-btn mb-1 rlabel  {{(!empty($contestPlayer->participant->participant_answer)
                                                        && $contestPlayer->participant->participant_answer == 2)
                                                            ? 'active' : ''}}">over</label>
                                                        {{--Over--}}

                                                        {{--Under--}}
                                                        <input class="d-none" type="radio"
                                                               id="under_{{$contestPlayer->id}}_1" value="1"
                                                               name="players[{{$contestPlayer->id}}]"
                                                            {{(!empty($contestPlayer->participant->participant_answer)
                                                           && $contestPlayer->participant->participant_answer == 1)
                                                               ? 'checked' : ''}}>
                                                        <label id="under_lavel_{{$contestPlayer->id}}"
                                                               pid="{{$contestPlayer->id}}" ltype="1"
                                                               for="under_{{$contestPlayer->id}}_1" class="under-btn rlabel
                                                        {{(!empty($contestPlayer->participant->participant_answer)
                                                        && $contestPlayer->participant->participant_answer == 1)
                                                            ? 'active' : ''}}">under</label>
                                                        {{--Under--}}
                                                    </div>
                                                </div>
                                                <!--Item-->
                                            @empty
                                                <h3 class="text-center">No Players Found</h3>
                                        @endforelse

                                        <!--Item End-->
                                            <div class="ic-item-load-more">
                                                {{--<a href="#"><i class="flaticon-loading"></i> load more</a>--}}
                                                <button type="submit" class="btn-submit">Submit</button>
                                            </div>
                                        </form>
                                    @else
                                        <h3 class="text-center text-white">Today's contest end</h3>
                                    @endif
                                </div>
                            </div>
                            {{--Open Enries--}}

                            {{--Pending Entries--}}
                            <div class="tab-pane fade" id="pendingEntries">
                                <div class="ic-entries-tab-contents pending-entries">
                                    <div class="ic-pending-entries-title">
                                        <h5>pending entries</h5>
                                    </div>
                                @if(!empty($contest) && strtotime($contest->expaire_time) <= $now && $contest->is_final_answer == 0)
                                    @forelse($contest->contestPlayers as $key => $contestPlayer)
                                        <!--Item-->
                                            <div
                                                class="ic-item {{$loop->iteration % 2 == 0 ? 'item-bg-mobile' : 'item-bg'}}">
                                                <div class="user">
                                                    <div class="image">
                                                        <img src="{{asset($contestPlayer->player_image)}}"
                                                             alt="user">
                                                    </div>
                                                    <div class="name-title">
                                                        <p>{{ucwords($contestPlayer->player_name)}}</p>
                                                        <span>{{strtoupper($contestPlayer->location)}}</span>
                                                    </div>
                                                    <div class="mobile-name-title name-title">
                                                        <p>{{ucwords($contestPlayer->player_name)}}</p>
                                                        <span>{{strtoupper($contestPlayer->location)}}</span>
                                                        <p class="m-date">{{date('D, M y, h:i A',strtotime($contestPlayer->played_on))}}</p>
                                                        <p class="m-vs">
                                                            VS {{strtoupper($contestPlayer->versus)}}</p>
                                                        <p>
                                                            <span>project fantasy score</span> {{$contestPlayer->score}}
                                                        </p>
                                                    </div>
                                                </div>
                                                <div class="date">
                                                    <span>{{date('D, M y, h:i A',strtotime($contestPlayer->played_on))}}</span>
                                                    <p>VS {{strtoupper($contestPlayer->versus)}}</p>
                                                </div>
                                                <div class="score">
                                                    <p>{{$contestPlayer->score}}</p>
                                                    <span>projets score</span>
                                                </div>
                                                <div class="over-under-btn">
                                                    {{--Over--}}
                                                    <input class="d-none" type="radio"
                                                           id="over_{{$contestPlayer->id}}_2" value="2"
                                                           name="players[{{$contestPlayer->id}}]"
                                                        {{(!empty($contestPlayer->participant->participant_answer)
                                                        && $contestPlayer->participant->participant_answer == 2)
                                                            ? 'checked' : ''}}>
                                                    <label id="over_lavel_{{$contestPlayer->id}}"
                                                           pid="{{$contestPlayer->id}}" ltype="2"
                                                           for="over_{{$contestPlayer->id}}_2"
                                                           class="over-btn mb-1 rlabel  {{(!empty($contestPlayer->participant->participant_answer)
                                                        && $contestPlayer->participant->participant_answer == 2)
                                                            ? 'active' : ''}}">over</label>
                                                    {{--Over--}}

                                                    {{--Under--}}
                                                    <input class="d-none" type="radio"
                                                           id="under_{{$contestPlayer->id}}_1" value="1"
                                                           name="players[{{$contestPlayer->id}}]"
                                                        {{(!empty($contestPlayer->participant->participant_answer)
                                                       && $contestPlayer->participant->participant_answer == 1)
                                                           ? 'checked' : ''}}>
                                                    <label id="under_lavel_{{$contestPlayer->id}}"
                                                           pid="{{$contestPlayer->id}}" ltype="1"
                                                           for="under_{{$contestPlayer->id}}_1" class="under-btn rlabel
                                                        {{(!empty($contestPlayer->participant->participant_answer)
                                                        && $contestPlayer->participant->participant_answer == 1)
                                                            ? 'active' : ''}}">under</label>
                                                    {{--Under--}}
                                                </div>
                                            </div>
                                            <!--Item-->
                                        @empty
                                            <h3 class="text-center">No Players Found</h3>
                                        @endforelse
                                    @else
                                        <h3 class="text-center text-white">No Pending Contest</h3>
                                    @endif
                                </div>
                            </div>
                            {{--Pending Entries--}}

                            <div class="tab-pane fade" id="finalEntries">
                                <div class="ic-entries-tab-contents final-entries">
                                @if(!empty($contest) && strtotime($contest->expaire_time) <= $now && $contest->is_final_answer == 1)
                                        <div class="ic-time">
                                            <h4>Today's final entries</h4>
                                        </div>
                                    @forelse($contest->contestPlayers as $key => $contestPlayer)
                                    <!--Item 1-->
                                    <div class="ic-item  {{$loop->iteration % 2 == 0 ? 'item-bg-mobile' : 'item-bg'}}">
                                        <div class="user">
                                            <div class="image">
                                                <img src="{{asset($contestPlayer->player_image)}}" alt="user">
                                            </div>
                                            <div class="name-title">
                                                <p>{{ucwords($contestPlayer->player_name)}}</p>
                                                <span>{{strtoupper($contestPlayer->location)}}</span>
                                            </div>
                                            <div class="mobile-name-title name-title">
                                                <p>{{ucwords($contestPlayer->player_name)}}</p>
                                                <span>{{strtoupper($contestPlayer->location)}}</span>
                                                <p class="final-our-score">fantasy score</p>
                                                <p class="final-score-point">{{$contestPlayer->score}}</p>
                                            </div>
                                        </div>
                                        <div class="over-projection">
                                            @if(!empty($contestPlayer->participant->participant_answer))
                                                @if($contestPlayer->participant->participant_answer == 2)
                                                    <div class="over-icon">
                                                        <a href="#">over</a>
                                                    </div>
                                                @else
                                                    <div class="under-icon">
                                                        <a href="#">under</a>
                                                    </div>
                                                @endif
                                            @else
                                                <div class="over-icon">
                                                    <a href="#">No Answer</a>
                                                </div>
                                            @endif
                                            <span>your projection</span>
                                        </div>

                                        <div class="over-projection mobile-over-projection">
                                            @if(!empty($contestPlayer->participant->participant_answer))
                                                @if($contestPlayer->participant->participant_answer == 2)
                                                    <a href="#">over</a>
                                                @else
                                                    <a href="#">under</a>
                                                @endif
                                            @else
                                                <a href="#">under</a>
                                            @endif
                                            <p>{{$contestPlayer->score}}<span>fantasy score</span></p>
                                        </div>

                                        <div class="score">
                                            <p>{{$contestPlayer->score}}</p>
                                            <span>fantasy score</span>
                                        </div>
                                        <div class="final-fantacy-score">
                                            @if(!empty($contestPlayer->participant->participant_answer) &&
                                              $contestPlayer->answer == $contestPlayer->participant->participant_answer)
                                            <a href="#" class="final-remove check">
                                                <i class="flaticon-tick-mark"></i>
                                                final
                                            </a>
                                            @else
                                            <a href="#" class="final-remove">
                                                <i class="flaticon-error"></i>
                                                final
                                            </a>
                                            @endif
                                            <p>{{$contestPlayer->score}} <span>fantasy score</span></p>
                                        </div>
                                    </div>
                                        @empty
                                            <h3 class="text-center">No Players Found</h3>
                                        @endforelse

                                        <div class="ic-item-load-more">
                                            @auth()
                                                @if(!empty($contest->userPLay) && $contest->userPLay->get_coin == 0)
                                                <form method="post" action="{{route('entries.claim.coin')}}">
                                                    @csrf
                                                    <input type="hidden" name="id" value="{{encrypt($contest->id)}}">
                                                    <button type="submit" class="btn-submit">
                                                        <i class="icofont-coins mr-1"></i>
                                                        Claim Coin
                                                    </button>
                                                </form>
                                                @endif
                                            @endauth
                                        </div>

                                    @else
                                        <h3 class="text-center text-white">Today's answer not submitted yet.</h3>
                                    @endif
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('js')
    <script>
        $(document).ready(function () {
            $(document).ready(function (){
                $(".rlabel").on('click',function (){
                    let pid = $(this).attr('pid');
                    let ltype = $(this).attr('ltype');
                    $(this).addClass('active');

                    if (ltype === "1"){
                        console.log(pid,ltype);
                        console.log('#over_lavel_'+pid)
                        $('#over_lavel_'+pid).removeClass('active');
                    }else{
                        console.log(pid,ltype);
                        console.log('#under_lavel_'+pid)
                        $('#under_lavel_'+pid).removeClass('active');
                    }
                });
            });

            // Count down timer
            var getTime = $('#timer-time').text();

            function makeTimer() {
                if (Date.parse(getTime) < Date.parse(new Date())) {
                    getTime = new Date();
                    $('.open-entries').empty();
                    $('.open-entries').html('<h3 class="text-center text-white">Today\'s contest end</h3>');
                }

                var endTime = new Date(getTime);
                endTime = (Date.parse(endTime) / 1000);

                var now = new Date();
                now = (Date.parse(now) / 1000);

                var timeLeft = endTime - now;

                var days = Math.floor(timeLeft / 86400);
                var hours = Math.floor((timeLeft - (days * 86400)) / 3600);
                var minutes = Math.floor((timeLeft - (days * 86400) - (hours * 3600)) / 60);
                var seconds = Math.floor((timeLeft - (days * 86400) - (hours * 3600) - (minutes * 60)));

                if (hours < "10") {
                    hours = "0" + hours;
                }
                if (minutes < "10") {
                    minutes = "0" + minutes;
                }
                if (seconds < "10") {
                    seconds = "0" + seconds;
                }

                // $("#day").text(days);
                $("#hour").text(hours);
                $("#minute").text(minutes);
                $("#second").text(seconds);
            }

            setInterval(function () {
                makeTimer();
            }, 1000);
            // makeTimer();
        });
    </script>
@endsection
