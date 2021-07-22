<?php

namespace App\Http\Controllers;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

use Cart;

use App\Models\Contest;
use App\Models\ContestPlayer;

class ContestController extends Controller
{
    public function index(Request $request){
        if($request->ajax()){
             $name = $request->name;

            $contests = Contest::orderBy('name','desc');
             if (!empty($name)){
                 $name = date('Y-m-d',strtotime($name));
                 $contests = $contests->whereDate("name","=","$name");
             }

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

        if (count(Cart::content()) == 0){
            session()->flash('error','Please, Add Player');
            return redirect()->back()->withInput();
        }
            $contest = new Contest();

            $contest->name        = date('Y-m-d',strtotime($request->name));
            $contest->expaire_time = date('Y-m-d',strtotime($request->name)).' '.$request->expaire_time;

            if ($contest->save()) {
                $contestId = $contest->id;

                foreach(Cart::content() as $row){
                    $contestPlayer = new ContestPlayer();
                    $contestPlayer->contest_id = $contestId;
                    $contestPlayer->player_name = $row->name;
                    $contestPlayer->player_image = $row->options['player_image'];
                    $contestPlayer->location = $row->options['location'];
                    $contestPlayer->versus = $row->options['versus'];
                    $contestPlayer->score = $row->options['score'];
                    $contestPlayer->save();
                }

                Cart::destroy();

                session()->flash("success", "Data successfully created");
                return redirect()->route("contest.index");
            } else {
                session()->flash("error", "Data not created");
                return redirect()->back();
            }
    }

    public function edit(Contest $contest)
    {
        return view('backend.contest.edit',compact('contest'));
    }

    public function update(Contest $contest,Request $request){
        $rules = [
            "name" => "required|unique:contests,name," . $contest->id,
            "expaire_time" => "required"
        ];

        $message = [
            "expaire_time.required" => "Count Down Timer is required",
        ];

        $validation = Validator::make($request->all(), $rules, $message);

        if ($validation->fails()) {
            return redirect()->back()->withInput()->withErrors($validation);
        }
        $contest->name        = date("Y-m-d", strtotime($request->name));
        $contest->expaire_time = date('Y-m-d',strtotime($request->name)).' '.$request->expaire_time;

        if ($contest->save()) {
            session()->flash("success", "Data successfully updated");
        } else {
            session()->flash("error", "Data not updated");
        }
        return redirect()->back();
    }

    public function destroy(Contest $contest)
    {
        if ($contest->delete()){
            session()->flash('success','Contest Delated');
        }else{
            session()->flash('error','Contest not Delated');
        }
        return redirect()->back();
    }
}
