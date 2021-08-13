<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductBid;
use App\Models\ProductWiseBid;
use App\Models\Slider;

class ShopController extends Controller
{
    public function allProducts(){
//        $all_products = Product::where('status', 1)->orderBy('id', 'DESC')->get();
        $all_products = Product::where('status', 1)->orderBy('id', 'DESC')->paginate(8);
        $all_sliders = Slider::where('status', 1)->orderBy('order_serial', 'asc')->get();

        $data['all_products'] = $all_products;
        $data['all_sliders'] = $all_sliders;

        return view('frontend.shop', $data);
    }

    public function productDetails($slug){
        if($slug){
            $product = Product::where('slug', $slug)->first();
            if($product){
                $bidder_info = '';
                if($product->auction_end_date.' '.$product->auction_end_time >= date('Y-m-d H:i:s')){
                    $from = date("Y-m-d", strtotime($product->auction_start_date)).' '.date("H:i:s", strtotime($product->auction_start_time));
                    $to = date("Y-m-d", strtotime($product->auction_end_date)).' '.date("H:i:s", strtotime($product->auction_end_time));

                    $check_existing = ProductWiseBid::where('product_id', $product->id);
                    $check_existing->where(function($query) use($from, $to){
                        $query->whereBetween('auction_start_date',  [$from, $to]);
                        $query->orWhereBetween('auction_end_date_time',  [$from, $to]);
                    });
                    $check_existing = $check_existing->first();

                    $bidder_info = ProductBid::where('product_wise_bid_id', $check_existing->id)
                        ->where('user_id', \Auth::id())
                        ->first();
                }

                $related_products = Product::where('id', '!=',$product->id);
                $related_products->where(function($query) use($product){
                    $query->where('category_id', $product->category_id);
                    $query->orWhere('sub_category_id', $product->category_id);
                });
                $related_products = $related_products->orderBy('id', 'desc')->take(4)->get();

                return view('frontend.product-details', compact('product', 'related_products', 'bidder_info'));
            }
            else{
                abort(404);
            }
        }else{
            abort(404);
        }
    }

    public function productDetailsBid($slug){
        if($slug){
            $product = Product::where('slug', $slug)->first();
            if($product){
                $related_products = Product::where('id', '!=',$product->id);
                $related_products->where(function($query) use($product){
                    $query->where('category_id', $product->category_id);
                    $query->orWhere('sub_category_id', $product->category_id);
                });
                $related_products = $related_products->orderBy('id', 'desc')->take(4)->get();

                return view('frontend.product-details-bid', compact('product', 'related_products'));
            }
            else{
                abort(404);
            }
        }else{
            abort(404);
        }
    }

    public function ajaxProductList(Request $request){
        $product_lists = null;
        if($request->pro_type=='all-pro'){
            $product_lists = Product::where('status', 1)->orderBy('id', 'DESC')->paginate(8);
        }
        elseif($request->pro_type=='new-pro'){
            $product_lists = Product::where('status', 1)->orderBy('id', 'DESC')->paginate(8);
        }
        elseif($request->pro_type=='fea-pro'){
            $product_lists = Product::where('status', 1)->where("featureproduct", "yes")->orderBy('id', 'DESC')->paginate(8);
        }

        $html = view('frontend.ajax_blade.ajax_shop', compact('product_lists'))->render();
        return $html;

        /*$html = "";
        if($product_list){
            foreach ($product_list as $apk => $apv){
                $html .= '<div class="col-lg-3 col-md-4 col-sm-6 ic-col-xs-6">
                    <div class="ic-product-item">';
                $html .='<div class="ic-thumbnil">
                            <a href="'.route('product-details', $apv->slug).'">
                            <img src="'.asset('upload/product-thumbnail-255-200/'.$apv->feature_image).'"
                            class="img-fluid" alt="product"></a>
                            <span class="ic-badge">over</span>
                        </div>';
                $html .= '<div class="ic-content">
                            <div class="title-price">
                                <a href="'.route('product-details', $apv->slug).'">
                                    <h5>'.$apv->name.'</h5>';
                                        $price = $apv->price;
                                        if($apv->discount_amount)
                                            $price = $apv->price-$apv->discount_amount;
                            $html .= '<p>$'.number_format($price, 2).'</p>
                                </a>
                            </div>
                            <div class="ic-btn-group">';
                                if($apv->product_type=='General Product')
                                    $html .= '<a href="'.route('shopping.cart').'" class="buy-btn">buy now</a>';
                                else{
                                    $html .= '<a href="javascript:void(0)" class="bid-btn">bid now</a>
                                              <a href="javascript:void(0)" data-toggle="modal" data-target="#bidModal" class="icon-btn"><i class="flaticon-time-left"></i></a>';
                                }
                $html .= '</div>
                        </div>';
                $html .= '</div></div>';
            }
        }else{
            $html .= '<div class="col-md-12 text-center"><span class="text-danger">Product not available.</span></div>';
        }
        return $html;*/
    }
}
