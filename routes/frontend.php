<?php
use App\Http\Controllers\Frontend\CartController;
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
Route::post('ajax-pro-list',[ShopController::class,'ajaxProductList'])->name('ajax-pro.list');


