<?php

namespace App\Http\Controllers;

use App\CustomClass\OwnLibrary;
use App\Models\ContestPlayer;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

use Cart;
//use Intervention\Image\Facades\Image;

class ContestPlayerController extends Controller
{
    public function addPlayerToCart(Request $request){

        $rules = [
            "player_name" => "required|max:100",
//            "location" => "required|max:100",
            "played_on" =>  "required",
            "versus" => "required|max:100",
            "score" =>  "required",
        ];

        $message = [];

        $validation = Validator::make($request->all(), $rules, $message);
        if ($validation->fails()){
            return response()->json([
                'status' => 1,
                'errors' => $validation->getMessageBag(),
                'data' => ''
            ], 200);
        }

//        $image = $request->file('player_image');
//
//            if ($image) {
//                $image_name = Str::random(20).date('ymd');
//                $ext = strtolower($image->getClientOriginalExtension());
//                $image_full_name = $image_name . '.' . $ext;
//                $upload_path = 'upload/player-pic/';
//                $image_url = $upload_path . $image_full_name;
//                $image->move($upload_path, $image_full_name);
//                Image::make($image_url)->resize(70,70)->save($image_url,70,'jpg');
//            }

        Cart::add([
            'id' => $request->player_id,
            'name' => $request->player_name,
            'qty' => 1,
            'price' => 0,
            'weight' => 0,
            'options' => [
//                'location' => $request->location,
                'played_on' => $request->played_on,
                'versus' => $request->versus,
                'score' => $request->score,
                'player_image' => $request->player_image,
            ],
            'taxRate' => 0,
        ]);

        return view('backend.contest.player-list');
    }

    public function removeCart(Request $request){
        $getCart = Cart::get($request->rowId);
        @unlink($getCart->options['player_image']);
        Cart::remove($request->rowId);
        return view('backend.contest.player-list');
    }

    public function store(Request $request){
        $rules = [
            "player_name" => "required|max:100",
//            "location" => "required|max:100",
            "played_on" =>  "required",
            "versus" => "required|max:100",
            "score" =>  "required",
            "player_image" =>  "required",
        ];

        $message = [];

        $validation = Validator::make($request->all(), $rules, $message);

        if ($validation->fails()) {
            return redirect()->back()->withInput()->withErrors($validation);
        }

        $contestPlayer = new ContestPlayer();
        $contestPlayer->contest_id = $request->contest_id;
        $contestPlayer->player_id = $request->player_id;
        $contestPlayer->player_name = $request->player_name;
        $contestPlayer->player_image = $request->player_image;
//        $contestPlayer->location = $request->location;
        $contestPlayer->played_on = date('Y-m-d h:i a',strtotime($request->played_on));
        $contestPlayer->versus = $request->versus;
        $contestPlayer->score = $request->score;

        if ( $contestPlayer->save()){
            session()->flash('success','Contest Player Added');
        }else{
            session()->flash('error','Contest player not added');
        }
        return redirect()->back();
    }

    public function destroy(ContestPlayer $contestPlayer){
        if ($contestPlayer->player_image){
            @unlink($contestPlayer->player_image);
        }
        if ($contestPlayer->delete()){
            session()->flash('success','Contest Player Deleted');
        }else{
            session()->flash('error','Contest player not deleted');
        }
        return redirect()->back();
    }
}
