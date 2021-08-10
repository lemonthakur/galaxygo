<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\WinCoin;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Yajra\DataTables\Facades\DataTables;

class WinCoinController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if($request->ajax()){

            $winCoin = WinCoin::orderBy('win','desc');

            return DataTables::of($winCoin)
                ->addIndexColumn()
                ->addColumn('actions', 'backend.win-coin.action')
                ->rawColumns(['actions'])
                ->make(true);
        }

        return view('backend.win-coin.index');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.win-coin.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $rules = [
            'win' => 'required|unique:win_coins,win|integer|min:0',
            'out_of' => 'required|integer|min:0',
            'coin' => 'required|integer|min:0',
        ];

        $message = [];

        $validation = Validator::make($request->all(),$rules,$message);

        if ($validation->fails()){
            return redirect()->back()
                ->withInput()
                ->withErrors($validation);
        }

        $winCoin = new WinCoin();
        $winCoin->win = $request->win;
        $winCoin->out_of = $request->out_of;
        $winCoin->coin = $request->coin;

        if ($winCoin->save()){
            session()->flash("success","Data Added Successfully");
            return redirect()->route("win-coin.index");
        }else{
            session()->flash("error","Data Not Added");
            return redirect()->back()->withInput();
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\WinCoin  $winCoin
     * @return \Illuminate\Http\Response
     */
    public function show(WinCoin $winCoin)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\WinCoin  $winCoin
     * @return \Illuminate\Http\Response
     */
    public function edit(WinCoin $winCoin)
    {
        return view('backend.win-coin.edit',compact('winCoin'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\WinCoin  $winCoin
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, WinCoin $winCoin)
    {
        $rules = [
            'win' => "required|integer|min:0|unique:win_coins,win," . $winCoin->id,
            'out_of' => 'required|integer|min:0',
            'coin' => 'required|integer|min:0',
        ];

        $message = [
            'win.unique' => 'Number of win has already been taken.'
        ];

        $validation = Validator::make($request->all(),$rules,$message);

        if ($validation->fails()){
            return redirect()->back()
                ->withInput()
                ->withErrors($validation);
        }

        $winCoin->win = $request->win;
        $winCoin->out_of = $request->out_of;
        $winCoin->coin = $request->coin;
        $winCoin->status = $request->status;

        if ($winCoin->save()){
            session()->flash("success","Data Update Successfully");
            return redirect()->route("win-coin.index");
        }else{
            session()->flash("error","Data Not Update");
            return redirect()->back()->withInput();
        }

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\WinCoin  $winCoin
     * @return \Illuminate\Http\Response
     */
    public function destroy(WinCoin $winCoin)
    {
        if ($winCoin->delete()){
            session()->flash('success','Data Delated');
        }else{
            session()->flash('error','Data not Delated');
        }
        return redirect()->back();
    }
}
