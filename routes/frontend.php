<?php

use App\Http\Controllers\Frontend\AuthController;
use App\Http\Controllers\Frontend\CartController;
use App\Http\Controllers\Frontend\ContestController;
use App\Http\Controllers\Frontend\ForgotPasswordController;
use App\Http\Controllers\Frontend\ShopController;
use App\Http\Controllers\Frontend\ShoppingCartController;
use App\Http\Controllers\Frontend\PayPalPaymentController;
use App\Http\Controllers\Frontend\CheckoutController;
use App\Http\Controllers\Frontend\HomeController;
use App\Http\Controllers\Frontend\BidProductPaymentController;

//Contest Frontend
Route::get('/entries',[ContestController::class,'entries'])->name('entries');
Route::post('/entries/store',[ContestController::class,'entriesStore'])->name('entries.store');
//Contest Frontend

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
//Social Login
Route::get('social-login/{provider}', [AuthController::class,'redirect'])->name('social.login');
Route::get('social-login/{provider}/callback',[AuthController::class,'callback'])->name('social.login.callback');

//Frontend Registration
Route::get('/registration',[AuthController::class,'registrationView'])->name('register');
Route::post('/registration',[AuthController::class,'register'])->name('register.submit');

//Reset Password
Route::get('forget-password', [ForgotPasswordController::class, 'showForgetPasswordForm'])->name('forget.password.get');
Route::post('forget-password', [ForgotPasswordController::class, 'submitForgetPasswordForm'])->name('forget.password.post');
Route::get('reset-password/{token}', [ForgotPasswordController::class, 'showResetPasswordForm'])->name('reset.password.get');
Route::post('reset-password', [ForgotPasswordController::class, 'submitResetPasswordForm'])->name('reset.password.post');


Route::get('handle-payment/{id?}', [PayPalPaymentController::class, 'handlePayment'])->name('make.payment');
Route::get('cancel-payment', [PayPalPaymentController::class, 'paymentCancel'])->name('cancel.payment');
Route::get('payment-success', [PayPalPaymentController::class, 'paymentSuccess'])->name('success.payment');
// for bid payment
Route::get('bid-cancel-payment', [PayPalPaymentController::class, 'bidPaymentCancel'])->name('cancel.bid.payment');
Route::get('bid-payment-success', [PayPalPaymentController::class, 'bidPaymentSuccess'])->name('success.bid.payment');

Route::get('/checkout',[CheckoutController::class,'checkout'])->name('checkout');
Route::post('checkout-register', [CheckoutController::class, 'register'])->name('checkout.register');
// Bid payment
Route::get('/bid-checkout/{id}',[BidProductPaymentController::class,'bidcheckout'])->name('bid.checkout');
//Route::post('/checkout-bid-payment',[BidProductPaymentController::class,'checkoutBidPayment'])->name('checkout.bid.payment');

Route::group(['middleware'=>'frontAuthCheck'],function () {
    Route::get('/logout', [AuthController::class, 'logout'])->name('logout');
    Route::post('checkout-point-payment', [CheckoutController::class, 'checkoutpointPayment'])->name('checkout-point.payment');
    Route::post('checkout-bid-point-payment', [CheckoutController::class, 'checkoutbidpointPayment'])->name('checkout-bid-point.payment');
    Route::get('/payment',[HomeController::class,'payment'])->name('payment');
    Route::get('/bid-payment/{id}',[HomeController::class,'bidpayment'])->name('bid.payment');

//    Claim Contest Coin
    Route::post('/entries/claim-coin',[ContestController::class,'claimCoin'])->name('entries.claim.coin');
});
