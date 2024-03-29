<?php

namespace App\Http\Controllers;

use App\Models\Player;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Intervention\Image\Facades\Image;
use Yajra\DataTables\Facades\DataTables;

class PlayerController extends Controller
{
    public function index(Request $request)
    {
        if($request->ajax()){
            $name = $request->name;

            $players = Player::orderBy('name');

            if (!empty($name)){
                $players = $players->where("name","LIKE","%$name%");
            }


            return DataTables::of($players)
                ->addIndexColumn()
                ->addColumn('actions', 'backend.player.action')
                ->rawColumns(['actions'])
                ->make(true);
        }

        return view('backend.player.index');
    }


    public function create()
    {
        return view('backend.player.create');
    }


    public function store(Request $request)
    {
        $rules = [
            'name' => 'required',
            'image' => 'required|image'
        ];

        $message = [];

        $validation = Validator::make($request->all(),$rules,$message);

        if ($validation->fails()){
            return redirect()->back()
                ->withInput()
                ->withErrors($validation);
        }else{
            $player = new Player();
            $player->name = $request->name;
            $image = $request->file('image');

            if ($image) {
                $image_name = Str::random(10);
                $ext = strtolower($image->getClientOriginalExtension());
                $image_full_name = $image_name . '.' . $ext;
                $upload_path = 'upload/player/'.date('ymd').'/';
                $image_url = $upload_path . $image_full_name;
                $image->move($upload_path, $image_full_name);
                $player->image = $image_url;
                Image::make($image_url)->resize(200,200)->save($image_url,70,$ext);
            }

            if ($player->save()){
                session()->flash("success","Player Added");
                return redirect()->route("players.index");
            }else{
                session()->flash("error","Player Not Added");
                return redirect()->back()->withInput();
            }
        }
    }

    public function show(Player $player){
        if($player && $player->image){

            $name = $player->name.'.jpeg';
            $image = Image::make(asset($player->image))->resize(200, 200);  
            $image->text($player->name, 100, 195, function($font) {  
              $font->file(public_path('frontend/fonts/text-fonts/Galano-Grotesque-Medium.otf'));
              $font->size(20);  
              $font->color('#ff0500');  
              $font->align('center');  
              $font->valign('bottom');  
              $font->angle(0);  
          });  
            $image = Image::make($image)->encode('jpeg');

            $headers = [
                'Content-Type' => 'image/jpeg',
                'Content-Disposition' => 'attachment; filename='. $name,
            ];
            return response()->stream(function() use ($image) {
                echo $image;
            }, 200, $headers);

        }else{
            echo "<h1 style='text-align: center;'>No image for download</h1>";
        }
    }

    public function edit(Player $player)
    {
        return view('backend.player.edit',compact('player'));
    }


    public function update(Request $request, Player $player)
    {
        $rules = [
            'name' => 'required',
            'image' => 'image'
        ];

        $message = [];

        $validation = Validator::make($request->all(),$rules,$message);

        if ($validation->fails()){
            return redirect()->back()
                ->withInput()
                ->withErrors($validation);
        }else{
            $player->name = $request->name;
            $image = $request->file('image');

            if ($image) {
                if ($player->image){
                    @unlink($player->image);
                }
                $image_name = Str::random(10);
                $ext = strtolower($image->getClientOriginalExtension());
                $image_full_name = $image_name . '.' . $ext;
                $upload_path = 'upload/player/'.date('ymd').'/';
                $image_url = $upload_path . $image_full_name;
                $image->move($upload_path, $image_full_name);
                $player->image = $image_url;
                Image::make($image_url)->resize(200,200)->save($image_url,70,$ext);
            }

            if ($player->save()){
                session()->flash("success","Player Updated");
                return redirect()->route("players.index");
            }else{
                session()->flash("error","Player Not Updated");
                return redirect()->back()->withInput();
            }
        }
    }

    public function destroy(Player $player)
    {
        if ($player->delete()){
            session()->flash('success','Player Deleted');
            return redirect()->back();
        }else{
            session()->flash('error','Player Deleted');
            return redirect()->back();
        }
    }

    public function search(Request $request){
        $search = $request->search;
        $players = Player::select('id','name','image');
            if($search)
                $players->where('name', 'like', '%' . $search . '%');

        $players = $players->orderBy('name')->get();
        return view('backend.player.search',compact("players"));
    }
}
