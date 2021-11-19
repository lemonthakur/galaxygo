@php
    \App\CustomClass\OwnLibrary::claimCoin();
@endphp

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
                                @if(Auth::check() && Auth::user()->role_id == 0 && !empty(auth()->user()->cover_photo))
                                    <img id="cover_photo" src="{{asset(auth()->user()->cover_photo)}}" class="img-fluid"
                                         alt="cover">
                                @else
                                    <img src="{{asset('frontend/images/profile-cover.png')}}" class="img-fluid"
                                         alt="cover">
                                @endif
                            </div>
                            <div class="user-profile">
                                @if(Auth::check() && Auth::user()->role_id == 0 && !empty(auth()->user()->photo))
                                    <img src="{{asset(auth()->user()->photo)}}" alt="user">
                                @else
                                    <img id="profile_pic" src="{{asset('demo-pic/download.png')}}" alt="user">
                                @endif
                            </div>
                        </div>
                        @php
                            use App\CustomClass\OwnLibrary;
                            if(Auth::check() && Auth::user()->role_id == 0){
                            $total_coins = auth()->user()->total_coin ?? 00;
                            $current_coins = auth()->user()->current_coin ?? 00;
                            }else{
                            $user = OwnLibrary::getUserInfo();
                            $guestUser = \App\Models\GuestUser::where('id','=',$user['id'])->first();
                            $total_coins = $guestUser->total_coin ?? 00;
                            $current_coins = $guestUser->current_coin ?? 00;
                            }
                        @endphp
                        <div class="ic-win-btn">
                            <a href="javascript:void(0)">{{$entryWon ?? 00}} <span>Entries Won</span></a>
                            <a href="javascript:void(0)">{{(int) $total_coins}} <span>Coins Won</span></a>
                        </div>
                        <div class="ic-total-balance">
                            <p>Total Coins Balance</p>
                            <h4>{{(int) $current_coins}}</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7">
                    <div class="ic-entries-right">
                        <ul class="nav nav-tabs mb-3" id="myTab" role="tablist">
                            <!-- <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#openEntries">Open Entries</a>
                            </li>
                            <li class="nav-item second-nav-item">
                                <a class="nav-link" data-toggle="tab" href="#pendingEntries">Pending Entries</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#finalEntries">Final Entries</a>
                            </li> -->

                            <li class="nav-item">
                                <a class="nav-link  @if($alise==null){{'active'}}@endif" data-toggle="" href="{{ route('entries') }}">Open Entries</a>
                            </li>
                            <li class="nav-item second-nav-item">
                                <a class="nav-link @if($alise=='pending'){{'active'}}@endif" data-toggle="" href="{{ route('entries', 'pending') }}">Pending Entries</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link @if($alise=='final'){{'active'}}@endif" data-toggle="" href="{{ route('entries', 'final') }}">Final Entries</a>
                            </li>
                        </ul>
                        <div class="tab-content" id="myTabContent">
                            {{-- Open Enries--}}
                            <div class="tab-pane fade @if($alise==null){{'show active'}}@endif" id="openEntries">
                                <span class="d-none" id="contestCount">{{count($contests)}}</span>
                                @if(!empty($contests) && count($contests)>0)
                                    @foreach($contests as $contest)
                                        <div class="ic-entries-tab-contents open-entries mb-3">
                                            @if($now > strtotime($contest->time_start) && strtotime($contest->time_end) > $now)
                                                <form method="post" action="{{route('entries.store')}}">
                                                    @csrf
                                                    <input type="hidden" name="contest_id"
                                                           value="{{encrypt($contest->id)}}">
                                                    <div class="ic-pending-entries-title">
                                                        <h5>{{$contest->name ? date('M d',strtotime($contest->name)) : ''}}</h5>
                                                        <div class="ic-timer" id="ic-timer{{$loop->iteration}}">
                                                    <span class="d-none timer-time"
                                                          id="timer-time">{{date('d-M-Y h:i:s A',strtotime($contest->time_end)) ?? date('Y-m-d 0:00')}}</span>
                                                            <div class="hours">
                                                                <h4 id="day" class="d text-center">00</h4>
                                                                <p>Days</p>
                                                            </div>
                                                            <div class="hours">
                                                                <h4 id="hour" class="h">00</h4>
                                                                <p>hours</p>
                                                            </div>
                                                            <div class="minute mr-3">
                                                                <h4 id="minute" class="m">00</h4>
                                                                <p>Minutes</p>
                                                            </div>
                                                            <div class="seconds">
                                                                <h4 id="second" class="s">00</h4>
                                                                <p>seconds</p>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <span class="d-none"
                                                          id="contestPlayerCount{{$loop->iteration}}">{{count($contest->contestPlayers)}}</span>
                                                    @forelse($contest->contestPlayers as $key => $contestPlayer)
                                                    <!--Item-->
                                                        <div class="ic-item">
                                                            <div class="user">
                                                                <div class="image">
                                                                    @if(!empty($contestPlayer->player->image))
                                                                        <img
                                                                            src="{{asset($contestPlayer->player->image)}}"
                                                                            alt="user">
                                                                    @else
                                                                        <img src="{{asset('demo-pic/download.png')}}"
                                                                             alt="user">
                                                                    @endif
                                                                </div>
                                                                <div class="name-title pt-3">
                                                                    <p class="mb-2 font-weight-bold player-name">
                                                                        {{ucwords($contestPlayer->player->name ?? '')}}</p>
                                                                    <span class="d-none"
                                                                          id="play-time{{$loop->parent->iteration}}{{$loop->iteration}}">
                                                    {{date('d-M-Y h:i:s A',strtotime($contestPlayer->played_on))}}
                                                </span>
                                                                    <small class="text-white text-capitalize  mb-2"
                                                                           id="player-countdown{{$loop->parent->iteration}}{{$loop->iteration}}">
                                                                        {{--                                                    {{date('M d, h:i A',strtotime($contestPlayer->played_on))}}--}}
                                                                    </small>
                                                                    <br/>
                                                                    <small
                                                                        class="text-white text-capitalize  mb-2">{{strtoupper($contestPlayer->versus)}}</small><br/>
                                                                    <p class="score text-capitalize">
                                                                        {{$contest->contest_type ?? "proj fantasy score"}}
                                                                        :
                                                                        <span>{{$contestPlayer->score}}</span></p><br/>
                                                                </div>
                                                                <div class="mobile-name-title name-title">
                                                                    <p class="mb-2 font-weight-bold player-name">
                                                                        {{ucwords($contestPlayer->player->name ?? '')}}</p>
                                                                    <small
                                                                        class="text-white text-capitalize m-vs">{{strtoupper($contestPlayer->versus)}}</small><br/>
                                                                    <small class="text-white text-capitalize m-date"
                                                                           id="m-player-countdown{{$loop->parent->iteration}}{{$loop->iteration}}">
                                                                        {{--                                                    {{date('M d, h:i A',strtotime($contestPlayer->played_on))}}--}}
                                                                    </small><br/>
                                                                    <p class="score text-white d-block text-capitalize">
                                                                        {{$contest->contest_type ?? "proj fantasy score"}}
                                                                        :
                                                                        <span>{{$contestPlayer->score}}</span></p><br/>
                                                                </div>
                                                            </div>

                                                            <div class="over-under-btn"
                                                                 id="over-under-btn{{$loop->parent->iteration}}{{$loop->iteration}}">
                                                                {{--Over--}}
                                                                <input class="d-none" type="radio"
                                                                       id="over_{{$contestPlayer->id}}_2"
                                                                       value="2" name="players[{{$contestPlayer->id}}]" {{(!empty($contestPlayer->participant->participant_answer)
                                                                    && $contestPlayer->participant->participant_answer == 2)
                                                                        ? 'checked' : ''}}>
                                                                <label id="over_lavel_{{$contestPlayer->id}}"
                                                                       pid="{{$contestPlayer->id}}"
                                                                       ltype="2" for="over_{{$contestPlayer->id}}_2"
                                                                       class="over-btn mb-1 rlabel  {{(!empty($contestPlayer->participant->participant_answer)
                                                                && $contestPlayer->participant->participant_answer == 2)
                                                                    ? 'active' : ''}}">over</label>
                                                                {{--Over--}}

                                                                {{--Under--}}
                                                                <input class="d-none" type="radio"
                                                                       id="under_{{$contestPlayer->id}}_1"
                                                                       value="1" name="players[{{$contestPlayer->id}}]" {{(!empty($contestPlayer->participant->participant_answer)
                                                                   && $contestPlayer->participant->participant_answer == 1)
                                                                       ? 'checked' : ''}}>
                                                                <label id="under_lavel_{{$contestPlayer->id}}"
                                                                       pid="{{$contestPlayer->id}}"
                                                                       ltype="1" for="under_{{$contestPlayer->id}}_1"
                                                                       class="under-btn rlabel
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
                                                        @if($contest->is_paid == 2 && auth()->check() && auth()->user()->current_coin < $contest->amount)
                                                            <button type="submit" disabled class="btn-submit text-danger" style="line-height: 20px; font-size: 13px;">Paid contest, you don't have {{ $contest->amount }} coin to play.</button>
                                                            <!-- <p class="text-center w-75 m-auto text-danger py-2">This is a paid contest and you doesn't have enough coin to play.</p> -->
                                                        @else
                                                            <button type="submit" class="btn-submit">Submit</button>
                                                            @if($contest->is_paid == 2)
                                                            <p class="text-center w-75 m-auto text-danger py-1" style="font-size: 12px;">Paid contest, need {{ $contest->amount }} coin to play.</p>
                                                            @endif
                                                        @endif
                                                    </div>
                                                </form>
                                            @else
                                                <h4 class="text-center text-white">The contest hasn't started yet.</h4>
                                            @endif
                                        </div>
                                    @endforeach
                                @else
                                    <h3 class="text-center text-white">No contest found</h3>
                                @endif
                            </div>
                            {{--Open Enries--}}

                            {{--Pending Entries--}}
                            <div class="tab-pane fade @if($alise=='pending'){{'show active'}}@endif" id="pendingEntries">
                                @if(!empty($pendingContest) && count($pendingContest)>0)
                                    @foreach($pendingContest as $contest)
                                        <div class="ic-entries-tab-contents pending-entries mb-4">
                                            <div class="ic-pending-entries-title">
                                                <h5>{{$contest->name ? date('M d',strtotime($contest->name)) : ''}}</h5>
                                            </div>
                                        @forelse($contest->contestPlayers as $key => $contestPlayer)
                                            <!--Item-->
                                                {{--                                            <div class="ic-item {{$loop->iteration % 2 == 0 ? 'item-bg-mobile' : 'item-bg'}}">--}}
                                                <div class="ic-item">
                                                    <div class="user">
                                                        <div class="image">
                                                            <img src="{{asset($contestPlayer->player->image)}}"
                                                                 alt="user">
                                                        </div>
                                                        <div class="name-title pt-3">
                                                            <p class="mb-2 font-weight-bold player-name">
                                                                {{ucwords($contestPlayer->player->name)}}</p>
                                                            <small
                                                                class="text-white text-capitalize  mb-2">{{date('M d, h:i A',strtotime($contestPlayer->played_on))}}</small><br/>
                                                            <small
                                                                class="text-white text-capitalize  mb-2">{{strtoupper($contestPlayer->versus)}}</small><br/>
                                                            <p class="score text-capitalize">
                                                                {{$contest->contest_type ?? "proj fantasy score"}}:
                                                                <span>{{$contestPlayer->score}}</span></p><br/>
                                                        </div>
                                                        <div class="mobile-name-title name-title">
                                                            <p class="mb-2 font-weight-bold player-name">
                                                                {{ucwords($contestPlayer->player->name)}}</p>
                                                            <small
                                                                class="text-white text-capitalize m-vs">{{strtoupper($contestPlayer->versus)}}</small><br/>
                                                            <small
                                                                class="text-white text-capitalize m-date">{{date('M d, h:i A',strtotime($contestPlayer->played_on))}}</small><br/>
                                                            <p class="score text-white d-block text-capitalize">
                                                                {{$contest->contest_type ?? "proj fantasy score"}}:
                                                                <span>{{$contestPlayer->score}}</span></p><br/>
                                                        </div>
                                                    </div>
                                                    <div class="over-under-btn">
                                                        @if(!empty($contestPlayer->participant->participant_answer)
                                                        && $contestPlayer->participant->participant_answer == 2)
                                                            {{--Over--}}
                                                            <label class="over-btn mb-1 rlabel  {{(!empty($contestPlayer->participant->participant_answer)
                                                        && $contestPlayer->participant->participant_answer == 2)
                                                            ? 'active' : ''}}">over</label>
                                                            {{--Over--}}
                                                        @endif

                                                        @if(!empty($contestPlayer->participant->participant_answer)
                                                        && $contestPlayer->participant->participant_answer == 1)
                                                            {{--Under--}}
                                                            <label class="under-btn rlabel
                                                        {{(!empty($contestPlayer->participant->participant_answer)
                                                        && $contestPlayer->participant->participant_answer == 1)
                                                            ? 'active' : ''}}">under</label>
                                                            {{--Under--}}
                                                        @endif

                                                        @if(empty($contestPlayer->participant->participant_answer))
                                                            <label class="under-btn not-vote">Did Not Vote</label>
                                                        @endif
                                                    </div>
                                                </div>
                                                <!--Item-->
                                            @empty
                                                <h3 class="text-center">No Players Found</h3>
                                            @endforelse

                                            @if($contest->is_paid == 2)
                                                <p class="text-center w-75 m-auto text-danger py-1" style="font-size: 12px;">Paid contest, {{ $contest->amount }} coin.</p>
                                            @endif
                                        </div>
                                    @endforeach
                                @else
                                    <h3 class="text-center text-white">No Pending Contest</h3>
                                @endif
                            </div>
                            {{--Pending Entries--}}

                            {{--Final entry data--}}
                            <div class="tab-pane fade @if($alise=='final'){{'show active'}}@endif" id="finalEntries">
                                @if(!empty($finalContests) && count($finalContests)>0)
                                    @foreach($finalContests as $contest)
                                        <div class="ic-entries-tab-contents mt-3 final-entries">
                                            <div class="ic-time">
                                                <div class="d-flex justify-content-between">
                                                    <h4>{{$contest->name ? date('d M',strtotime($contest->name)) : ''}}</h4>

                                                    @if(!empty($contest->userPLay) && $contest->userPLay->get_coin == 1)
                                                        <h4>Won {{$contest->userPLay->earn}}</h4>
                                                    @else
                                                        <h4>
                                                            Won {{\App\CustomClass\OwnLibrary::winCoin($contest->id)}}</h4>
                                                    @endif
                                                </div>
                                            </div>
                                        @forelse($contest->contestPlayers as $key => $contestPlayer)
                                            <!--Item 1-->
                                                <div class="ic-item">
                                                    <div class="user">
                                                        <div class="image">
                                                            @if(!empty($contestPlayer->player->image))
                                                                <img src="{{asset($contestPlayer->player->image)}}"
                                                                     alt="user">
                                                            @else
                                                                <img src="{{asset('demo-pic/download.png')}}"
                                                                     alt="user">
                                                            @endif
                                                        </div>
                                                        <div class="name-title pt-3">
                                                            <p class="mb-2 font-weight-bold player-name">
                                                                {{ucwords($contestPlayer->player->name ?? '')}}</p>
                                                            <small
                                                                class="text-white text-capitalize  mb-2">{{date('M d, h:i A',strtotime($contestPlayer->played_on))}}</small><br/>
                                                            <small
                                                                class="text-white text-capitalize  mb-2">{{strtoupper($contestPlayer->versus)}}</small><br/>
                                                            <p class="score text-capitalize">
                                                                {{$contest->contest_type ?? "proj fantasy score"}}:
                                                                <span>{{$contestPlayer->score}}</span></p><br/>
                                                        </div>
                                                        <div class="mobile-name-title name-title">
                                                            <p class="mb-2 font-weight-bold player-name">
                                                                {{ucwords($contestPlayer->player->name ?? '')}}</p>
                                                            <small
                                                                class="text-white text-capitalize m-vs">{{strtoupper($contestPlayer->versus)}}</small><br/>
                                                            <small
                                                                class="text-white text-capitalize m-date">{{date('M d, h:i A',strtotime($contestPlayer->played_on))}}</small><br/>
                                                            <p class="score text-white d-block text-capitalize">
                                                                {{$contest->contest_type ?? "proj fantasy score"}}:
                                                                <span>{{$contestPlayer->score}}</p><br/>
                                                        </div>
                                                    </div>


                                                    <div class="over-projection final-fantacy-score text-center">
                                                        <span>your proj</span>
                                                        @if(!empty($contestPlayer->participant->participant_answer))
                                                            @if($contestPlayer->participant->participant_answer == 2)
                                                                <div class="over-icon text-center">
                                                                    <a style="color: black;background-color: white;" class="d-inline-block" href="javascript:void(0)">over</a>
                                                                </div>
                                                            @else
                                                                <div class="under-icon justify-content-center">
                                                                    <a class="d-inline-block" href="javascript:void(0)">under</a>
                                                                </div>
                                                            @endif
                                                        @else
                                                            <div class="over-icon text-center">
                                                                <label class="under-btn not-vote d-inline-block">Did Not
                                                                    Vote</label>
                                                            </div>
                                                        @endif

                                                        <span class="mt-2 mb-1">Final projection</span>

                                                        @if(!empty($contestPlayer->participant->participant_answer) &&
                                                        $contestPlayer->answer == $contestPlayer->participant->participant_answer)
                                                            <div class="text-center">
                                                                <a style="background-color: #39c539;color: black;" href="javascript:void(0)" class="final-remove check d-inline-block">
                                                                    <i class="flaticon-tick-mark"></i>
                                                                    final
                                                                </a>
                                                            </div>
                                                        @else
                                                            <div class="text-center">
                                                                <a style="background-color: crimson;color: white;" href="javascript:void(0)" class="final-remove d-inline-block">
                                                                    <i class="flaticon-error"></i>
                                                                    final
                                                                </a>
                                                            </div>
                                                        @endif
                                                        <p><span
                                                                class="final-score">{{$contestPlayer->final_score}}</span>
                                                        </p>
                                                    </div>

                                                    <div
                                                        class="over-projection mobile-over-projection final-fantacy-score text-center">
                                                        <span>your proj</span>
                                                        @if(!empty($contestPlayer->participant->participant_answer))
                                                            @if($contestPlayer->participant->participant_answer == 2)
                                                                <div class="over-icon text-center">
                                                                    <a class="d-inline-block" href="javascript:void(0)">over</a>
                                                                </div>
                                                            @else
                                                                <div class="under-icon justify-content-center">
                                                                    <a class="d-inline-block text-dark"
                                                                       href="javascript:void(0)">under</a>
                                                                </div>
                                                            @endif
                                                        @else
                                                            <div class="over-icon text-center">
                                                                <label class="under-btn not-vote d-inline-block">Did Not
                                                                    Vote</label>
                                                            </div>
                                                        @endif

                                                        <span class="my-2"></span>

                                                        @if(!empty($contestPlayer->participant->participant_answer) &&
                                                        $contestPlayer->answer == $contestPlayer->participant->participant_answer)
                                                            <div class="text-center">
                                                                <a href="javascript:void(0)" class="final-remove check d-inline-block">
                                                                    <i class="flaticon-tick-mark"></i>
                                                                    final
                                                                </a>
                                                            </div>
                                                        @else
                                                            <div class="text-center">
                                                                <a href="javascript:void(0)" class="final-remove d-inline-block">
                                                                    <i class="flaticon-error"></i>
                                                                    final
                                                                </a>
                                                            </div>
                                                        @endif
                                                        <p><span
                                                                class="final-score">{{$contestPlayer->final_score}}</span>
                                                        </p>
                                                    </div>
                                                </div>
                                            @empty
                                                <h3 class="text-center">No Players Found</h3>
                                            @endforelse

                                            <div class="ic-item-load-more">
                                                @if(!empty($contest->userPLay) && $contest->userPLay->get_coin == 0)
                                                    <form method="post" action="{{route('entries.claim.coin')}}">
                                                        @csrf
                                                        <input type="hidden" name="id"
                                                               value="{{encrypt($contest->id)}}">
                                                        <button type="submit" class="btn-submit d-none">
                                                            <i class="icofont-coins mr-1"></i>
                                                            Claim Coin
                                                        </button>
                                                    </form>
                                                @endif
                                            </div>

                                            @if($contest->is_paid == 2)
                                                <p class="text-center w-75 m-auto text-danger py-1" style="font-size: 12px;">Paid contest, {{ $contest->amount }} coin.</p>
                                            @endif
                                        </div>
                                    @endforeach
                                @else
                                    <h3 class="text-center text-white">No Final Contest</h3>
                                @endif
                                {{--Final entry data--}}
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

            $(".rlabel").on('click', function () {
                let pid = $(this).attr('pid');
                let ltype = $(this).attr('ltype');
                $(this).addClass('active');

                if (ltype === "1") {
                    $('#over_lavel_' + pid).removeClass('active');
                } else {
                    $('#under_lavel_' + pid).removeClass('active');
                }
            });

            const contestCount = $("#contestCount").text();

            for (let i = 0; i < contestCount; i++) {
                let parent = $('#ic-timer' + (i + 1));
                setInterval(function () {
                    contestTimer(parent.find('.timer-time'),
                        parent.find('.d'),
                        parent.find('.h'),
                        parent.find('.m'),
                        parent.find('.s'), parent);
                }, 1000);
                let contestPlayerCount = $("#contestPlayerCount" + (i + 1)).text();
                for (let j = 0; j < contestPlayerCount; j++) {
                    playerCountDown(
                        $("#play-time" + (i + 1) + (j + 1)).text(),
                        $("#player-countdown" + (i + 1) + (j + 1)),
                        $("#m-player-countdown" + (i + 1) + (j + 1)),
                        $("#over-under-btn" + (i + 1) + (j + 1))
                    )
                }
            }

            // contest timer
            function contestTimer(getTimeSpan, daysDiv, hoursDiv, minutesDiv, secondsDiv, holder) {
                var getTime = getTimeSpan.text() + ' -08:00';

                if (Date.parse(getTime) < Date.parse(new Date())) {
                    getTime = new Date();
                    holder.closest('.open-entries').remove();
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

                daysDiv.text(days);
                hoursDiv.text(hours);
                minutesDiv.text(minutes);
                secondsDiv.text(seconds);
            }

            // $("#player-countdown").text($("#play-time").text());
            function playerCountDown(countDownTime, setElement, setMobileElement, removeBtn) {
                let countDownDate = new Date(countDownTime + " -08:00").getTime();
                // Update the count down every 1 second
                let x = setInterval(function () {
                    // Get todays date and time
                    let now = new Date().getTime();

                    // Find the distance between now an the count down date
                    let distance = countDownDate - now;

                    // Time calculations for days, hours, minutes and seconds
                    let hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    let minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    let seconds = Math.floor((distance % (1000 * 60)) / 1000);

                    if (hours < "10") {
                        hours = "0" + hours;
                    }
                    if (minutes < "10") {
                        minutes = "0" + minutes;
                    }
                    if (seconds < "10") {
                        seconds = "0" + seconds;
                    }

                    const clone = " : "

                    setElement.text("Start " + hours + clone + minutes + clone + seconds);
                    setMobileElement.text("Start " + hours + clone + minutes + clone + seconds);
                    // console.log(setElement.parents(".user").siblings().find(".over-under-btn"));
                    if (distance < 0) {
                        // setElement.parents(".user").siblings().find(".over-under-btn").empty();
                        removeBtn.empty();
                        clearInterval(x);
                        setElement.text("Start 00 : 00 : 00 ");
                        setMobileElement.text("Start 00 : 00 : 00 ");
                    }
                }, 1000);
            }
        });
    </script>
@endsection
