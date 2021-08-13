<?php

namespace App\Http\Controllers;

use App\CustomClass\OwnLibrary;
use App\Models\AboutUs;
use App\Models\OtherPages;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class OtherPagesController extends Controller
{
    public function edit(){
        $otherPage = OtherPages::find(1);
        if (empty($otherPage)){
            $otherPage = new OtherPages();
        }
        return view('backend.other-page.edit',compact('otherPage'));
    }

    public function update(Request $request){
        $rules = [
            'privacy_policy' => 'required',
            'terms_condition' => 'required',
            'rules' => 'required',
        ];

        $message = [
            'terms_condition.required' => 'Terms & Conditions field is required'
        ];

        $validation = Validator::make($request->all(),$rules,$message);

        if ($validation->fails()){
            return redirect()->back()
                ->withInput()
                ->withErrors($validation);
        }

        $otherPage = OtherPages::find(1);

        if (empty($otherPage)){
            $otherPage = new OtherPages();
        }

        $otherPage->privacy_policy = $request->privacy_policy;
        $otherPage->terms_condition = $request->terms_condition;
        $otherPage->rules = $request->rules;


        if ($otherPage->save()){
            session()->flash("success","Data Updated");
            return redirect()->route("other-page.edit");
        }else{
            session()->flash("error","Data Not Updated");
            return redirect()->back()->withInput();
        }
    }
}
