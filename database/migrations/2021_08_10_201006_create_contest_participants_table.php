<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContestParticipantsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contest_participants', function (Blueprint $table) {
            $table->id();
            $table->boolean('participant_type')->comment('0 = user, 1 = guest');
            $table->unsignedBigInteger('participant_id')->comment('user or guest id');
            $table->unsignedBigInteger('contest_id');
            $table->unsignedBigInteger('correct_answer')->default(0);
            $table->unsignedBigInteger('earn')->default(0);
            $table->boolean('get_coin')->default(0)->comment('0 = coin not get, 1 = coin get');
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
        Schema::dropIfExists('contest_participants');
    }
}
