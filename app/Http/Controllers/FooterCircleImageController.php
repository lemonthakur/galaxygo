<?php

namespace App\Http\Controllers;

use App\CustomClass\OwnLibrary;
use App\Models\FooterCircleImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class FooterCircleImageController extends Controller
{
    private $moduleId = 1;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        OwnLibrary::validateAccess($this->moduleId,1);
        $cir_images = FooterCircleImage::with('createdBy','updatedBy')->orderBy("order_serial")->get();
        return view('backend.footer-circle-image.index',compact('cir_images'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        OwnLibrary::validateAccess($this->moduleId,2);
        return view('backend.footer-circle-image.create');
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
            'image_name' => 'required|mimes:jpeg,jpg,png|max:1024',
            "title" => "required|min:2|max:500",
            'order_serial' => "required|integer|min:1|max:11",
        ];

        $message = [
            "title.required" => "Title Black part is required.",
            "order_serial.required" => "The serial no is required.",
            "image_name.required" => "The image is required.",
        ];

        $validation = Validator::make($request->all(), $rules, $message);

        if ($validation->fails()) {
            return redirect()->back()->withInput()->withErrors($validation);
        } else {

            $footer_circle = new FooterCircleImage();

            $footer_circle->title          = $request->title;
            $footer_circle->link           = $request->link;
            $footer_circle->order_serial   = $request->order_serial;
            $footer_circle->status         = $request->status;

            $image = $request->file('image_name');
            if ($image) {
                $footer_circle->image_name = OwnLibrary::uploadImage($image,'footer-circle-image');
            }

            $serialNo = $request->order_serial;
            if ($serialNo != '') {
                $footer_circle->order_serial = $serialNo;
            }else{
                $serialNo = FooterCircleImage::max('order_serial');
                $footer_circle->order_serial = $serialNo;
            }

            if ($footer_circle->save()) {
                session()->flash("success", "Data successfully created");
                return redirect()->route("footer-circle-image.index");
            } else {
                session()->flash("error", "Data not created");
                return redirect()->back()->withInput();
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Tag  $tag
     * @return \Illuminate\Http\Response
     */
    public function show(Brand $brand)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Tag  $tag
     * @return \Illuminate\Http\Response
     */
    public function edit(FooterCircleImage $footerCircleImage)
    {
        OwnLibrary::validateAccess($this->moduleId, 3);
        return view("backend.footer-circle-image.edit",compact('footerCircleImage'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Tag  $tag
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, FooterCircleImage $FooterCircleImage)
    {
        OwnLibrary::validateAccess($this->moduleId, 3);
        $rules = [
            //'image_name' => 'required|mimes:jpeg,jpg,png|max:1024',
            "title" => "required|min:2|max:500",
            'order_serial' => "required|integer|min:1|max:11",
        ];

        if(!$FooterCircleImage->image_name){
            $rules["slider_name"] = 'required|mimes:jpeg,jpg,png|max:1024';
        }

        $message = [
            "title.required" => "Title Black part is required.",
            "order_serial.required" => "The serial no is required.",
            "image_name.required" => "The image is required.",
        ];

        $validation = Validator::make($request->all(), $rules, $message);

        if ($validation->fails()) {
            return redirect()->back()
                ->withInput()
                ->withErrors($validation);
        } else {

            $FooterCircleImage->title          = $request->title;
            $FooterCircleImage->link           = $request->link;
            $FooterCircleImage->order_serial   = $request->order_serial;
            $FooterCircleImage->status         = $request->status;

            $image = $request->file('image_name');
            if ($image) {
                if (!empty($FooterCircleImage->image_name)){
                    @unlink($FooterCircleImage->image_name);
                }
                $FooterCircleImage->image_name = OwnLibrary::uploadImage($image,'footer-circle-image');
            }

            $serialNo = $request->order_serial;
            if ($serialNo != '') {
                $FooterCircleImage->order_serial = $serialNo;
            }else{
                $serialNo = FooterCircleImage::max('order_serial');
                $FooterCircleImage->order_serial = $serialNo;
            }

            if ($FooterCircleImage->save()) {
                session()->flash("success", "Footer Circle Image Updated");
                return redirect()->route("footer-circle-image.index");
            } else {
                session()->flash("error", "Footer Circle Image Not Updated");
                return redirect()->back()->withInput();
            }
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Tag  $tag
     * @return \Illuminate\Http\Response
     */
    public function destroy(FooterCircleImage $FooterCircleImage)
    {
        OwnLibrary::validateAccess($this->moduleId, 4);

        if (!empty($FooterCircleImage->image_name)){
            @unlink($FooterCircleImage->image_name);
        }
        if ($FooterCircleImage->delete()) {
            session()->flash("success", "Footer Circle Image Deleted");
            return redirect()->back();
        } else {
            session()->flash("error", "Footer Circle Image Not Deleted");
            return redirect()->back();
        }
    }

    function imageShow($id){

        $image = FooterCircleImage::find($id);
        if($image){
            return response()->file($image->image_name);
        }else{
            dd("Image does not exist.");
        }
    }
}
