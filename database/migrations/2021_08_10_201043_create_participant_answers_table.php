<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateParticipantAnswersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('participant_answers', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('contest_participant_id');
            $table->unsignedBigInteger('contest_id');
            $table->unsignedBigInteger('contest_player_id');
            $table->unsignedBigInteger('participant_id')->comment('user or guest id');
            $table->boolean('participant_answer')->comment('1 = under,2 = over');
            $table->integer('is_correct')->comment('0 = not check , 1 = no, 2 =yes');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('participant_answers');
    }
}
