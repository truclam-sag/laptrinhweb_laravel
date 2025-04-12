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
        // Schema::create('orders_BKE', function (Blueprint $table) {
        //     $table->integer('order_id', 11)->autoIncrement()->nullable(false);
        //     $table->integer('user_id')->nullable(false);
        //     $table->dateTime('updated_at')->nullable();
        //     $table->dateTime('created_at')->nullable();
    
        //     // Khóa ngoại
        //     $table->foreign('user_id')->references('user_id')->on('users_BKE')->onDelete('cascade');
        // });
    }
    

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders__b_k_e');
    }
};
