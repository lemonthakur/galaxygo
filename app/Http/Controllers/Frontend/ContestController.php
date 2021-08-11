<?php

namespace App\Http\Controllers\Frontend;

use App\CustomClass\OwnLibrary;
use App\Http\Controllers\Controller;
use App\Models\Contest;
use App\Models\ContestParticipant;
use App\Models\ParticipantAnswer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;


class ContestController extends Controller
{
    public function entries()
    {
        //        Today Contest
        $contest = Contest::
        with(
            'contestPlayers:id,contest_id,player_name,player_image,location,played_on,versus,score,answer',
            'contestPlayers.participant:id,contest_player_id,participant_answer,is_correct,participant_id',
        )->select('id', 'name', 'expaire_time', 'is_final_answer')
        ->whereDate('name', date('Y-m-d'))->first();

        //        Current time as a unix time
        $now = strtotime(date('Y-m-d h:i a'));
        return view('frontend.entries', compact('contest', 'now'));
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
                $contestParticipant = new ContestParticipant();
                $contestParticipant->participant_type = $user['type'];
                $contestParticipant->participant_id = $user['id'];
                $contestParticipant->contest_id = $contestId;
                $contestParticipant->save();
                $isUpdate = false;
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
}
