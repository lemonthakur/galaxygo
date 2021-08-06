<?php

use App\Http\Controllers\Frontend\AuthController;
use App\Http\Controllers\Frontend\CartController;
use App\Http\Controllers\Frontend\ForgotPasswordController;
use App\Http\Controllers\Frontend\ShopController;
use App\Http\Controllers\Frontend\ShoppingCartController;

//minicart
Route::post('cart/add', [CartController::class,'cartAdd'])->name('cart.add');
//Route::post('cart/add','frontend\CartController@cartAdd')->name('cart.add');
Route::post('cart/remove/', [CartController::class,'removeCart'])->name('cart.remove');
Route::get('/cart',[ShoppingCartController::class,'cart'])->name('shopping.cart');
Route::post('cart/update',[ShoppingCartController::class,'cartUpdate'])->name('cart.update');

Route::get('cart/get','frontend\CartController@cartGet')->name('cart.get');


//minicart

// Shop page
Route::get('shop/{pro_type?}', [ShopController::class,'allProducts'])->name('shop');
Route::get('products/{slug}',[ShopController::class,'productDetails'])->name('product-details');
Route::get('products/bid/{slug}',[ShopController::class,'productDetailsBid'])->name('product-details.bid');
Route::post('ajax-pro-list',[ShopController::class,'ajaxProductList'])->name('ajax-pro.list');
Route::post('bid/cart/add', [CartController::class,'bidProductCartAdd'])->name('bid-product-cart.add');
Route::post('bid/user/list', [CartController::class,'bidUserList'])->name('bid-user.list');

//Frontend Login
Route::get('/login',[AuthController::class,'loginView'])->name('login');
Route::post('/login',[AuthController::class,'login'])->name('login.submit');
Route::get('/registration',[AuthController::class,'registrationView'])->name('register');
Route::post('/registration',[AuthController::class,'register'])->name('register.submit');

//Reset Password
Route::get('forget-password', [ForgotPasswordController::class, 'showForgetPasswordForm'])->name('forget.password.get');
Route::post('forget-password', [ForgotPasswordController::class, 'submitForgetPasswordForm'])->name('forget.password.post');
Route::get('reset-password/{token}', [ForgotPasswordController::class, 'showResetPasswordForm'])->name('reset.password.get');
Route::post('reset-password', [ForgotPasswordController::class, 'submitResetPasswordForm'])->name('reset.password.post');


Route::group(['middleware'=>'frontAuthCheck'],function () {
    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');
});
