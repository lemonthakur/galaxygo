<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

namespace App\CustomClass;

use App\Models\Contest;
use App\Models\ContestParticipant;
use App\Models\GuestUser;
use App\Models\ParticipantAnswer;
use App\Models\WinCoin;
use Illuminate\Support\Facades\Auth;
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
//        $winCoin = WinCoin::select('win')->orderBy('win')->limit(1)->get();
        $win = ContestParticipant::where('participant_type', '=', $user['type'])
            ->where('participant_id', '=', $user['id'])
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
            $winCoin = WinCoin::select('coin')->where('win','=',$win)->first();
            if (!empty($winCoin->coin)){
                return $winCoin->coin;
            }else{
                return 0;
            }
    }
}
