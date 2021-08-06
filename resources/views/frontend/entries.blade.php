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
                            <img src="{{asset('frontend/images/user.png')}}" alt="user">
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
                        <div class="tab-pane fade show active" id="openEntries">
                            <div class="ic-entries-tab-contents open-entries">
                                <div class="ic-time">
                                    <h4>Played On : 22 June</h4>
                                </div>
                                <!--Item 1-->
                                <div class="ic-item item-bg">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user1.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="m-date">Sat, Jun 22, 10:30 AM</p>
                                            <p class="m-vs">VS BOS</p>
                                            <p><span>project fantacy score</span> 8.5</p>
                                        </div>
                                    </div>
                                    <div class="date">
                                        <span>Sat, Jun 22, 10:30 AM</span>
                                        <p>VS BOS</p>
                                    </div>
                                    <div class="score">
                                        <p>5</p>
                                        <span>projets score</span>
                                    </div>
                                    <div class="over-under-btn">
                                        <a href="#" class="over-btn">over</a>
                                        <a href="#" class="under-btn">under</a>
                                    </div>
                                </div>
                                <!--Item 2-->
                                <div class="ic-item item-bg-mobile">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user2.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="m-date">Sat, Jun 22, 10:30 AM</p>
                                            <p class="m-vs">VS BOS</p>
                                            <p><span>project fantacy score</span> 8.5</p>
                                        </div>
                                    </div>
                                    <div class="date">
                                        <span>Sat, Jun 22, 10:30 AM</span>
                                        <p>VS BOS</p>
                                    </div>
                                    <div class="score">
                                        <p>5</p>
                                        <span>projets score</span>
                                    </div>
                                    <div class="over-under-btn">
                                        <a href="#" class="over-btn">over</a>
                                        <a href="#" class="under-btn">under</a>
                                    </div>
                                </div>
                                <!--Item 3-->
                                <div class="ic-item item-bg">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user3.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="m-date">Sat, Jun 22, 10:30 AM</p>
                                            <p class="m-vs">VS BOS</p>
                                            <p><span>project fantacy score</span> 8.5</p>
                                        </div>
                                    </div>
                                    <div class="date">
                                        <span>Sat, Jun 22, 10:30 AM</span>
                                        <p>VS BOS</p>
                                    </div>
                                    <div class="score">
                                        <p>5</p>
                                        <span>projets score</span>
                                    </div>
                                    <div class="over-under-btn">
                                        <a href="#" class="over-btn">over</a>
                                        <a href="#" class="under-btn">under</a>
                                    </div>
                                </div>
                                <!--Item 4-->
                                <div class="ic-item item-bg-mobile">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user4.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="m-date">Sat, Jun 22, 10:30 AM</p>
                                            <p class="m-vs">VS BOS</p>
                                            <p><span>project fantacy score</span> 8.5</p>
                                        </div>
                                    </div>
                                    <div class="date">
                                        <span>Sat, Jun 22, 10:30 AM</span>
                                        <p>VS BOS</p>
                                    </div>
                                    <div class="score">
                                        <p>5</p>
                                        <span>projets score</span>
                                    </div>
                                    <div class="over-under-btn">
                                        <a href="#" class="over-btn">over</a>
                                        <a href="#" class="under-btn">under</a>
                                    </div>
                                </div>
                                <!--Item 5-->
                                <div class="ic-item item-bg">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user5.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="m-date">Sat, Jun 22, 10:30 AM</p>
                                            <p class="m-vs">VS BOS</p>
                                            <p><span>project fantacy score</span> 8.5</p>
                                        </div>
                                    </div>
                                    <div class="date">
                                        <span>Sat, Jun 22, 10:30 AM</span>
                                        <p>VS BOS</p>
                                    </div>
                                    <div class="score">
                                        <p>5</p>
                                        <span>projets score</span>
                                    </div>
                                    <div class="over-under-btn">
                                        <a href="#" class="over-btn">over</a>
                                        <a href="#" class="under-btn">under</a>
                                    </div>
                                </div>
                                <!--Item End-->
                                <div class="ic-item-load-more">
                                    <a href="#"><i class="flaticon-loading"></i> load more</a>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="pendingEntries">
                            <div class="ic-entries-tab-contents pending-entries">
                                <div class="ic-pending-entries-title">
                                    <h5>pending entries</h5>
                                    <div class="ic-timer">
                                        <div class="days">
                                            <h4>11</h4>
                                            <p>days</p>
                                        </div>
                                        <div class="hours">
                                            <h4>22</h4>
                                            <p>hours</p>
                                        </div>
                                        <div class="minute">
                                            <h4>44</h4>
                                            <p>Minutes</p>
                                        </div>
                                    </div>
                                </div>
                                <!--Item 1-->
                                <div class="ic-item item-bg">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user1.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="m-date">Sat, Jun 22, 10:30 AM</p>
                                            <p class="m-vs">VS BOS</p>
                                            <p><span>project fantacy score</span> 8.5</p>
                                        </div>
                                    </div>
                                    <div class="date">
                                        <span>Sat, Jun 22, 10:30 AM</span>
                                        <p>VS BOS</p>
                                    </div>
                                    <div class="score">
                                        <p>5</p>
                                        <span>projets score</span>
                                    </div>
                                    <div class="over-under-btn pending-overunder-btn">
                                        <div class="remove-btn mobile-remove-btn">
                                            <a href="#"><i class="flaticon-error"></i></a>
                                        </div>
                                        <a href="#" class="over-btn">over</a>
                                        <a href="#" class="under-btn">under</a>
                                    </div>
                                    <div class="remove-btn">
                                        <a href="#"><i class="flaticon-error"></i></a>
                                    </div>
                                </div>
                                <!--Item 2-->
                                <div class="ic-item item-bg-mobile">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user2.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="m-date">Sat, Jun 22, 10:30 AM</p>
                                            <p class="m-vs">VS BOS</p>
                                            <p><span>project fantacy score</span> 8.5</p>
                                        </div>
                                    </div>
                                    <div class="date">
                                        <span>Sat, Jun 22, 10:30 AM</span>
                                        <p>VS BOS</p>
                                    </div>
                                    <div class="score">
                                        <p>5</p>
                                        <span>projets score</span>
                                    </div>
                                    <div class="over-under-btn pending-overunder-btn">
                                        <div class="remove-btn mobile-remove-btn">
                                            <a href="#"><i class="flaticon-error"></i></a>
                                        </div>
                                        <a href="#" class="over-btn">over</a>
                                        <a href="#" class="under-btn">under</a>
                                    </div>
                                    <div class="remove-btn">
                                        <a href="#"><i class="flaticon-error"></i></a>
                                    </div>
                                </div>
                                <!--Item 3-->
                                <div class="ic-item item-bg">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user3.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="m-date">Sat, Jun 22, 10:30 AM</p>
                                            <p class="m-vs">VS BOS</p>
                                            <p><span>project fantacy score</span> 8.5</p>
                                        </div>
                                    </div>
                                    <div class="date">
                                        <span>Sat, Jun 22, 10:30 AM</span>
                                        <p>VS BOS</p>
                                    </div>
                                    <div class="score">
                                        <p>5</p>
                                        <span>projets score</span>
                                    </div>
                                    <div class="over-under-btn pending-overunder-btn">
                                        <div class="remove-btn mobile-remove-btn">
                                            <a href="#"><i class="flaticon-error"></i></a>
                                        </div>
                                        <a href="#" class="over-btn">over</a>
                                        <a href="#" class="under-btn">under</a>
                                    </div>
                                    <div class="remove-btn">
                                        <a href="#"><i class="flaticon-error"></i></a>
                                    </div>
                                </div>
                                <!--Item 4-->
                                <div class="ic-item item-bg-mobile">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user4.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="m-date">Sat, Jun 22, 10:30 AM</p>
                                            <p class="m-vs">VS BOS</p>
                                            <p><span>project fantacy score</span> 8.5</p>
                                        </div>
                                    </div>
                                    <div class="date">
                                        <span>Sat, Jun 22, 10:30 AM</span>
                                        <p>VS BOS</p>
                                    </div>
                                    <div class="score">
                                        <p>5</p>
                                        <span>projets score</span>
                                    </div>
                                    <div class="over-under-btn pending-overunder-btn">
                                        <div class="remove-btn mobile-remove-btn">
                                            <a href="#"><i class="flaticon-error"></i></a>
                                        </div>
                                        <a href="#" class="over-btn">over</a>
                                        <a href="#" class="under-btn">under</a>
                                    </div>
                                    <div class="remove-btn">
                                        <a href="#"><i class="flaticon-error"></i></a>
                                    </div>
                                </div>
                                <!--Item 5-->
                                <div class="ic-item item-bg">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user5.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="m-date">Sat, Jun 22, 10:30 AM</p>
                                            <p class="m-vs">VS BOS</p>
                                            <p><span>project fantacy score</span> 8.5</p>
                                        </div>
                                    </div>
                                    <div class="date">
                                        <span>Sat, Jun 22, 10:30 AM</span>
                                        <p>VS BOS</p>
                                    </div>
                                    <div class="score">
                                        <p>5</p>
                                        <span>projets score</span>
                                    </div>
                                    <div class="over-under-btn pending-overunder-btn">
                                        <div class="remove-btn mobile-remove-btn">
                                            <a href="#"><i class="flaticon-error"></i></a>
                                        </div>
                                        <a href="#" class="over-btn">over</a>
                                        <a href="#" class="under-btn">under</a>
                                    </div>
                                    <div class="remove-btn">
                                        <a href="#"><i class="flaticon-error"></i></a>
                                    </div>
                                </div>
                                <!--Item End-->
                                <div class="ic-item-load-more">
                                    <a href="#"><i class="flaticon-loading"></i> load more</a>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane fade" id="finalEntries">
                            <div class="ic-entries-tab-contents final-entries">
                                <div class="ic-time">
                                    <h4>final entries</h4>
                                </div>
                                <!--Item 1-->
                                <div class="ic-item item-bg">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user5.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="final-our-score">your score</p>
                                            <p class="final-score-point">16.5</p>
                                        </div>
                                    </div>
                                    <div class="over-projection">
                                        <div class="over-icon">
                                            <a href="#">over</a>
                                        </div>
                                        <span>your projection</span>
                                    </div>
                                    <div class="over-projection mobile-over-projection">
                                        <a href="#"><img src="{{asset('frontend/images/arrow-shape.png')}}" class="img-fluid" alt=""> over</a>
                                        <p>18.2 <span>fantacy score</span></p>
                                    </div>
                                    <div class="score">
                                        <p>5</p>
                                        <span>fantasy score</span>
                                    </div>
                                    <div class="final-fantacy-score">
                                        <a href="#" class="final-remove"><i class="flaticon-error"></i> final</a>
                                        <p>6.9 <span>fantasy score</span></p>
                                    </div>
                                </div>
                                <!--Item 2-->
                                <div class="ic-item item-bg-mobile">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user2.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="final-our-score">your score</p>
                                            <p class="final-score-point">16.5</p>
                                        </div>
                                    </div>
                                    <div class="over-projection">
                                        <div class="under-icon">
                                            <img src="{{asset('frontend/images/arrow-shape.png')}}" class="img-fluid" alt="">
                                            <a href="#">under</a>
                                        </div>
                                        <span>your projection</span>
                                    </div>
                                    <div class="over-projection mobile-over-projection">
                                        <a href="#"><img src="{{asset('frontend/images/arrow-shape.png')}}" class="img-fluid" alt=""> under</a>
                                        <p>18.2 <span>fantacy score</span></p>
                                    </div>
                                    <div class="score">
                                        <p>18.5</p>
                                        <span>fantasy score</span>
                                    </div>
                                    <div class="final-fantacy-score">
                                        <a href="#" class="final-remove check"><i class="flaticon-tick-mark"></i> final</a>
                                        <p>99.2 <span>fantasy score</span></p>
                                    </div>
                                </div>
                                <!--Item 3-->
                                <div class="ic-item item-bg">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user3.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="final-our-score">your score</p>
                                            <p class="final-score-point">16.5</p>
                                        </div>
                                    </div>
                                    <div class="over-projection">
                                        <div class="under-icon">
                                            <img src="{{asset('frontend/images/arrow-shape.png')}}" class="img-fluid" alt="">
                                            <a href="#">under</a>
                                        </div>
                                        <span>your projection</span>
                                    </div>
                                    <div class="over-projection mobile-over-projection">
                                        <a href="#"><img src="{{asset('frontend/images/arrow-shape.png')}}" class="img-fluid" alt=""> under</a>
                                        <p>18.2 <span>fantacy score</span></p>
                                    </div>
                                    <div class="score">
                                        <p>18.5</p>
                                        <span>fantasy score</span>
                                    </div>
                                    <div class="final-fantacy-score">
                                        <a href="#" class="final-remove check"><i class="flaticon-tick-mark"></i> final</a>
                                        <p>99.2 <span>fantasy score</span></p>
                                    </div>
                                </div>
                                <!--Item 4-->
                                <div class="ic-item item-bg-mobile">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user4.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="final-our-score">your score</p>
                                            <p class="final-score-point">16.5</p>
                                        </div>
                                    </div>
                                    <div class="over-projection">
                                        <div class="under-icon">
                                            <img src="{{asset('frontend/images/arrow-shape.png')}}" class="img-fluid" alt="">
                                            <a href="#">under</a>
                                        </div>
                                        <span>your projection</span>
                                    </div>
                                    <div class="over-projection mobile-over-projection">
                                        <a href="#"><img src="{{asset('frontend/images/arrow-shape.png')}}" class="img-fluid" alt=""> under</a>
                                        <p>18.2 <span>fantacy score</span></p>
                                    </div>
                                    <div class="score">
                                        <p>18.5</p>
                                        <span>fantasy score</span>
                                    </div>
                                    <div class="final-fantacy-score">
                                        <a href="#" class="final-remove check"><i class="flaticon-tick-mark"></i> final</a>
                                        <p>99.2 <span>fantasy score</span></p>
                                    </div>
                                </div>
                                <!--Item 5-->
                                <div class="ic-item item-bg">
                                    <div class="user">
                                        <div class="image">
                                            <img src="{{asset('frontend/images/entries-user5.png')}}" alt="user">
                                        </div>
                                        <div class="name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                        </div>
                                        <div class="mobile-name-title name-title">
                                            <p>Merrill Kelly</p>
                                            <span>BAL - LF</span>
                                            <p class="final-our-score">your score</p>
                                            <p class="final-score-point">16.5</p>
                                        </div>
                                    </div>
                                    <div class="over-projection">
                                        <div class="under-icon">
                                            <img src="{{asset('frontend/images/arrow-shape.png')}}" class="img-fluid" alt="">
                                            <a href="#">under</a>
                                        </div>
                                        <span>your projection</span>
                                    </div>
                                    <div class="over-projection mobile-over-projection">
                                        <a href="#"><img src="{{asset('frontend/images/arrow-shape.png')}}" class="img-fluid" alt=""> under</a>
                                        <p>18.2 <span>fantacy score</span></p>
                                    </div>
                                    <div class="score">
                                        <p>18.5</p>
                                        <span>fantasy score</span>
                                    </div>
                                    <div class="final-fantacy-score">
                                        <a href="#" class="final-remove check"><i class="flaticon-tick-mark"></i> final</a>
                                        <p>99.2 <span>fantasy score</span></p>
                                    </div>
                                </div>
                                <!--Item End-->
                                <div class="ic-item-load-more">
                                    <a href="#"><i class="flaticon-loading"></i> load more</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection
