<div class="sidebar bg--dark">
    <button class="res-sidebar-close-btn"><i class="la la-times"></i></button>
    <div class="sidebar__inner">
        <div class="sidebar__logo">
            <a href="#" class="sidebar__main-logo">
                <img src="{{ asset('assets/admin/images/logo.jpg') }}" alt="image">
            </a>
        </div>
        <div class="sidebar__menu-wrapper" id="sidebar__menuWrapper">
      
            <ul class="sidebar__menu">
                <li class="sidebar-menu-item active">
                    <a href="{{ route('home') }}" class="nav-link ">
                        <i class="menu-icon fas fa-home"></i>
                        <span class="menu-title">Dashboard</span>
                    </a>
                </li>

                <li class="sidebar-menu-item ">
                    <a href="{{ route('category') }}" class="nav-link ">
                        <i class="menu-icon fas fa-boxes"></i>
                        <span class="menu-title">Categories</span>
                    </a>
                </li>
                <li class="sidebar-menu-item  ">
                    <a href="{{ route('subcategory') }}" class="nav-link">
                        <i class="menu-icon la la-dot-circle"></i>
                        <span class="menu-title">Sub Categories</span>
                    </a>
                </li>
                <li class="sidebar-menu-item ">
                    <a href="{{ route('brand') }}" class="nav-link ">
                        <i class="menu-icon fas fa-building"></i>
                        <span class="menu-title">Brands</span>
                    </a>
                </li>

                <li class="sidebar-menu-item ">
                    <a href="{{ route('unit') }}" class="nav-link ">
                        <i class="menu-icon fas fa-palette"></i>
                        <span class="menu-title">Sizes</span>
                    </a>
                </li>

                <li class="sidebar-menu-item ">
                    <a href="{{ route('all-product') }}" class="nav-link ">
                        <i class="menu-icon fas fa-box-open"></i>
                        <span class="menu-title">Products</span>
                    </a>
                </li>

                

                <li class="sidebar-menu-item sidebar-dropdown">
                    <a href="javascript:void(0)" class="">
                        <i class="menu-icon fas fa-shopping-cart"></i>
                        <span class="menu-title">Sale</span>
                    </a>
                    <div class="sidebar-submenu">
                        <ul>
                            <li class="sidebar-menu-item">
                                <a href="{{ route('add-Sale') }}" class="nav-link">
                                    <i class="menu-icon la la-dot-circle"></i>
                                    <span class="menu-title">Add Sales</span>
                                </a>
                            </li>

                            <li class="sidebar-menu-item">
                                <a href="{{ route('all-sales') }}" class="nav-link">
                                    <i class="menu-icon la la-dot-circle"></i>
                                    <span class="menu-title">All Sales</span>
                                </a>
                            </li>

                            <!-- <li class="sidebar-menu-item">
                                <a href="{{ route('all-sales-return') }}" class="nav-link">
                                    <i class="menu-icon la la-dot-circle"></i>
                                    <span class="menu-title"> Sale Return</span>
                                </a>
                            </li> -->

                        </ul>
                    </div>
                </li>


                <li class="sidebar-menu-item sidebar-dropdown">
                    <a href="javascript:void(0)" class="">
                        <i class="menu-icon fas fa-chart-pie"></i>
                        <i class=""></i>
                        <span class="menu-title">Reporting</span>
                    </a>
                    <div class="sidebar-submenu ">
                        <ul>
                            <li class="sidebar-menu-item ">
                                <a href="{{ route('sale-report') }}"
                                    class="nav-link">
                                    <i class="menu-icon la la-dot-circle"></i>
                                    <span class="menu-title">Sales Report</span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>

            <div class="text-center mb-3 text-uppercase">
                <span class="text--primary">POS</span>
                <span class="text--success">System </span>
            </div>
        </div>
    </div>
</div>