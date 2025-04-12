<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
{
    // Schema::create('users_BKE', function (Blueprint $table) {
    //     $table->integer('user_id', 11)->autoIncrement()->nullable(false);
    //     $table->string('user_name', 25)->nullable(false);
    //     $table->string('user_email', 55)->nullable(false);
    //     $table->string('user_pass', 255)->nullable(false);
    //     $table->dateTime('updated_at')->nullable();
    //     $table->dateTime('created_at')->nullable();
    // });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users__b_k_e');
    }
};
