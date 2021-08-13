<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="{{route('dashboard')}}" class="brand-link">
        @if(!$siteSetting->logo)
            <img src="{{asset("/public/admin-lte/dist/img/AdminLTELogo.png")}}" alt="Company Logo"
                 class="brand-image img-circle elevation-3"
                 style="opacity: .8">
            <span class="brand-text font-weight-light">{{ucwords($siteSetting->site_title ?? '')}}</span>
        @else
            <img src="{{asset($siteSetting->logo)}}" alt="Company Logo"
                 class="brand-image">
        @endif
        <span class="brand-text font-weight-light d-inline-block"></span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="image">
                @auth
                    @if(auth()->user()->photo)
                        <img src="{{asset(auth()->user()->photo)}}" class="img-circle elevation-2" alt="User Image">
                    @else
                        <img src="{{asset("/public/demo-pic/profile.png")}}" class="img-circle elevation-2"
                             alt="User Image">
                    @endif
                @elseauth
                    <img src="{{asset("/public/demo-pic/profile.png")}}" class="img-circle elevation-2"
                         alt="User Image">
                @endauth
            </div>
            <div class="info">
                @auth
                    <a href="#" class="d-block">{{auth()->user()->name}}</a>
                @endauth
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

                <li class="nav-item">
                    <a href="{{route('dashboard')}}" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            Dashboard
                        </p>
                    </a>
                </li>

                @if(!empty($aclList[6][1]))
                    <li class="nav-item has-treeview {{ ($routeName == 'user.index' || $routeName == 'user.create' || $routeName == 'user.edit') ? 'menu-open' : '' }}">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-user"></i>
                            <p>
                                User Management
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            @if(!empty($aclList[6][1]))
                                <li class="nav-item">
                                    <a href="{{route("user.index")}}"
                                       class="nav-link {{ ($routeName == 'user.index' || $routeName == 'user.create'|| $routeName == 'user.edit') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Admin Panel User</p>
                                    </a>
                                </li>
                            @endif
                        </ul>
                    </li>
                @endif

                 @if(!empty($aclList[1][1]) || !empty($aclList[2][1]) || !empty($aclList[3][1]))
                    <li class="nav-item has-treeview {{ ($routeName == 'role.index' || $routeName == 'role.create' || $routeName == 'role.edit' || $routeName == 'role.access' || $routeName == 'user.access') ? 'menu-open' : '' }}">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-user"></i>
                            <p>
                                Access Control
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            @if(!empty($aclList[1][1]))
                                <li class="nav-item">
                                    <a href="{{route("role.index")}}"
                                       class="nav-link {{ ($routeName == 'role.index' || $routeName == 'role.create'|| $routeName == 'role.edit') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Role Management</p>
                                    </a>
                                </li>
                            @endif
                            @if(!empty($aclList[2][1]))
                                <li class="nav-item">
                                    <a href="{{route("role.access")}}"
                                       class="nav-link {{ ($routeName == 'role.access') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Role Access Control</p>
                                    </a>
                                </li>
                            @endif
                            @if(!empty($aclList[3][1]))
                                <li class="nav-item">
                                    <a href="{{route("user.access")}}"
                                       class="nav-link {{ ($routeName == 'user.access') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>User Access Control</p>
                                    </a>
                                </li>
                            @endif

                        </ul>
                    </li>
                @endif

                <li class="nav-item has-treeview {{ ($routeName == 'contest.index' || $routeName == 'contest.create' || $routeName == 'contest.edit') ? 'menu-open' : '' }}">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-play-circle"></i>
                        <p>
                            Contest Management
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route("contest.index")}}"
                               class="nav-link {{ ($routeName == 'contest.index' || $routeName == 'contest.edit') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Contest List</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route("contest.create")}}"
                               class="nav-link {{ ($routeName == 'contest.create') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Contest Create</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item has-treeview {{ ($routeName == 'win-coin.index' || $routeName == 'win-coin.create' || $routeName == 'win-coin.edit') ? 'menu-open' : '' }}">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-coins"></i>
                        <p>
                            Contest Win Coin
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route("win-coin.index")}}"
                               class="nav-link {{ ($routeName == 'win-coin.index' || $routeName == 'win-coin.edit') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Contest Win Coin List</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route("win-coin.create")}}"
                               class="nav-link {{ ($routeName == 'win-coin.create') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Contest Win Coin Create</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item has-treeview {{ ($routeName == 'category.index' || $routeName == 'category.create' || $routeName == 'category.edit'
                 || $routeName == 'brand.index' || $routeName == 'brand.create' || $routeName == 'brand.edit'
                 || $routeName == 'product.index' || $routeName == 'product.create' || $routeName == 'product.edit' || $routeName == 'auction-product.list') ? 'menu-open' : '' }}">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-user"></i>
                        <p>
                            Product Management
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route("category.index")}}"
                               class="nav-link {{ ($routeName == 'category.index' || $routeName == 'category.edit') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Category List</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route("category.create")}}"
                               class="nav-link {{ ($routeName == 'category.create') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Category Create</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="{{route("brand.index")}}"
                               class="nav-link {{ ($routeName == 'brand.index' || $routeName == 'brand.edit') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Brand List</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route("brand.create")}}"
                               class="nav-link {{ ($routeName == 'brand.create') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Brand Create</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="{{route("product.index")}}"
                               class="nav-link {{ ($routeName == 'product.index' || $routeName == 'product.edit') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Product List</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route("product.create")}}"
                               class="nav-link {{ ($routeName == 'product.create') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Product Create</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route("auction-product.list")}}"
                               class="nav-link {{ ($routeName == 'auction-product.list') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Auction Product List</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item has-treeview {{ ($routeName == 'backend.order.view' || $routeName == 'backend.order.details'
                || $routeName == 'backend.auction.order.view') ? 'menu-open' : '' }}">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-user"></i>
                        <p>
                            Order Management
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route("backend.order.view")}}"
                               class="nav-link {{ ($routeName == 'backend.order.view' || $routeName == 'backend.order.details'|| $routeName == 'backend.order.print') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Orders</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="{{route("backend.auction.order.view")}}"
                               class="nav-link {{ ($routeName == 'backend.auction.order.view') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Auction Orders</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item has-treeview {{ ($routeName == 'product.stock.report' ) ? 'menu-open' : '' }}">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-user"></i>
                        <p>
                            Report
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route("product.stock.report")}}"
                               class="nav-link {{ ($routeName == 'product.stock.report') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Stock Report</p>
                            </a>
                        </li>
                    </ul>
                </li>

                <li class="nav-item has-treeview {{ ($routeName == 'about-us.edit' || $routeName == 'other-page.edit') ? 'menu-open' : '' }}">
                    <a href="#" class="nav-link">
                        <i class="nav-icon fas fa-coins"></i>
                        <p>
                            Pages
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="{{route("about-us.edit")}}"
                               class="nav-link {{ ($routeName == 'about-us.edit') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>About Us</p>
                            </a>
                        </li>

                        <li class="nav-item">
                            <a href="{{route("other-page.edit")}}"
                               class="nav-link {{ ($routeName == 'other-page.edit') ? 'active' : '' }}">
                                <i class="far fa-circle nav-icon"></i>
                                <p>Other Pages</p>
                            </a>
                        </li>
                    </ul>
                </li>

                @if(!empty($aclList[4][1]) || !empty($aclList[5][1]) || !empty($aclList[10][3])
                 || !empty($aclList[10][3]) )
                    <li class="nav-item has-treeview {{ ($routeName == 'activity.index' || $routeName == 'activity.create'
                    || $routeName == 'activity.edit' || $routeName == 'module.index' || $routeName == 'module.create'
                    || $routeName == 'module.edit' || $routeName == 'site.setting.edit' || $routeName == 'slider.create'
                    || $routeName == 'slider.edit' || $routeName == 'slider.index') ? 'menu-open' : '' }}">

                        <a href="#"
                           class="nav-link">
                            <i class="nav-icon fas fa-cog"></i>
                            <p>
                                Setting
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                            @if(!empty($aclList[4][1]))
                                <li class="nav-item">
                                    <a href="{{route("module.index")}}"
                                       class="nav-link {{ ($routeName == 'module.index' || $routeName == 'module.create'|| $routeName == 'module.edit') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Module Management</p>
                                    </a>
                                </li>
                            @endif
                            @if(!empty($aclList[5][1]))
                                <li class="nav-item">
                                    <a href="{{route("activity.index")}}"
                                       class="nav-link {{ ($routeName == 'activity.index' || $routeName == 'activity.create'|| $routeName == 'activity.edit') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Activity Management</p>
                                    </a>
                                </li>
                            @endif
                            @if(!empty($aclList[10][3]))
                                <li class="nav-item">
                                    <a href="{{route("site.setting.edit")}}"
                                       class="nav-link {{ ($routeName == 'site.setting.edit') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Site Setting</p>
                                    </a>
                                </li>
                            @endif
                                <li class="nav-item">
                                    <a href="{{route("slider.index")}}"
                                       class="nav-link {{ ($routeName == 'slider.index' || $routeName == 'slider.create'|| $routeName == 'slider.edit') ? 'active' : '' }}">
                                        <i class="far fa-circle nav-icon"></i>
                                        <p>Slider</p>
                                    </a>
                                </li>
                        </ul>
                    </li>
                @endif

                <li class="nav-item">
                    <a href="{{route('admin.logout')}}" class="nav-link">
                        <i class="nav-icon fas fa-sign-out-alt"></i>
                        <p>
                            Logout
                        </p>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
