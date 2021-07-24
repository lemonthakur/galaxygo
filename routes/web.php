<?php

use App\Http\Controllers\ContestController;
use App\Http\Controllers\ContestPlayerController;
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
});
