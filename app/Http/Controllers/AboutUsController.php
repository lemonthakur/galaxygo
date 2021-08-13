<?php

namespace App\Http\Controllers;

use App\CustomClass\OwnLibrary;
use App\Models\AboutUs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class AboutUsController extends Controller
{
    public function edit(){
        $aboutUs = AboutUs::find(1);
        if (empty($aboutUs)){
            $aboutUs = new AboutUs();
        }
        return view('backend.about-us.edit',compact('aboutUs'));
    }

    public function update(Request $request){
        $rules = [
            'image' => 'image',
            'title' => 'required|max:50',
            'description' => 'required',
            'button_text' => 'required|max:30',
            'button_url' => 'required|max:255',
            'video_url' => 'max:255',
        ];

        $message = [];

        $validation = Validator::make($request->all(),$rules,$message);

        if ($validation->fails()){
            return redirect()->back()
                ->withInput()
                ->withErrors($validation);
        }

        $about = AboutUs::find(1);

        if (empty($about)){
            $about = new AboutUs();
        }

        $about->title = $request->title;
        $about->description = $request->description;
        $about->button_text = $request->button_text;
        $about->button_url = $request->button_url;
        $about->video_url = $request->video_url ?? '';

        if ($request->hasFile('image')){
            if (!empty($about->image)){
                @unlink($about->image);
            }
            $image = OwnLibrary::uploadImage($request->image, "about-us");
            $about->image = $image;
        }

        if ($request->hasFile('video_banner')){
            if (!empty($about->video_banner)){
                @unlink($about->video_banner);
            }
            $videoBanner = OwnLibrary::uploadImage($request->video_banner, "about-us");
            $about->video_banner = $videoBanner;
        }

        if ($about->save()){
            session()->flash("success","Data Updated");
            return redirect()->route("about-us.edit");
        }else{
            session()->flash("error","Data Not Updated");
            return redirect()->back()->withInput();
        }
    }
}
