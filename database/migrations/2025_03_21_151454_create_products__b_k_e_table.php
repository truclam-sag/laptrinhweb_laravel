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
    // Schema::create('products_BKE', function (Blueprint $table) {
    //     $table->integer('product_id', 11)->autoIncrement()->nullable(false);
    //     $table->string('product_name', 255)->nullable(false);
    //     $table->double('product_price')->nullable(false);
    //     $table->text('product_description')->nullable(false);
    //     $table->dateTime('updated_at')->nullable();
    //     $table->dateTime('created_at')->nullable();
    // });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products__b_k_e');
    }
};
