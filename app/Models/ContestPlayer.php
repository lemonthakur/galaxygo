<?php

namespace App\Models;

use App\CustomClass\OwnLibrary;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\Auth;

class ContestPlayer extends Model
{
    use SoftDeletes;

    public static function boot()
    {
        parent::boot();
        static::creating(function($post)
        {
            $post->created_by = Auth::id();
            $post->updated_by = Auth::id();
        });

        static::updating(function($post)
        {
            $post->updated_by = Auth::id();
        });
    }

    public function createdBy(){
        return $this->belongsTo(User::class,'created_by');
    }

    public function updatedBy(){
        return $this->belongsTo(User::class,'updated_by');
    }

    public function participant() {
        $user = OwnLibrary::getUserInfo();
        return $this->hasOne(ParticipantAnswer::class,'contest_player_id','id')
            ->where('participant_type', '=', $user['type'])
            ->where('participant_id', '=', $user['id']);
    }
}
