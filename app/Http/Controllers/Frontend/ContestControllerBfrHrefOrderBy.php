<?php

namespace App\Http\Controllers\Frontend;

use App\CustomClass\OwnLibrary;
use App\Http\Controllers\Controller;
use App\Models\CoinHistory;
use App\Models\Contest;
use App\Models\ContestParticipant;
use App\Models\ContestWin;
use App\Models\GuestUser;
use App\Models\ParticipantAnswer;
use App\Models\User;
use App\Models\WinCoin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;


class ContestController extends Controller
{
    public function entries()
    {
        //        Today Contest
        $contests = Contest::
        with('userPLay',
            'contestPlayers:id,contest_id,played_on,versus,score,final_score,answer,player_id',
            'contestPlayers.player:id,name,image',
            'contestPlayers.participant:id,contest_player_id,participant_answer,is_correct,participant_id',
        )->select('id', 'name','time_start', 'time_end', 'is_final_answer','contest_type',"is_paid","amount")
        ->where('time_start', '<',date('Y-m-d H:i'))
        ->where('time_end', '>',date('Y-m-d H:i'))
        ->get();

        $pendingContest = Contest::
        with('userPLay',
            'contestPlayers:id,contest_id,played_on,versus,score,final_score,answer,player_id',
            'contestPlayers.player:id,name,image',
            'contestPlayers.participant:id,contest_player_id,participant_answer,is_correct,participant_id',
        )->select('id', 'name','time_start', 'time_end', 'is_final_answer','contest_type','is_paid','amount')
        ->orderBy('name','desc')
        ->where('is_final_answer',0)
        ->where('time_end', '<',date('Y-m-d H:i:s'))
        ->get();

        $finalContests = Contest::
        with('userPLay',
            'contestPlayers:id,contest_id,played_on,versus,score,final_score,answer,player_id',
            'contestPlayers.player:id,name,image',
            'contestPlayers.participant:id,contest_player_id,participant_answer,is_correct,participant_id',
        )->select('id', 'name', 'time_end', 'is_final_answer','contest_type','is_paid','amount')
        ->orderBy('name','desc')
            ->where('is_final_answer',1)
            ->where('time_end', '<=',date('Y-m-d H:i:s'))
            ->limit(7)->get();

        //        Current time as a unix time
        $now = strtotime(date('Y-m-d h:i a'));

        //Total entry won
        $entryWon = OwnLibrary::entryWon();
        return view('frontend.entries', compact('contests', 'pendingContest','finalContests','now','entryWon'));
    }

    public function entriesStore(Request $request)
    {
        if (!$request->exists('players')) {
            session()->flash("error", "Please select fantasy players");
            return redirect()->route('entries');
        }

        $contestId = decrypt($request->contest_id);
        $isUpdate = true;

        DB::beginTransaction();

        try {

            $user = OwnLibrary::getUserInfo();

            $contestParticipant = ContestParticipant::where('participant_type', '=', $user['type'])
                ->where('participant_id', '=', $user['id'])
                ->where('contest_id', '=', $contestId)
                ->first();

            if (empty($contestParticipant)) {
                $contest = Contest::find($contestId);

                if ($contest->is_paid == 2 && auth()->check() && auth()->user()->current_coin < $contest->amount){
                    session()->flash("error", "This is a paid contest and you doesn't have enough coin to play.");
                    return redirect()->route('entries');
                }

                $contestParticipant = new ContestParticipant();
                $contestParticipant->participant_type = $user['type'];
                $contestParticipant->participant_id = $user['id'];
                $contestParticipant->contest_id = $contestId;
                $contestParticipant->save();
                $isUpdate = false;

                //Insert in coin history
                $coinHistory = new CoinHistory();
                $coinHistory->user_id =  $user['id'];
                $coinHistory->user_type =  $user['type'];
                $coinHistory->amount = $contest->amount;
                $coinHistory->transaction_type = 1;
                $coinHistory->earn_expense_type = 6;
                $coinHistory->save();

                //Deduct Coin from users
                if ($user['type'] == 0){
                    //Update user table
                    $users = User::find($user['id']);
                    $users->current_coin = $users->current_coin - $contest->amount;
                    $users->save();
                }else{
                    //update guest_user table
                    $guest = GuestUser::find($user['id']);
                    $guest->current_coin = $guest->current_coin - $contest->amount;
                    $guest->save();
                }
            }

            $contestParticipantId = $contestParticipant->id;

            foreach ($request->players as $key => $player) {
                $participantAnswer = ParticipantAnswer::where('contest_participant_id', '=', $contestParticipantId)
                    ->where('contest_id', '=', $contestId)
                    ->where('contest_player_id', '=', $key)
                    ->where('participant_id', '=', $user['id'])
                    ->first();

                if (empty($participantAnswer)) {
                    $participantAnswer = new ParticipantAnswer();
                    $participantAnswer->contest_participant_id = $contestParticipantId;
                    $participantAnswer->contest_id = $contestId;
                    $participantAnswer->contest_player_id = $key;
                    $participantAnswer->participant_id = $user['id'];
                    $participantAnswer->participant_type = $user['type'];
                    $participantAnswer->is_correct = 0;
                }
                $participantAnswer->participant_answer = $player;
                $participantAnswer->save();
            }
            $success = true;
        } catch (ValidationException $e) {
            DB::rollback();
            session()->flash("error", "Unable to insert data");
            return redirect()->route('entries')
                ->withErrors($e->getErrors())
                ->withInput();
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }
        DB::commit();

        if ($success) {
            if ($isUpdate) {
                Session::flash("success", "Data updated successfully");
            } else {
                Session::flash("success", "Data inserted successfully");
            }
        } else {
            Session::flash("error", "Unable to insert data");
        }
        return redirect()->route('entries');
    }

    public function claimCoin(Request $request){
        $contestId = decrypt($request->id);
        $user = OwnLibrary::getUserInfo();

        DB::beginTransaction();
        $success = false;
        $win = 0;
        $coin = 0;
        try {
            $contest = Contest::
            with('userPLay',
                'contestPlayers:id,contest_id,player_name,player_image,played_on,versus,score,answer',
                'contestPlayers.participant:id,contest_player_id,participant_answer,is_correct,participant_id',
            )->select('id', 'name', 'time_end', 'is_final_answer')
                ->where('id',"=",$contestId)->first();

            if (empty($contest)){
                Session::flash("error", "Invalid contest");
                return redirect()->route('entries');
            }

            if ($contest->userPLay->get_coin == 1){
                Session::flash("error", "You already claim coin");
                return redirect()->route('entries');
            }

            foreach($contest->contestPlayers as  $contestPlayer){
                //check number of correct and Update participant answer
                if (!empty($contestPlayer->participant->participant_answer)){
                    $participantAns = ParticipantAnswer::find($contestPlayer->participant->id);
                    if($contestPlayer->answer == $contestPlayer->participant->participant_answer){
                        $participantAns->is_correct = 2;
                        $win++;
                    }else{
                        $participantAns->is_correct = 1;
                    }
                    $participantAns->save();
                }
            }

            //Based on Win Coin earn
//            $winCoin = WinCoin::select('coin')->where('win','=',$win)->first();
            $winCoin = ContestWin::select('coin')->where('contest_id',$contestId)->where('win','=',$win)->first();
            $coin = $winCoin->coin ?? 0;

            //Update Coin Participant
            $contestParticipant = ContestParticipant::find($contest->userPLay->id);
            $contestParticipant->correct_answer = $win;
            $contestParticipant->earn = $coin;
            $contestParticipant->get_coin = 1;
            $contestParticipant->save();

            //Insert in coin history
            $coinHistory = new CoinHistory();
            $coinHistory->user_id = $user['id'];
            $coinHistory->user_type = $user['type'];
            $coinHistory->amount = $coin;
            $coinHistory->transaction_type = 0;
            $coinHistory->earn_expense_type = 2;
            $coinHistory->save();

            if ($user['type'] == 0){
                //Update user table
                $user = User::find(auth()->id());
                $user->total_coin = $user->total_coin + $coin;
                $user->current_coin = $user->current_coin + $coin;
                $user->save();
            }else{
                //update guest_user table
                $guest = GuestUser::find($user['id']);
                $guest->total_coin = $guest->total_coin + $coin;
                $guest->current_coin = $guest->current_coin + $coin;
                $guest->save();
            }

            $success = true;
        } catch (ValidationException $e) {
            DB::rollback();
            session()->flash("error", "Unable to insert data");
            return redirect()->route('entries')
                ->withErrors($e->getErrors())
                ->withInput();
        } catch (\Exception $e) {
            DB::rollback();
            throw $e;
        }
        DB::commit();

        if ($success) {
                Session::flash("success", "You answered $win correctly. Your earned coin is $coin");
        } else {
            Session::flash("error", "Unable claim coin");
        }
        return redirect()->route('entries');
    }

}
