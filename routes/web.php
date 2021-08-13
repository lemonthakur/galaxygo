<?php

use App\Http\Controllers\AboutUsController;
use App\Http\Controllers\ContestController;
use App\Http\Controllers\ContestPlayerController;
use App\Http\Controllers\Frontend\HomeController;
use App\Http\Controllers\OtherPagesController;
use App\Http\Controllers\UserAccessController;
use App\Http\Controllers\WinCoinController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ModuleController;
use App\Http\Controllers\RoleAccessController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AdminLoginController;
use App\Http\Controllers\ActivityController;
use App\Http\Controllers\SiteSettingController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\OrderController;
use App\Http\Controllers\SliderController;
use App\Http\Controllers\FooterCircleImageController;

include ('frontend.php');

//Frontend Route
Route::get('/',[HomeController::class,'home'])->name('home');
//Route::get('/today-tomorrow',[HomeController::class,'todayTomorrow'])->name('today-tomorrow');
Route::get('/start-contest',[HomeController::class,'startContest'])->name('start-contest');
//Route::get('/entries',[HomeController::class,'entries'])->name('entries');
//Route::get('/shop',[HomeController::class,'shop'])->name('shop');
//Route::get('/product-details',[HomeController::class,'productDetails'])->name('product-details');
Route::get('/orders',[HomeController::class,'orders'])->name('orders');
Route::get('/profile',[HomeController::class,'profile'])->name('profile');
//Route::get('/cart',[HomeController::class,'cart'])->name('cart');
//Route::get('/checkout',[HomeController::class,'checkout'])->name('checkout');
Route::get('/about-us',[HomeController::class,'about'])->name('about-us');
Route::get('/privacy-policy',[HomeController::class,'privacyPolicy'])->name('privacy.policy');
Route::get('/contact',[HomeController::class,'contact'])->name('contact');
Route::post('/contact-message',[HomeController::class,'contactMessage'])->name('contact.message');
//Frontend Route


Route::get('/admin-login',[AdminLoginController::class,'loginView'])->name('admin.login.view');
Route::post('/admin-login',[AdminLoginController::class,'login'])->name('admin.login');

Route::group(['middleware'=>'authCheck'],function (){
    Route::get('/admin-logout',[AdminLoginController::class,'logout'])->name('admin.logout');

    Route::get("/dashboard",[DashboardController::class,'index'])->name('dashboard');

    Route::resources([
        'activity' => ActivityController::class,
        'module' => ModuleController::class,
        'role' => RoleController::class,
        'user' => UserController::class,
        'contest' => ContestController::class,
        'contest-player' => ContestPlayerController::class,
        'win-coin' => WinCoinController::class,
    ]);

    Route::get('site-setting',[SiteSettingController::class,'edit'])->name('site.setting.edit');
    Route::put('site-setting', [SiteSettingController::class,'update'])->name('site.setting.update');

    Route::get('role-access',[RoleAccessController::class,'index'])->name('role.access');
    Route::post('roleAclSetup', [RoleAccessController::class,'roleAclSetup']);
    Route::post('roleacl', [RoleAccessController::class,'save']);

    Route::get('user-access', [UserAccessController::class,'index'])->name('user.access');
    Route::post('userAclSetup', [UserAccessController::class,'userAclSetup']);
    Route::post('useracl', [UserAccessController::class,'save']);

    Route::post('add-player-to-cart',[ContestPlayerController::class,'addPlayerToCart'])->name('player.add.cart');
    Route::post('remove-player-from-cart',[ContestPlayerController::class,'removeCart'])->name('player.remove.cart');
    Route::get('contest/answer/{id}',[ContestController::class,'contestAnswer'])->name('contest.answer');
    Route::post('contest/answer',[ContestController::class,'contestAnswerSubmit'])->name('contest.answer.submit');

    Route::resource("/category",CategoryController::class);
    Route::resource("/brand",BrandController::class);
    Route::resource("/product",ProductController::class);
    Route::post("/product-sub-category",[ProductController::class,'getSubCagetories'])->name('product-product-sub-category.get');
    Route::get("/image_show/{type}/{id}",[ProductController::class,'imageShow']);
    Route::get("product-stock-report",[ProductController::class,'productStockReport'])->name('product.stock.report');

    Route::get('auction-products', [ProductController::class,'auctionProducts'])->name('auction-product.list');
    Route::any('bid-user-list/{id?}', [ProductController::class,'bidUsersList'])->name('bid.users.list');

    Route::get('orders',[OrderController::class,'index'])->name('backend.order.view');
    Route::get('orders-details/{id}/{action?}',[OrderController::class, 'orderDetails'])->name('backend.order.details');
    Route::post('orders-status-change',[OrderController::class, 'orderStatusChange'])->name('backend.orders-status-change');

    Route::get('auctions-orders',[OrderController::class,'auctionsOrders'])->name('backend.auction.order.view');

    Route::resource("slider",SliderController::class);
    Route::get("/slider_image_show/{id}",[SliderController::class,'imageShow'])->name('slider.image.show');

    // Footer icons
    Route::resource("footer-circle-image",FooterCircleImageController::class);
    Route::get("/circle_image_show/{id}",[FooterCircleImageController::class,'imageShow'])->name('circle.image.show');

//  Pages
    Route::get('/pages/about-us/edit', [AboutUsController::class,'edit'])->name('about-us.edit');
    Route::put('/pages/about-us/update', [AboutUsController::class,'update'])->name('about-us.update');
    Route::get('/pages/other-page/edit', [OtherPagesController::class,'edit'])->name('other-page.edit');
    Route::put('/pages/other-page/update', [OtherPagesController::class,'update'])->name('other-page.update');
//  Pages
});
