<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWithdrawRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('withdraw_requests', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->string('paypal_email');
            $table->decimal('amount',14,2);
            $table->decimal('coin_amount',14,2);
            $table->decimal('before_withdraw',14,2);
            $table->decimal('after_withdraw',14,2);
            $table->integer('status')->default(0)->comment('0 = pending, 1 = confirm, 2 = cancel');
            $table->unsignedBigInteger('coin_history_id');
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
        Schema::dropIfExists('withdraw_requests');
    }
}
