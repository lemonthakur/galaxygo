<?php

use App\Http\Controllers\AboutUsController;
use App\Http\Controllers\ContestController;
use App\Http\Controllers\ContestPlayerController;
use App\Http\Controllers\OtherPagesController;
use App\Http\Controllers\PlayerController;
use App\Http\Controllers\UserAccessController;
use App\Http\Controllers\WinCoinController;
use App\Http\Controllers\WithdrawRequestController;
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
        'withdraw' => WithdrawRequestController::class,
        'players' => PlayerController::class,
    ]);



    Route::get('no-participant',[ContestController::class,'noParticipant'])->name('contest.no.participant');

    Route::get('user-frontend',[UserController::class,'frontendIndex'])->name('user.frontend');

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

//    Playear search
    Route::post('players/search',[PlayerController::class,'search'])->name('player.search');
});
