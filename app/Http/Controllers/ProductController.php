<?php

namespace App\Http\Controllers;

use App\CustomClass\OwnLibrary;
use Illuminate\Database\Eloquent\Model;
use App\Models\Product;
use App\Models\Brand;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Redirect;
use Yajra\DataTables\Facades\DataTables;

class ProductController extends Controller
{
    protected $moduleId = 1;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        OwnLibrary::validateAccess($this->moduleId,1);

        if($request->ajax()){
            $name = $request->name;

            $products = Product::with('category_name','sub_category_name','brand_name')->orderBy('id','desc');

            return DataTables::of($products)
                ->addIndexColumn()
                ->addColumn('actions', 'backend.product.action')
                ->rawColumns(['actions'])
                ->make(true);
        }
        
        return view('backend.product.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        OwnLibrary::validateAccess($this->moduleId,2);
        $data = array();
        $data['categorys'] = Category::where('status','=',1)->get();
        $data['brands'] = Brand::where('status','=',1)->get();
        return view('backend.product.create', $data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        OwnLibrary::validateAccess($this->moduleId, 2);
        $rules = [
            "name" => "required|min:2|max:500",
            "category_id" => "integer",
            "sub_category_id" => "integer",
            "brand_id" => "integer",
            "model_number" => "max:150",
            'price' => 'required|numeric',
            //'discount_amount' => 'numeric',
            //"quantity" => "integer",
            "product_type" => "required|min:2|max:30",
            "product_description" => "required|min:2|max:5000",
            "return_policy" => "max:5000",
            "pro_meta" => "max:500",
            "pro_mt_description" => "max:200",
            "video_url" => "max:500",
            "featureproduct" => "required|min:2|max:10",
            "status" => "required|integer|min:1|max:4",
            "feature_image" => "required",
        ];

        if($request->discount_amount){
            $rules["discount_amount"] = "numeric";
        }
        if($request->quantity){
            $rules["quantity"] = "integer";
        }

        $message = [
            "name.required" => "The Name is required.",
            "name.max" => "The Name may not be greater than 500 characters.",
            "name.min" => "The Name may not be lass than 2 characters.",

            "category_id.integer" => "The category should be integer number.",

            "sub_category_id.integer" => "The sub category should be integer number.",

            "brand_id.integer" => "The brand should be integer number.",

            "model_number.max" => "The model number may not be greater than 150 characters.",

            "price.required" => "The price is required.",
            "price.numeric" => "The price should be numeric number.",

            "discount_amount.numeric" => "Discount price should be numeric number.",

            "quantity.integer" => "The quantity should be integer number.",
            "quantity.max" => "The quantity may not be greater than 11.",

            "product_type.required" => "The product type is required.",
            "product_type.max" => "The product type may not be greater than 30 characters.",
            "product_type.min" => "The product type may not be lass than 2 characters.",

            "product_description.required" => "Product description is required.",
            "product_description.max" => "Product description may not be greater than 5000 characters.",
            "product_description.min" => "Product description may not be lass than 2 characters.",

            "return_policy.max" => "The return policy may not be greater than 1000 characters.",

            "pro_meta.max" => "The meta may not be greater than 500 characters.",

            "pro_mt_description.max" => "The meta description may not be greater than 2000 characters.",

            "video_url.max" => "The video url not be greater than 500 characters.",

            "featureproduct.required" => "Feature Product is required.",
            "featureproduct.max" => "Feature Product may not be greater than 10 characters.",
            "featureproduct.min" => "Feature Product may not be lass than 2 characters.",

            "status.required" => "Status is required.",
            "status.max" => "The Status not be greater than 11.",
            "status.min" => "The Status not be lass than 1.",
        ];
        $validation = Validator::make($request->all(), $rules, $message);

        if ($validation->fails()) {
            return redirect()->back()->withInput()->withErrors($validation);
        } else {
            $success = false;
            $target = new Product();

            $target->name                       = $request->name;
            $target->slug                       = Str::slug($request->name).'-'.rand(1,9999);
            $target->category_id                = $request->category_id;
            $target->sub_category_id            = $request->sub_category_id;
            $target->brand_id                   = $request->brand_id;
            $target->product_type               = $request->product_type;
            $target->price                      = $request->price;
            $target->discount_amount                      = $request->discount_amount;
            $target->model_number               = $request->model_number;
            $target->product_description        = $request->product_description;
            $target->return_policy              = $request->return_policy;

            $target->pro_meta                   = $request->pro_meta;
            $target->pro_mt_description         = $request->pro_mt_description;

            $target->video_url                  = $request->video_url;
            $target->featureproduct             = $request->featureproduct;
            $target->status                     = $request->status;

            $feature_image = $request->file('feature_image');
            if ($feature_image) {
                $target->feature_image = OwnLibrary::uploadImage($feature_image,'product-feature-image');
            }
            $galler_images_array = array();
            if (!empty($request->galler_images) AND count($request->galler_images) > 0) {
                for ($i = 0; count($request->galler_images) > $i; $i++) {
                    if (!empty($request->galler_images[$i])) {
                        $file = $request->galler_images[$i];
                        $destinationPath = public_path() . '/upload/product-galler-images/';
                        $galler_image = uniqid() . $file->getClientOriginalName();
                        $uploadSuccess = $file->move($destinationPath, $galler_image);
                        $galler_images_array[] = $galler_image;
                    }
                }
                $target->galler_images = json_encode($galler_images_array);
            }
            $attached_file = $request->file('attached_file');
            if ($attached_file) {
                $target->attached_file = OwnLibrary::uploadImage($attached_file,'product-attached-file');
            }
            if($target->save()){
                #product store

                session()->flash('success','Product Created');
                return redirect()->route('product.index', $target->id);
            }else{
                session()->flash('error','Product Not Created');
                return redirect()->back()->withInput();
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $data['product'] = Product::find($id);
        return view('backend.product.details', $data);

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        OwnLibrary::validateAccess($this->moduleId,3);
        //$product = Product::find($id);

        $data = array();
        $data['categorys'] = Category::where('status','=',1)->get();
        $data['sub_categories'] = Category::where('status','=',1)->where('parent_id','=',$product->category_id)->get();
        $data['brands'] = Brand::where('status','=',1)->get();

        return view('backend.product.edit', $data, compact('product'));

    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $product_info = Product::find($product->id);
        OwnLibrary::validateAccess($this->moduleId, 2);
        $rules = [
            "name" => "required|min:2|max:500",
            "category_id" => "integer",
            "sub_category_id" => "integer",
            "brand_id" => "integer",
            "model_number" => "max:150",
            'price' => 'required|numeric',
            //'discount_amount' => 'numeric',
            //"quantity" => "integer",
            "product_type" => "required|min:2|max:30",
            "product_description" => "required|min:2|max:5000",
            "return_policy" => "max:5000",
            "pro_meta" => "max:500",
            "pro_mt_description" => "max:200",
            "video_url" => "max:500",
            "featureproduct" => "required|min:2|max:10",
            "status" => "required|integer|min:1|max:4",
        ];

        if($request->discount_amount){
            $rules["discount_amount"] = "numeric";
        }
        if($request->quantity){
            $rules["quantity"] = "integer";
        }
        if(!$product_info->feature_image){
            $rules["feature_image"] = "required";
        }

        $message = [
            "name.required" => "The Name is required.",
            "name.max" => "The Name may not be greater than 500 characters.",
            "name.min" => "The Name may not be lass than 2 characters.",

            "category_id.integer" => "The category should be integer number.",

            "sub_category_id.integer" => "The sub category should be integer number.",

            "brand_id.integer" => "The brand should be integer number.",

            "model_number.max" => "The model number may not be greater than 150 characters.",

            "price.required" => "The price is required.",
            "price.numeric" => "The price should be numeric number.",

            "discount_amount.numeric" => "Discount price should be numeric number.",

            "quantity.integer" => "The quantity should be integer number.",
            "quantity.max" => "The quantity may not be greater than 11.",

            "product_type.required" => "The product type is required.",
            "product_type.max" => "The product type may not be greater than 30 characters.",
            "product_type.min" => "The product type may not be lass than 2 characters.",

            "product_description.required" => "Product description is required.",
            "product_description.max" => "Product description may not be greater than 5000 characters.",
            "product_description.min" => "Product description may not be lass than 2 characters.",

            "return_policy.max" => "The return policy may not be greater than 1000 characters.",

            "pro_meta.max" => "The meta may not be greater than 500 characters.",

            "pro_mt_description.max" => "The meta description may not be greater than 2000 characters.",

            "video_url.max" => "The video url not be greater than 500 characters.",

            "featureproduct.required" => "Feature Product is required.",
            "featureproduct.max" => "Feature Product may not be greater than 10 characters.",
            "featureproduct.min" => "Feature Product may not be lass than 2 characters.",

            "status.required" => "Status is required.",
            "status.max" => "The Status not be greater than 11.",
            "status.min" => "The Status not be lass than 1.",
        ];
        $validation = Validator::make($request->all(), $rules, $message);

        if ($validation->fails()) {
            return redirect()->back()->withInput()->withErrors($validation);
        } else {
            $success = false;

            $product->name                       = $request->name;
            $product->slug                       = Str::slug($request->name).'-'.rand(1,9999);
            $product->category_id                = $request->category_id;
            $product->sub_category_id            = $request->sub_category_id;
            $product->brand_id                   = $request->brand_id;
            $product->product_type               = $request->product_type;
            $product->price                      = $request->price;
            $product->discount_amount            = $request->discount_amount;
            $product->model_number               = $request->model_number;
            $product->product_description        = $request->product_description;
            $product->return_policy              = $request->return_policy;

            $product->pro_meta                   = $request->pro_meta;
            $product->pro_mt_description         = $request->pro_mt_description;

            $product->video_url                  = $request->video_url;
            $product->featureproduct             = $request->featureproduct;
            $product->status                     = $request->status;

            $feature_image = $request->file('feature_image');
            if ($feature_image) {
                if (!empty($product->feature_image)){
                    @unlink($product->feature_image);
                }
                $product->feature_image = OwnLibrary::uploadImage($feature_image,'product-feature-image');
            }
            $galler_images_array = array();
            if (!empty($request->galler_images) AND count($request->galler_images) > 0) {
                $decoded_value = json_decode($product->galler_images);
                if($decoded_value){
                    foreach ($decoded_value as $dk => $dv){
                        if (!empty($dv)){
                            @unlink(public_path() . '/upload/product-galler-images/'.$dv);
                        }
                    }
                }
                for ($i = 0; count($request->galler_images) > $i; $i++) {
                    if (!empty($request->galler_images[$i])) {
                        $file = $request->galler_images[$i];
                        $destinationPath = public_path() . '/upload/product-galler-images/';
                        $galler_image = uniqid() . $file->getClientOriginalName();
                        $uploadSuccess = $file->move($destinationPath, $galler_image);
                        $galler_images_array[] = $galler_image;
                    }
                }
                $product->galler_images = json_encode($galler_images_array);
            }
            $attached_file = $request->file('attached_file');
            if ($attached_file) {
                if (!empty($product->attached_file)){
                    @unlink($product->attached_file);
                }
                $product->attached_file = OwnLibrary::uploadImage($attached_file,'product-attached-file');
            }
            if($product->save()){
                session()->flash('success','Product updated successfully');
                return redirect()->route('product.index');
            }else{
                session()->flash('error','Product not updated');
                return redirect()->back()->withInput();
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        OwnLibrary::validateAccess($this->moduleId, 4);
        if ($product->delete()) {
            session()->flash("success", "Product Deleted");
            return redirect()->back();
        } else {
            session()->flash("error", "Product Not Deleted");
            return redirect()->back();
        }
    }

    function getSubCagetories(Request $request){
        $category_id   = $request->category_id;
        $subcategoreis = Category::where('status','=',1)->where('parent_id','=',$category_id)->whereNotNull('parent_id')->get();
        $dimoson_array = array();
        
        foreach ($subcategoreis as $key => $value) {
            if($value->parent_id){
                $dimoson_array[$value->parent->name][] = $value;
            }else{
                $dimoson_array[$value->name][] = $value;
            }
        }

        $html          = '<option selected disabled>Select One</option>';
        if($dimoson_array){
            foreach($dimoson_array as $ks => $vs){
                foreach($vs as $k => $v){
                    if($v->parent_id){
                        $cat = "(".$v->ks.")";
                        $html .='<option value="'.$v->id.'">'.$v->name.' ('.$ks.') '.'</option>';
                    }else{
                        $html .='<option value="'.$v->id.'">'.$v->name.'</option>';
                    }
                    
                }
            }
        }
        return $html;
    }
    function imageShow($type, $id){

            if($type==1){
                $product = Product::find($id);
                if($product){
                    return response()->file($product->feature_image);
                }else{
                    dd("Product does not exist.");
                }
            }
            elseif($type==2){
                $image = 'upload/product-galler-images/'.$id;
                return response()->file($image);
            }
        if($type==3){
            $product = Product::find($id);
            if($product){
                return \Response::download($product->attached_file);
                //return response()->file($product->attached_file);
            }else{
                dd("File does not exist.");
            }
        }


    }
}
