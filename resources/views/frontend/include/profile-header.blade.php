<!--===Header Area Start===-->

<header>
    <div class="container">
        <div class="ic-header-warper profile-header-warper">
            <div class="logo">
                <a href="{{route('home')}}" class="large-logo"><img src="{{asset('frontend/images/logo/logo.png')}}"
                                                                    class="img-fluid" alt="logo"></a>
                <a href="{{route('home')}}" class="mobile-logo"><img
                        src="{{asset('frontend/images/logo/mobile-logo.png')}}" class="img-fluid" alt="logo"></a>
            </div>
            <div class="ic-header-right ic-profile-header">
                <div class="ic-menu-item">
                    <ul class="ic-navbar">
                        <li class="ic-nav-item"><a href="#" class="ic-nav-link">Board</a></li>
                        <li class="ic-nav-item"><a href="{{route('entries')}}" class="ic-nav-link">Entries</a></li>
                        <li class="ic-nav-item"><a href="{{route('orders')}}" class="ic-nav-link">orders</a></li>
                    </ul>
                </div>

                <div class="ic-profile-header-btn">
{{--                    <a href="{{route('profile')}}" class="ic-btn profile-dropdown-item"><i class="flaticon-login"></i>--}}
{{--                        <span>mr. jaxon</span></a>--}}

                    <div class="dropdown show">
                        <a class="ic-btn profile-dropdown-item dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <i class="flaticon-login"></i>
                            <span>{{ucwords(auth()->user()->name)}}</span>
                        </a>

                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <a class="dropdown-item" href="{{route('profile')}}">Profile</a>
                            <a class="dropdown-item" href="{{route('logout')}}">Logout</a>
                        </div>
                    </div>

                    <a href="#" class="ic-btn"><i class="flaticon-coins-1"></i> <span>Conis Balance: 00</span></a>
                    {{--                        <a href="#" class="ic-btn ml-2"><i class="icofont-sign-out"></i> <span>Logout</span></a>--}}

                    @guest()
                    <a href="#" class="mobile-profile-user"><img src="{{asset('frontend/images/profile-user.png')}}"
                                                                 alt=""></a>
                    @endguest

                    @auth()
                        @if(auth()->user()->photo)
                    <a href="#" class="mobile-profile-user"><img src="{{auth()->user()->photo}}"
                                                                 alt=""></a>
                        @else
                            <a href="#" class="mobile-profile-user"><img src="{{asset('frontend/images/profile-user.png')}}"
                                                                         alt=""></a>
                            @endif
                    @endauth
                    <a href="#" class="ic-mobile-menu-open">
                        <span></span>
                        <span></span>
                        <span></span>
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- mobile-nav start -->
    <div class="ic-mobile-menu-overlay"></div>
    <div class="offcanvas_menu d-block d-lg-none ic_mobile_nav_head">
        <div class="container">
            <div class="ic-mobile-menu-wrapper">
                <div class="ic-menu-close">
                    <a href="javascript:void(0)"><i class="icofont-close-circled"></i></a>
                </div>
                <div id="menu" class="text-left ">
                    <ul class="ic-mobile-menu">

                        <li class="ic-menu-item-has-children">
                            <a href="#">Board</a>
                        </li>
                        <li class="ic-menu-item-has-children">
                            <a href="{{route('entries')}}">Entries</a>
                        </li>
                        <li class="ic-menu-item-has-children">
                            <a href="#">orders</a>
                        </li>
                        <li class="ic-menu-item-has-children">
                            <a href="#">About us</a>
                        </li>
                        <li class="ic-menu-item-has-children">
                            <a href="#">Contact us</a>
                        </li>
                        <li class="ic-menu-item-has-children">
                            <a href="#">Rules</a>
                        </li>
                        <li class="ic-menu-item-has-children">
                            <a href="#">Privacy</a>
                        </li>
                        <li class="ic-menu-item-has-children">
                            <a href="#">Terms & Condition</a>
                        </li>
                        <li class="ic-menu-item-has-children">
                                <span class="menu-expand">
                                    <i class="icofont-simple-down"></i>
                                </span>
                            <a href="#"><i class="flaticon-login menu-icon"></i> {{ucwords(auth()->user()->name)}}</a>
                        </li>
                        <li class="ic-menu-item-has-children">
                            <a href="#"><i class="flaticon-coins-1 menu-icon"></i> Coins Balance: 00</a>
                        </li>
                    </ul>

                </div>

            </div>
        </div>
    </div>

    <!--Mobile Nav End-->
</header>

<!--===Header Area End===-->
