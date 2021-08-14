<?php

namespace App\Http\Controllers;

use App\Models\CoinHistory;
use App\Models\User;
use App\Models\WithdrawRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\Facades\DataTables;

class WithdrawRequestController extends Controller
{
    public function index(Request $request){

        if($request->ajax()){
            $status = $request->status;
            $email = $request->email;

            $withdraws = WithdrawRequest::with('user:id,name,email')->orderBy('status');

            if (!empty($email)){
                $withdraws = $withdraws->where("paypal_email","Like","%$email%");
            }

            if (!empty($status)){
                $withdraws = $withdraws->where("status","=","$status");
            }


            return DataTables::of($withdraws)
                ->addIndexColumn()
                ->addColumn('actions', 'backend.withdraw.action')
                ->rawColumns(['actions'])
                ->make(true);
        }

        return view('backend.withdraw.index');
    }

    public function update(Request $request){
        if (!$request->status == 1 || !$request->status == 2){
            session()->flash('error','Invalid operation');
            return redirect()->back();
        }
        $withdraw = WithdrawRequest::find($request->id);

        if (empty($withdraw)){
            session()->flash('error','Request not found');
            return redirect()->back();
        }

        if (!$withdraw->status == 0){
            session()->flash('error','You can\'t change status any longer');
            return redirect()->back();
        }

        DB::beginTransaction();

        try {
            $success = false;

            if ($request->status == 1){
                $withdraw->status = 1;

                if ($withdraw->save()){
                    $success = true;
                }
            }else{
                $withdraw->status = 2;
                $withdraw->save();

                //Deduct Coin from user table
                $user = User::find($withdraw->user_id);
                $user->current_coin = $user->current_coin + $withdraw->coin_amount;
                $user->withdraw = $user->withdraw -  $withdraw->coin_amount;
                $user->save();

                //Remove from coin history
               $res = CoinHistory::where('id',$withdraw->coin_history_id)->delete();
                $success = true;
            }

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

        if ($success){
            session()->flash('success','Process request successfully');
        }else{
            session()->flash('error','Unable to process your request.');
        }
        return redirect()->back();
    }
}
