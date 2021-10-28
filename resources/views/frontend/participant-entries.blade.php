@extends('frontend.layout.master')
@section('title','Participant Entries')

@section('content')

    <section class="ic-order-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-5">
                    <div class="ic-profile-left">
                        <div class="ic-user">
                            <div class="ic-cover-bg">
                                @if(auth()->user()->cover_photo)
                                    <img id="cover_photo" src="{{asset(auth()->user()->cover_photo)}}" class="img-fluid"
                                         alt="cover">
                                @else
                                    <img id="cover_photo" src="{{asset('frontend/images/profile-cover.png')}}"
                                         class="img-fluid" alt="default cover">
                                @endif
                            </div>
                            <div class="user-profile">
                                @if(auth()->user()->photo)
                                    <img id="profile_pic" src="{{auth()->user()->photo}}" alt="user">
                                @else
                                    <img id="profile_pic" src="{{asset('demo-pic/download.png')}}" alt="user">
                                @endif
                            </div>
                        </div>
                        <div class="ic-win-btn">
                            <a href="#">{{$entryWon ?? 00}} <span>Entries Won</span></a>
                            <a href="#">{{(int) auth()->user()->total_coin ?? 00}} <span>Coins Won</span></a>
                        </div>
                        <div class="ic-total-balance">
                            <p>Total Coins Balance</p>
                            <h4>{{(int) auth()->user()->current_coin ?? 00}}</h4>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7">
                    <table class="table table-borderless text-white">
                        <thead style="background-color: #ffffff1a">
                        <tr>
                            <th>SL</th>
                            <th>Date</th>
                            <th>Stage</th>
                            <th>Correct Answer</th>
                            <th>Coins Won</th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        @php
                        $sl = \App\CustomClass\OwnLibrary::paginationSerial($contestParticipants);
                        @endphp
                        @foreach($contestParticipants as $participant)
                            <tr @if($loop->iteration % 2 ==0) style="background-color: #ffffff1a" @endif>
                                <td>{{$sl++}}</td>
                                <td>{{$participant->contest->name}}</td>
                                <td>
                                    @if($now > strtotime($participant->contest->time_start) && strtotime($participant->contest->time_end) >  $now)
                                        <label class="py-1 px-2 bg-primary text-white">Open</label>
                                    @endif

                                    @if(strtotime($participant->contest->time_end) < $now && $participant->contest->is_final_answer == 0)
                                        <label class="py-1 px-2 bg-warning">Pending</label>
                                    @endif

                                    @if(strtotime($participant->contest->time_end) < $now && $participant->contest->is_final_answer == 1)
                                        <label class="py-1 px-2 bg-success">Final</label>
                                    @endif

                                </td>
                                <td>{{$participant->correct_answer}}</td>
                                <td>{{$participant->earn}}</td>
                                <td>
                                    @if(strtotime($participant->contest->time_end) < $now && $participant->contest->is_final_answer == 1 && $participant->get_coin == 0)
                                        <form method="post" action="{{route('entries.claim.coin')}}">
                                            @csrf
                                            <input type="hidden" name="id" value="{{encrypt($participant->contest_id)}}">
                                            <button type="submit" class="btn btn-primary btn-sm">
                                                <i class="icofont-coins mr-1"></i>
                                                Claim Coin
                                            </button>
                                        </form>
                                    @endif

                                    @if(strtotime($participant->contest->time_end) < $now && $participant->contest->is_final_answer == 1 && $participant->get_coin == 1)
                                            <label class="bg-success text-white py-1 px-2">Already Claimed</label>
                                    @endif
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                        <tfoot>
                        <tr>
                            <td class="text-center" colspan="6">
                                <div class="ic-pagination">
                                    {{$contestParticipants->links('vendor.pagination.frontend')}}
                                </div>
                            </td>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </section>

@endsection

