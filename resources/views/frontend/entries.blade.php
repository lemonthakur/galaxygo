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
                                    <img id="cover_photo" src="{{asset(auth()->user()->cover_photo)}}" class="img-fluid" alt="cover">
                                @else
                                    <img src="{{asset('frontend/images/profile-cover.png')}}" class="img-fluid" alt="cover">
                                @endif
                            </div>
                            <div class="user-profile">
                                @if(Auth::check() && Auth::user()->role_id == 0 && !empty(auth()->user()->photo))
                                    <img src="{{auth()->user()->photo}}" alt="user">
                                @else
                                    <img id="profile_pic" src="{{asset('demo-pic/download.png')}}" alt="user">
                                @endif
                            </div>
                        </div>
                        @php
                            if(Auth::check() && Auth::user()->role_id == 0){
                               $total_coins = auth()->user()->total_coin ?? 00;
                               $current_coins = auth()->user()->current_coin ?? 00;
                                }else{
                                    $mac = strtok(exec('getmac'), ' ');
                                    $guestUser = \App\Models\GuestUser::where('mac','=',$mac)->first();
                                    $total_coins = $guestUser->total_coin ?? 00;
                                    $current_coins = $guestUser->current_coin ?? 00;
                                }
                        @endphp
                        <div class="ic-win-btn">
                            <a href="#">{{$entryWon ?? 00}} <span>Entries Won</span></a>
                            <a href="#">{{(int) $total_coins}} <span>Coins Won</span></a>
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
                                    @if(!empty($contest))
                                        @if($now >= strtotime($contest->time_start) && strtotime($contest->time_end) >=  $now)
                                        <form method="post" action="{{route('entries.store')}}">
                                            @csrf
                                            <input type="hidden" name="contest_id" value="{{encrypt($contest->id)}}">
                                            <div class="ic-pending-entries-title">
                                                <h5>{{$contest->name ? date('M d',strtotime($contest->name)) : ''}}</h5>
                                                <div class="ic-timer">
                                                    <span class="d-none"
                                                          id="timer-time">{{date('D, d M Y H:i:s',strtotime($contest->time_end)) ?? date('Y-m-d 0:00')}}</span>
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
{{--                                                <div class="ic-item {{$loop->iteration % 2 == 0 ? 'item-bg-mobile' : 'item-bg'}}">--}}
                                                <div class="ic-item">
                                                    <div class="user">
                                                        <div class="image">
                                                            <img src="{{asset($contestPlayer->player->image)}}" alt="user">
                                                        </div>
                                                        <div class="name-title pt-3">
                                                            <p class="mb-2 font-weight-bold player-name">{{ucwords($contestPlayer->player->name)}}</p>
                                                            <small class="text-white text-capitalize  mb-2">{{date('D, M y, h:i A',strtotime($contestPlayer->played_on))}}</small><br />
                                                            <small class="text-white text-capitalize  mb-2">{{strtoupper($contestPlayer->versus)}}</small><br />
                                                            <p class="score text-capitalize">proj fantasy score: <span>{{$contestPlayer->score}}</span></p><br />
                                                        </div>
                                                        <div class="mobile-name-title name-title">
                                                            <p class="mb-2 font-weight-bold player-name">{{ucwords($contestPlayer->player->name)}}</p>
                                                            <small class="text-white text-capitalize m-vs">{{strtoupper($contestPlayer->versus)}}</small><br />
                                                            <small class="text-white text-capitalize m-date">{{date('D, M y, h:i A',strtotime($contestPlayer->played_on))}}</small><br />
                                                            <p class="score text-white d-block text-capitalize">proj fantasy score: <span>{{$contestPlayer->score}}</span></p><br />
                                                        </div>
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
                                        @elseif($now > strtotime($contest->time_end))
                                            <h4 class="text-center text-white">Today's Contest End</h4>
                                        @else
                                            <h4 class="text-center text-white">The contest hasn't started yet.</h4>
                                            @endif
                                    @else
                                        <h3 class="text-center text-white">No contest found</h3>
                                    @endif
                                </div>
                            </div>
                            {{--Open Enries--}}

                            {{--Pending Entries--}}
                            <div class="tab-pane fade" id="pendingEntries">
                                <div class="ic-entries-tab-contents pending-entries">
                                    <div class="ic-pending-entries-title">
                                        <h5>{{$contest->name ? date('M d',strtotime($contest->name)) : ''}}</h5>
                                    </div>
                                @if(!empty($contest) && strtotime($contest->time_end) <= $now && $contest->is_final_answer == 0)
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
                                                        <p class="mb-2 font-weight-bold player-name">{{ucwords($contestPlayer->player->name)}}</p>
                                                        <small class="text-white text-capitalize  mb-2">{{date('D, M y, h:i A',strtotime($contestPlayer->played_on))}}</small><br />
                                                        <small class="text-white text-capitalize  mb-2">{{strtoupper($contestPlayer->versus)}}</small><br />
                                                        <p class="score text-capitalize">proj fantasy score: <span>{{$contestPlayer->score}}</span></p><br />
                                                    </div>
                                                    <div class="mobile-name-title name-title">
                                                        <p class="mb-2 font-weight-bold player-name">{{ucwords($contestPlayer->player->name)}}</p>
                                                        <small class="text-white text-capitalize m-vs">{{strtoupper($contestPlayer->versus)}}</small><br />
                                                        <small class="text-white text-capitalize m-date">{{date('D, M y, h:i A',strtotime($contestPlayer->played_on))}}</small><br />
                                                        <p class="score text-white d-block text-capitalize">proj fantasy score: <span>{{$contestPlayer->score}}</span></p><br />
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
                                    @else
                                        <h3 class="text-center text-white">No Pending Contest</h3>
                                    @endif
                                </div>
                            </div>
                            {{--Pending Entries--}}

                            <div class="tab-pane fade" id="finalEntries">
                                <div class="ic-entries-tab-contents final-entries">
                                    @if(!empty($contest)  && strtotime($contest->time_end) <= $now && $contest->is_final_answer == 1)
                                        <div class="ic-time">
                                            <h4>{{$contest->name ? date('M d',strtotime($contest->name)) : ''}}</h4>
                                        </div>
                                        @forelse($contest->contestPlayers as $key => $contestPlayer)
                                        <!--Item 1-->
{{--                                            <div class="ic-item  {{$loop->iteration % 2 == 0 ? 'item-bg-mobile' : 'item-bg'}}">--}}
                                            <div class="ic-item">
                                                <div class="user">
                                                    <div class="image">
                                                        <img src="{{asset($contestPlayer->player->image)}}"
                                                             alt="user">
                                                    </div>
                                                    <div class="name-title pt-3">
                                                        <p class="mb-2 font-weight-bold player-name">{{ucwords($contestPlayer->player->name)}}</p>
                                                        <small class="text-white text-capitalize  mb-2">{{date('D, M y, h:i A',strtotime($contestPlayer->played_on))}}</small><br />
                                                        <small class="text-white text-capitalize  mb-2">{{strtoupper($contestPlayer->versus)}}</small><br />
                                                        <p class="score text-capitalize">proj fantasy score: <span>{{$contestPlayer->score}}</span></p><br />
                                                    </div>
                                                    <div class="mobile-name-title name-title">
                                                        <p class="mb-2 font-weight-bold player-name">{{ucwords($contestPlayer->player->name)}}</p>
                                                        <small class="text-white text-capitalize m-vs">{{strtoupper($contestPlayer->versus)}}</small><br />
                                                        <small class="text-white text-capitalize m-date">{{date('D, M y, h:i A',strtotime($contestPlayer->played_on))}}</small><br />
                                                        <p class="score text-white d-block text-capitalize">proj fantasy score: <span>{{$contestPlayer->score}}</span></p><br />
                                                    </div>
                                                </div>

                                                <div class="over-projection final-fantacy-score text-center">
                                                        <span>your proj</span>
                                                    @if(!empty($contestPlayer->participant->participant_answer))
                                                        @if($contestPlayer->participant->participant_answer == 2)
                                                            <div class="over-icon text-center">
                                                                <a class="d-inline-block" href="#">over</a>
                                                            </div>
                                                        @else
                                                            <div class="under-icon justify-content-center">
                                                                <a class="d-inline-block" href="#">under</a>
                                                            </div>
                                                        @endif
                                                    @else
                                                        <div class="over-icon text-center">
                                                            <label class="under-btn not-vote d-inline-block">Did Not Vote</label>
                                                        </div>
                                                    @endif

                                                    <span class="mt-2 mb-1">Final projection</span>

                                                    @if(!empty($contestPlayer->participant->participant_answer) &&
                                                      $contestPlayer->answer == $contestPlayer->participant->participant_answer)
                                                        <div class="text-center">
                                                            <a href="#" class="final-remove check d-inline-block">
                                                                <i class="flaticon-tick-mark"></i>
                                                                final
                                                            </a>
                                                        </div>
                                                    @else
                                                        <div class="text-center">
                                                            <a href="#" class="final-remove d-inline-block">
                                                                <i class="flaticon-error"></i>
                                                                final
                                                            </a>
                                                        </div>
                                                    @endif
                                                    <p><span class="final-score">{{$contestPlayer->final_score}}</span> <span>fantasy score</span></p>
                                                </div>

                                                <div class="over-projection mobile-over-projection final-fantacy-score text-center">
                                                    <span>your proj</span>
                                                    @if(!empty($contestPlayer->participant->participant_answer))
                                                        @if($contestPlayer->participant->participant_answer == 2)
                                                            <div class="over-icon text-center">
                                                                <a class="d-inline-block" href="#">over</a>
                                                            </div>
                                                        @else
                                                            <div class="under-icon justify-content-center">
                                                                <a class="d-inline-block text-dark" href="#">under</a>
                                                            </div>
                                                        @endif
                                                    @else
                                                        <div class="over-icon text-center">
                                                            <label class="under-btn not-vote d-inline-block">Did Not Vote</label>
                                                        </div>
                                                    @endif

                                                    <span class="my-2"></span>

                                                    @if(!empty($contestPlayer->participant->participant_answer) &&
                                                      $contestPlayer->answer == $contestPlayer->participant->participant_answer)
                                                        <div class="text-center">
                                                            <a href="#" class="final-remove check d-inline-block">
                                                                <i class="flaticon-tick-mark"></i>
                                                                final
                                                            </a>
                                                        </div>
                                                    @else
                                                        <div class="text-center">
                                                            <a href="#" class="final-remove d-inline-block">
                                                                <i class="flaticon-error"></i>
                                                                final
                                                            </a>
                                                        </div>
                                                    @endif
                                                    <p><span class="final-score">{{$contestPlayer->final_score}}</span> <span>fantasy score</span></p>
                                                </div>

                                            </div>
                                        @empty
                                            <h3 class="text-center">No Players Found</h3>
                                        @endforelse

                                        <div class="ic-item-load-more">
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
                                        </div>

                                    @else
                                        <h3 class="text-center text-white">Today's answer not submitted yet.</h3>
                                    @endif
                                </div>
                                {{--Last seven entry data--}}
                                @if(!empty($latest7contests))
                                    @foreach($latest7contests as $contest)
                                        <div class="ic-entries-tab-contents mt-3 final-entries">
                                            <div class="ic-time">
                                                <h4>{{$contest->name ? date('d M',strtotime($contest->name)) : ''}}</h4>
                                            </div>
                                        @if(!empty($contest) && strtotime($contest->time_end) <= $now && $contest->is_final_answer == 1)
                                            @forelse($contest->contestPlayers as $key => $contestPlayer)
                                                <!--Item 1-->
{{--                                                    <div class="ic-item  {{$loop->iteration % 2 == 0 ? 'item-bg-mobile' : 'item-bg'}}">--}}
                                                    <div class="ic-item">
                                                        <div class="user">
                                                            <div class="image">
                                                                <img src="{{asset($contestPlayer->player->image)}}"
                                                                     alt="user">
                                                            </div>
                                                            <div class="name-title pt-3">
                                                                <p class="mb-2 font-weight-bold player-name">{{ucwords($contestPlayer->player->name)}}</p>
                                                                <small class="text-white text-capitalize  mb-2">{{date('D, M y, h:i A',strtotime($contestPlayer->played_on))}}</small><br />
                                                                <small class="text-white text-capitalize  mb-2">{{strtoupper($contestPlayer->versus)}}</small><br />
                                                                <p class="score text-capitalize">proj fantasy score: <span>{{$contestPlayer->score}}</span></p><br />
                                                            </div>
                                                            <div class="mobile-name-title name-title">
                                                                <p class="mb-2 font-weight-bold player-name">{{ucwords($contestPlayer->player->name)}}</p>
                                                                <small class="text-white text-capitalize m-vs">{{strtoupper($contestPlayer->versus)}}</small><br />
                                                                <small class="text-white text-capitalize m-date">{{date('D, M y, h:i A',strtotime($contestPlayer->played_on))}}</small><br />
                                                                <p class="score text-white d-block text-capitalize">proj fantasy score: <span>{{$contestPlayer->score}}</p><br />
                                                            </div>
                                                        </div>


                                                        <div class="over-projection final-fantacy-score text-center">
                                                            <span>your proj</span>
                                                            @if(!empty($contestPlayer->participant->participant_answer))
                                                                @if($contestPlayer->participant->participant_answer == 2)
                                                                    <div class="over-icon text-center">
                                                                        <a class="d-inline-block" href="#">over</a>
                                                                    </div>
                                                                @else
                                                                    <div class="under-icon justify-content-center">
                                                                        <a class="d-inline-block" href="#">under</a>
                                                                    </div>
                                                                @endif
                                                            @else
                                                                <div class="over-icon text-center">
                                                                    <label class="under-btn not-vote d-inline-block">Did Not Vote</label>
                                                                </div>
                                                            @endif

                                                            <span class="mt-2 mb-1">Final projection</span>

                                                            @if(!empty($contestPlayer->participant->participant_answer) &&
                                                              $contestPlayer->answer == $contestPlayer->participant->participant_answer)
                                                                <div class="text-center">
                                                                    <a href="#" class="final-remove check d-inline-block">
                                                                        <i class="flaticon-tick-mark"></i>
                                                                        final
                                                                    </a>
                                                                </div>
                                                            @else
                                                                <div class="text-center">
                                                                    <a href="#" class="final-remove d-inline-block">
                                                                        <i class="flaticon-error"></i>
                                                                        final
                                                                    </a>
                                                                </div>
                                                            @endif
                                                            <p><span class="final-score">{{$contestPlayer->final_score}}</span> <span>fantasy score</span></p>
                                                        </div>

                                                        <div class="over-projection mobile-over-projection final-fantacy-score text-center">
                                                            <span>your proj</span>
                                                            @if(!empty($contestPlayer->participant->participant_answer))
                                                                @if($contestPlayer->participant->participant_answer == 2)
                                                                    <div class="over-icon text-center">
                                                                        <a class="d-inline-block" href="#">over</a>
                                                                    </div>
                                                                @else
                                                                    <div class="under-icon justify-content-center">
                                                                        <a class="d-inline-block text-dark" href="#">under</a>
                                                                    </div>
                                                                @endif
                                                            @else
                                                                <div class="over-icon text-center">
                                                                    <label class="under-btn not-vote d-inline-block">Did Not Vote</label>
                                                                </div>
                                                            @endif

                                                            <span class="my-2"></span>

                                                            @if(!empty($contestPlayer->participant->participant_answer) &&
                                                              $contestPlayer->answer == $contestPlayer->participant->participant_answer)
                                                                <div class="text-center">
                                                                    <a href="#" class="final-remove check d-inline-block">
                                                                        <i class="flaticon-tick-mark"></i>
                                                                        final
                                                                    </a>
                                                                </div>
                                                            @else
                                                                <div class="text-center">
                                                                    <a href="#" class="final-remove d-inline-block">
                                                                        <i class="flaticon-error"></i>
                                                                        final
                                                                    </a>
                                                                </div>
                                                            @endif
                                                            <p><span class="final-score">{{$contestPlayer->final_score}}</span> <span>fantasy score</span></p>
                                                        </div>
                                                    </div>
                                                @empty
                                                    <h3 class="text-center">No Players Found</h3>
                                                @endforelse

                                                <div class="ic-item-load-more">
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
                                                </div>

                                            @else
                                                <h4 class="text-center text-white">Answer not submitted.</h4>
                                            @endif
                                        </div>
                                    @endforeach
                                @endif
                                {{--Last seven entry data--}}
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

            $(".rlabel").on('click',function (){
                let pid = $(this).attr('pid');
                let ltype = $(this).attr('ltype');
                $(this).addClass('active');

                if (ltype === "1"){
                    $('#over_lavel_'+pid).removeClass('active');
                }else{
                    $('#under_lavel_'+pid).removeClass('active');
                }
            });

            // Count down timer
            let getTime = $('#timer-time').text()+' -07:00';
            // let getTime = $('#timer-time').text()+' +06:00';
            console.log(getTime);

            function makeTimer() {
                if (Date.parse(getTime) < Date.parse(new Date().toUTCString())) {
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
