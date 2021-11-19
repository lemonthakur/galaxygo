<?php

namespace App\Http\Controllers;

use App\Models\ContestParticipant;
use App\Models\ContestWin;
use App\Models\WinCoin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

use App\Models\Contest;
use App\Models\ContestPlayer;
use Cart;
use DB;

class ContestController extends Controller
{
    public function index(Request $request){
        if ($request->ajax()) {
            $name = $request->name;

            $contests = Contest::orderBy('id', 'desc');
            if (!empty($name)) {
                $name = date('Y-m-d', strtotime($name));
                $contests = $contests->whereDate("name", "=", "$name");
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
        $winCoins = WinCoin::orderBy('out_of','desc')->where('status',1)->get();
        return view('backend.contest.create',compact('winCoins'));
    }

    public function store(Request $request){
        if ($request->name) {
            $request->merge([
                'name' => date('Y-m-d', strtotime($request->name)),
            ]);
        }

        $rules = [
            "name" => "required",
            "time_start" => "required",
            "win_coins" => "required",
            "contest_type" => "required",
            "is_paid" => "required",
        ];

        if ($request->is_paid == 2){
            $rules["amount"] = "required";
        }

        $message = [
            "name.required" => "Game Date is required",
            "time_start.required" => "Count Down Begin Time is required",
        ];

        $validation = Validator::make($request->all(), $rules, $message);

        if ($validation->fails()) {
            return redirect()->back()->withInput()->withErrors($validation);
        }

//        if (strtotime($request->time_start) > strtotime($request->time_end)){
//            session()->flash('error','Count down begin time con not larger than count down end time');
//            return redirect()->back()->withInput();
//        }

        if (count(Cart::content()) == 0) {
            session()->flash('error', 'Please, Add Player');
            return redirect()->back()->withInput();
        }
        DB::beginTransaction();
        try {
            $success = false;
            $contest = new Contest();

            $contest->name = $request->name;
            $contest->time_start =date('Y-m-d H:i', strtotime($request->time_start));
            $contest->contest_type = $request->contest_type;
            $contest->is_paid = $request->is_paid;
            $contest->amount = $request->is_paid == 2 ? $request->amount : 0;
//            $contest->time_end =date('Y-m-d H:i', strtotime($request->time_end));

            if ($contest->save()) {
                $contestId = $contest->id;

//                contest win conditions
                foreach ($request->win_coins as $win_coin){
                    $win = WinCoin::find($win_coin);
                    $contestWin = new ContestWin();
                    $contestWin->contest_id = $contestId;
                    $contestWin->win_coin_id = $win_coin;
                    $contestWin->win = $win->win;
                    $contestWin->out_of = $win->out_of;
                    $contestWin->coin = $win->coin;
                    $contestWin->save();
                }

                $time_end = date("Y-m-d H:i");

                foreach (Cart::content() as $row) {
                    $contestPlayer = new ContestPlayer();
                    $contestPlayer->contest_id = $contestId;
                    $contestPlayer->player_id = $row->id;
                    $contestPlayer->player_name = $row->name;
                    $contestPlayer->player_image = $row->options['player_image'];
                    $contestPlayer->played_on = date('Y-m-d H:i', strtotime($row->options['played_on']));
                    $contestPlayer->versus = $row->options['versus'];
                    $contestPlayer->score = $row->options['score'];
                    $contestPlayer->save();

                    if (strtotime($time_end) < strtotime($row->options['played_on'])){
                        $time_end = date('Y-m-d H:i', strtotime($row->options['played_on']));
                    }
                }

                $updateContest = Contest::find($contestId);
                $updateContest->time_end = $time_end;
                $updateContest->save();

                Cart::destroy();
            }

            $success = true;
        }catch(ValidationException $e) {
            DB::rollback();
            return redirect()->back()
                ->withErrors( $e->getErrors() )
                ->withInput();
        }catch(\Exception $e)
        {
            DB::rollback();
            throw $e;
        }

        DB::commit();

        if($success){
            session()->flash("success", "Data successfully created");
            return redirect()->route('contest.index');
        }else{
            session()->flash('error','Product Not Created');
            return redirect()->back()->withInput();
        }
    }

    public function edit(Contest $contest)
    {
        $winCoins = WinCoin::orderBy('out_of','desc')->where('status',1)->get();
        $contestWins = array_column(ContestWin::select('win_coin_id')->where('contest_id',$contest->id)->get()->toArray(),'win_coin_id');
        return view('backend.contest.edit', compact('contest','winCoins','contestWins'));
    }

    public function update(Contest $contest, Request $request)
    {

        if ($request->name) {
            $request->merge([
                'name' => date('Y-m-d', strtotime($request->name)),
            ]);
        }

        $rules = [
            "name" => "required",
            "time_start" => "required",
            "win_coins" => "required",
            "contest_type" => "required",
           "is_paid" => "required",
        ];

        if ($request->is_paid == 2){
            $rules["amount"] = "required";
        }

        $message = [
            "name.required" => "Game Date is required",
            "time_start.required" => "Count Down Begin Time is required",
//            "time_end.required" => "Count Down End Time is required",
        ];

        $validation = Validator::make($request->all(), $rules, $message);

        if ($validation->fails()) {
            return redirect()->back()->withInput()->withErrors($validation);
        }


        $contest->name = $request->name;
        $contest->time_start = date('Y-m-d H:i', strtotime($request->time_start));
        $contest->contest_type = $request->contest_type;
        $contest->is_paid = $request->is_paid;
        $contest->amount = $request->is_paid == 2 ? $request->amount : 0;
//        $contest->time_end = date('Y-m-d H:i', strtotime($request->time_end));

        if ($contest->save()) {

            ContestWin::where('contest_id', $contest->id)->delete();

            foreach ($request->win_coins as $win_coin){
                $win = WinCoin::find($win_coin);
                $contestWin = new ContestWin();
                $contestWin->contest_id = $contest->id;
                $contestWin->win_coin_id = $win_coin;
                $contestWin->win = $win->win;
                $contestWin->out_of = $win->out_of;
                $contestWin->coin = $win->coin;
                $contestWin->save();
            }

            session()->flash("success", "Data successfully updated");
        } else {
            session()->flash("error", "Data not updated");
        }
        return redirect()->back();
    }

    public function contestAnswer($id)
    {
        $contest = Contest::with('contestPlayers')->find($id);
        if (count($contest->contestPlayers) <= 0) {
            session()->flash('error', 'Please add some players');
            return redirect()->back();
        }
        return view('backend.contest.contest-answer', compact('contest'));
    }

    public function contestAnswerSubmit(Request $request)
    {
        $success = false;
        DB::beginTransaction();
        try {
            $contest = Contest::where('id', $request->contest_id)->update(['is_final_answer' => 1]);
            if ($contest) {
                for ($i = 0; $i < count($request->contest_player_id); $i++) {
                    $contestPlayer = ContestPlayer::find($request->contest_player_id[$i]);
                    $contestPlayer->final_score = $request->final_score[$i];
                    $contestPlayer->answer = $request->final_score[$i] < $contestPlayer->score ? 1 : 2;
                    $contestPlayer->save();
                }
            }
            $success = true;
        }catch(ValidationException $e) {
            DB::rollback();
            return redirect()->back()
                ->withErrors( $e->getErrors() )
                ->withInput();
        }catch(\Exception $e)
        {
            DB::rollback();
            throw $e;
        }

        DB::commit();

        if($success){
            session()->flash('success', 'Contest Answer Submitter');
            return redirect()->back();
        }else{
            session()->flash('error', 'Contest Answer Not Submitter');
            return redirect()->back()->withInput();
        }
    }

    public function destroy(Contest $contest)
    {
        $success = false;
        DB::beginTransaction();
        try {
            ContestPlayer::where("contest_id","=",$contest->id)->delete();
            ContestParticipant::where("contest_id","=",$contest->id)->delete();
            ContestWin::where("contest_id","=",$contest->id)->delete();
            $contest->delete();
            $success = true;
        }catch(ValidationException $e) {
            DB::rollback();
            return redirect()->back()
                ->withErrors( $e->getErrors() )
                ->withInput();
        }catch(\Exception $e) {
            DB::rollback();
            throw $e;
        }

        DB::commit();

        if($success){
            session()->flash('success', 'Contest Delated');
            return redirect()->back();
        }else{
            session()->flash('error', 'Contest not Delated');
            return redirect()->back()->withInput();
        }

        return redirect()->back();
    }
}
