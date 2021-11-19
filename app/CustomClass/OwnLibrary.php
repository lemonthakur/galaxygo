<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\CustomClass;

use App\Models\CoinHistory;
use App\Models\Contest;
use App\Models\ContestParticipant;
use App\Models\ContestWin;
use App\Models\GuestUser;
use App\Models\ParticipantAnswer;
use App\Models\User;
use App\Models\WinCoin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;

class OwnLibrary {

    //put your code here
    public static function numberformat($num = 0){
        return number_format($num, 2, '.', ',');
    }

    public static function printDate($date = '0000-00-00'){
        return date('F jS, Y', strtotime($date));
    }

    public static function printDateTime($dateTime = '0000-00-00 00:00:00'){
        return date('F jS, Y h:i A', strtotime($dateTime));
    }

    public static function validateAccess($moduleId = null, $activityId = null) {
        $haystack = Session::get('acl');

        $needle = array($moduleId => $activityId);

        if (!self::in_array_r($needle, $haystack)) {
            $url = route('admin.login.view');
            echo "<script> location.href='".$url."'; </script>";
            exit;
        }
    }

    public static function in_array_r($needle, $haystack) {

        $needleArr = array_keys($needle);
        $needleKey = $needleArr[0];
        $needleVal = $needle[$needleKey];

        foreach ($haystack as $key => $item) {
            if ($needleKey == $key) {
                foreach ($item as $activityItem) {
                    if ($needleVal == $activityItem) {
                        return true;
                    }
                }
            }
        }

        return false;
    }

    public static function paginationSerial($modelObject){
        return ($modelObject->currentpage()-1)* $modelObject->perpage() + 1;
    }

    public static function uploadImage($image,$folderName){
        $image_name = Str::random(20);
        $ext = strtolower($image->getClientOriginalExtension());
        $image_full_name = $image_name . '.' . $ext;
        $upload_path = 'upload/'.$folderName.'/';
        $image_url = $upload_path . $image_full_name;
        $image->move($upload_path, $image_full_name);
        return $image_url;
    }

     public static function getUserInfo(){
        $participantType = 1;
        $participantId = 0;
        if (Auth::check() && Auth::user()->role_id == 0){
            $participantType = 0;
            $participantId = auth()->id();
        }else{
            if (isset($_COOKIE['galaxy_guest']) &&  $_COOKIE['galaxy_guest'] != null){
                //            $mac = strtok(exec('getmac'), ' ');
                $mac = $_COOKIE['galaxy_guest'];
                if (!empty($mac)){
                    $guestUser = GuestUser::where('mac','=',$mac)->first();
                    if (empty($guestUser)){
                        $guestUser = new GuestUser();
                        $guestUser->mac = $mac;
                        $guestUser->save();
                    }
                    $participantId = $guestUser->id;
                }
            }
        }

        return array('type' => $participantType,'id' => $participantId);
    }

    public static function check_cart_qty(){
        if(\Cart::count() > 0){
            foreach(\Cart::content() as $row){
                $product = \App\Models\Product::find($row->id);
                if($row->qty > $product->remaining_qty)
                    \Cart::remove($row->rowId);
            }
        }
    }

    public static function entryWon(){
        $user = self::getUserInfo();
        $win = ContestParticipant::where('participant_type', '=', $user['type'])
            ->where('earn', '>', 0)
            ->count();
        return $win;
    }

    public static function winCoin($id){
        $contestId = $id;
        $user = self::getUserInfo();

        if ($user['id'] == 0){
            return 0;
        }
            $contest = Contest::
            with('userPLay',
                'contestPlayers:id,contest_id,player_name,player_image,played_on,versus,score,answer',
                'contestPlayers.participant:id,contest_player_id,participant_answer,is_correct,participant_id',
            )->select('id', 'name', 'time_end', 'is_final_answer')
                ->where('id',"=",$contestId)->first();

            if (empty($contest)){
                return 0;
            }

        $win = 0;

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
            $winCoin = ContestWin::select('coin')->where('contest_id',$contestId)->where('win','=',$win)->first();
            if (!empty($winCoin->coin)){
                return $winCoin->coin;
            }else{
                return 0;
            }
    }

    public static function claimCoin(){
        DB::beginTransaction();
        $win = 0;
        $coin = 0;
        try {
            $user = self::getUserInfo();

            $contestParticipants = ContestParticipant::select("contest_id")
                ->where('participant_type', '=', $user['type'])
                ->where('participant_id', '=', $user['id'])
                ->where('get_coin',0)
                ->get();

            if (!empty($contestParticipants) && count($contestParticipants) > 0){
                foreach ($contestParticipants as $participant){
                    $contestId = $participant->contest_id;
                    $contest = Contest::
                    with('userPLay',
                        'contestPlayers:id,contest_id,player_name,player_image,played_on,versus,score,answer',
                        'contestPlayers.participant:id,contest_player_id,participant_answer,is_correct,participant_id',
                    )->select('id', 'name', 'time_end', 'is_final_answer')
                        ->where('id',"=",$contestId)->first();


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
                }
            }

        } catch (ValidationException $e) {
            DB::rollback();
        } catch (\Exception $e) {
            DB::rollback();
        }
        DB::commit();
    }

}
