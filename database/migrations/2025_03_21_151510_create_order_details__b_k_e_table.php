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
    // Schema::create('order_details_BKE', function (Blueprint $table) {
    //     $table->integer('order_detail_id', 11)->autoIncrement()->nullable(false);
    //     $table->integer('order_id')->nullable(false);
    //     $table->integer('product_id')->nullable(false);
    //     $table->dateTime('updated_at')->nullable();
    //     $table->dateTime('created_at')->nullable();

    //     // Khóa ngoại
    //     $table->foreign('order_id')->references('order_id')->on('orders_BKE')->onDelete('cascade');
    //     $table->foreign('product_id')->references('product_id')->on('products_BKE')->onDelete('cascade');
    // });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_details__b_k_e');
    }
};
