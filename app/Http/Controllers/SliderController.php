<?php

namespace App\Http\Controllers;

use App\CustomClass\OwnLibrary;
use App\Models\Slider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

class SliderController extends Controller
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
        $sliders = Slider::with('createdBy','updatedBy')->orderBy("order_serial")->paginate(10);
        return view('backend.slider.index',compact('sliders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        OwnLibrary::validateAccess($this->moduleId,2);
        return view('backend.slider.create');
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
            'slider_name' => 'required|mimes:jpeg,jpg,png|max:1024',
            "title_black" => "required|min:2|max:500",
            "title_color" => "required|min:2|max:500",
            'order_serial' => "required|integer|min:1|max:11",
        ];

        $message = [
            "title_black.required" => "Title Black Part is required.",
            "title_color.required" => "Title Color Part is required.",
            "order_serial.required" => "The Serial no is required.",
            "slider_name.required" => "The Slider is required.",
        ];

        $validation = Validator::make($request->all(), $rules, $message);

        if ($validation->fails()) {
            return redirect()->back()->withInput()->withErrors($validation);
        } else {

            $slider = new Slider();

            $slider->title_black    = $request->title_black;
            $slider->title_color    = $request->title_color;
            $slider->description    = $request->description;
            $slider->button_label   = $request->button_label;
            $slider->link           = $request->link;
            $slider->order_serial   = $request->order_serial;
            $slider->status         = $request->status;

            $image = $request->file('slider_name');
            if ($image) {
                $slider->slider_name = OwnLibrary::uploadImage($image,'slider-image');
            }

            $serialNo = $request->order_serial;
            if ($serialNo != '') {
                $slider->order_serial = $serialNo;
            }else{
                $serialNo = Slider::max('order_serial');
                $slider->order_serial = $serialNo;
            }

            if ($slider->save()) {
                session()->flash("success", "Data successfully created");
                return redirect()->route("slider.index");
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
    public function edit(Slider $slider)
    {
        OwnLibrary::validateAccess($this->moduleId, 3);
        return view("backend.slider.edit",compact('slider'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Tag  $tag
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Slider $slider)
    {
        OwnLibrary::validateAccess($this->moduleId, 3);
        $rules = [
            //'slider_name' => 'required|mimes:jpeg,jpg,png|max:1024',
            "title_black" => "required|min:2|max:500",
            "title_color" => "required|min:2|max:500",
            'order_serial' => "required|integer|min:1|max:11",
        ];

        if(!$slider->slider_name){
            $rules["slider_name"] = 'required|mimes:jpeg,jpg,png|max:1024';
        }

        $message = [
            "title_black.required" => "Title Black Part is required.",
            "title_color.required" => "Title Color Part is required.",
            "order_serial.required" => "The Serial no is required.",
            "slider_name.required" => "The Slider is required.",
        ];

        $validation = Validator::make($request->all(), $rules, $message);

        if ($validation->fails()) {
            return redirect()->back()
                ->withInput()
                ->withErrors($validation);
        } else {

            $slider->title_black    = $request->title_black;
            $slider->title_color    = $request->title_color;
            $slider->description    = $request->description;
            $slider->button_label   = $request->button_label;
            $slider->link           = $request->link;
            $slider->order_serial   = $request->order_serial;
            $slider->status         = $request->status;

            $image = $request->file('slider_name');
            if ($image) {
                if (!empty($slider->slider_name)){
                    @unlink($slider->slider_name);
                }
                $slider->slider_name = OwnLibrary::uploadImage($image,'slider-image');
            }

            $serialNo = $request->order_serial;
            if ($serialNo != '') {
                $slider->order_serial = $serialNo;
            }else{
                $serialNo = Slider::max('order_serial');
                $slider->order_serial = $serialNo;
            }

            if ($slider->save()) {
                session()->flash("success", "Slider Updated");
                return redirect()->route("slider.index");
            } else {
                session()->flash("error", "Slider Not Updated");
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
    public function destroy(Slider $slider)
    {
        OwnLibrary::validateAccess($this->moduleId, 4);

        if (!empty($slider->slider_name)){
            @unlink($slider->slider_name);
        }
        if ($slider->delete()) {
            session()->flash("success", "Slider Deleted");
            return redirect()->back();
        } else {
            session()->flash("error", "Slider Not Deleted");
            return redirect()->back();
        }
    }

    function imageShow($id){

        $slider = Slider::find($id);
        if($slider){
            return response()->file($slider->slider_name);
        }else{
            dd("Slider does not exist.");
        }
    }
}
