<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContestPlayersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contest_players', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('contest_id');
            $table->string('player_name',100);
            $table->string('player_image',100)->nullable();
            $table->string('location',100);
            $table->string('versus',100);
            $table->float('score',10,2);
            $table->integer('answer')->default(0)->comment('0=no answer,1=under,2=over');
            $table->unsignedBigInteger('created_by');
            $table->unsignedBigInteger('updated_by');
            $table->boolean('status')->default(1);
            $table->softDeletes();
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
        Schema::dropIfExists('contest_players');
    }
}
