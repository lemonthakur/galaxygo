<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateContestWinsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('contest_wins', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger("contest_id");
            $table->unsignedBigInteger("win_coin_id");
            $table->unsignedBigInteger("win");
            $table->unsignedBigInteger("out_of");
            $table->unsignedBigInteger("coin");
            $table->unsignedBigInteger('created_by');
            $table->unsignedBigInteger('updated_by');
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
        Schema::dropIfExists('contest_wins');
    }
}
