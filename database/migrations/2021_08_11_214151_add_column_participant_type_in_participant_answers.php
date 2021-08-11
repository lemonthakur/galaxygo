<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddColumnParticipantTypeInParticipantAnswers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('participant_answers', function (Blueprint $table) {
            $table->boolean('participant_type')->comment('0 = user, 1 = guest')->after('contest_player_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('participant_answers', function (Blueprint $table) {
            $table->dropColumn('participant_type');
        });
    }
}
