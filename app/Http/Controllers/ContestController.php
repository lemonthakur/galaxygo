<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

use App\Models\Contest;

class ContestController extends Controller
{
    public function index(Request $request){
        if($request->ajax()){
            // $name = $request->name;

            $contests = Contest::orderBy('name','desc');

            // if (!empty($name)){
            //     $users = $users->where("name","LIKE","%$name%");
            // }


            return DataTables::of($contests)
                ->addIndexColumn()
                ->addColumn('actions', 'backend.contest.action')
                ->rawColumns(['actions'])
            ->make(true);
        }
        return view('backend.contest.index');
    }

    public function create(){
        return view('backend.contest.create');
    }

    public function store(Request $request){
        $rules = [
            "name" => "required|unique:contests,name",
            "expaire_time" => "required"
        ];

        $message = [
            "expaire_time.required" => "Count Down Timer is required",
        ];

        $validation = Validator::make($request->all(), $rules, $message);

        if ($validation->fails()) {
            return redirect()->back()->withInput()->withErrors($validation);
        } 
            $contest = new Contest();

            $contest->name        = $request->name;
            $contest->expaire_time = $request->name.' '.$request->expaire_time;

            if ($contest->save()) {
                session()->flash("success", "Data successfully created");
                return redirect()->route("contest.index");
            } else {
                session()->flash("error", "Data not created");
                return redirect()->back();
            }
    }
}
