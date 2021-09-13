<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ContestParticipant extends Model
{
    public function participentAnswers(){
        return $this->hasMany(ParticipantAnswer::class,'contest_participant_id');
    }
}
