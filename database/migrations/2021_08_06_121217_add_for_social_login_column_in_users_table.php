<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class AddForSocialLoginColumnInUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('provider')->after('lastLoginTime')->nullable();
            $table->string('provider_id')->after('provider')->nullable();
            $table->decimal('total_coin',14,2)->after('provider_id')->default(0);
            $table->decimal('current_coin',14,2)->after('total_coin')->default(0);
            $table->decimal('withdraw',14,2)->after('current_coin')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('provider', 'provider_id');
        });
    }
}
