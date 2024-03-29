
<!--===Header Area Start===-->

<header>
    <div class="container">
        <div class="ic-header-warper">
            <div class="logo">
                @if(!empty($siteSetting->logo))
                    <a href="{{route('home')}}" class="large-logo"><img src="{{asset($siteSetting->logo)}}" class="img-fluid" alt="logo"></a>
                @else
                    <a href="{{route('home')}}" class="large-logo"><img src="{{asset('frontend/images/logo/logo.png')}}" class="img-fluid" alt="logo"></a>
                @endif

                @if(!empty($siteSetting->icon))
                    <a href="{{route('home')}}" class="mobile-logo"><img src="{{asset($siteSetting->icon)}}" class="img-fluid" alt="mobile-logo"></a>
                @else
                    <a href="{{route('home')}}" class="mobile-logo"><img src="{{asset('frontend/images/logo/mobile-logo.png')}}" class="img-fluid" alt="mobile-logo"></a>
                @endif
            </div>
            <div class="ic-header-right">
                @php
                     use App\CustomClass\OwnLibrary;
                    $user = OwnLibrary::getUserInfo();
                    $guestUser = \App\Models\GuestUser::where('id','=',$user['id'])->first();
                    $total_coins = $guestUser->total_coin ?? 00;
                    $current_coins = $guestUser->current_coin ?? 00;
                @endphp
                <a href="{{route('login')}}" class="ic-btn"><i class="flaticon-login"></i> <span>login</span></a>
                <a href="#" class="ic-btn"><i class="flaticon-coins-1"></i> <span class="lg-coin-bal">DOGECOIN: <sapn class="aft-bd-share">{{ (int) $total_coins }}</sapn></span> <span class="sm-coin-bal aft-bd-share">00</span></a>
            </div>
        </div>
    </div>
</header>

<!--===Header Area End===-->
