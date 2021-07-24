<?php

namespace App\Http\Controllers;

use App\Models\ContestPlayer;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;

use Cart;

class ContestPlayerController extends Controller
{
    public function addPlayerToCart(Request $request){

        $rules = [
            "player_name" => "required|max:100",
            "location" => "required|max:100",
            "versus" => "required|max:100",
            "score" =>  "required",
            "player_image" =>  "required|image"
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

        $image = $request->file('player_image');

            if ($image) {
                $image_name = Str::random(20).date('ymd');
                $ext = strtolower($image->getClientOriginalExtension());
                $image_full_name = $image_name . '.' . $ext;
                $upload_path = 'upload/player-pic/';
                $image_url = $upload_path . $image_full_name;
                $image->move($upload_path, $image_full_name);
            }

        Cart::add([
            'id' => rand(0,1000),
            'name' => $request->player_name,
            'qty' => 1,
            'price' => 0,
            'weight' => 0,
            'options' => [
                'location' => $request->location,
                'versus' => $request->versus,
                'score' => $request->score,
                'player_image' => $image_url ?? '',
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
            "location" => "required|max:100",
            "versus" => "required|max:100",
            "score" =>  "required",
            "player_image" =>  "required|image"
        ];

        $message = [];

        $validation = Validator::make($request->all(), $rules, $message);

        if ($validation->fails()) {
            return redirect()->back()->withInput()->withErrors($validation);
        }

        $contestPlayer = new ContestPlayer();
        $contestPlayer->contest_id = $request->contest_id;
        $contestPlayer->player_name = $request->player_name;

        $image = $request->file('player_image');

        if ($image) {
            $image_name = Str::random(20);
            $ext = strtolower($image->getClientOriginalExtension());
            $image_full_name = $image_name . '.' . $ext;
            $upload_path = 'upload/player-pic/';
            $image_url = $upload_path . $image_full_name;
            $image->move($upload_path, $image_full_name);
            $contestPlayer->player_image = $image_url;
        }

        $contestPlayer->location = $request->location;
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
            session()->flash('success','Contest Player Delated');
        }else{
            session()->flash('error','Contest player not delated');
        }
        return redirect()->back();
    }
}