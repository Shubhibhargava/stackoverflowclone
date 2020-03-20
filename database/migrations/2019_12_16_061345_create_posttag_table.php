<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePosttagTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('posttag', function (Blueprint $table) {
            $table->unsignedinteger('question_id');
            $table->unsignedinteger('tag_id');
            $table->timestamps();

            $table->foreign('question_id')->references('id')->on('question');
            $table->foreign('tag_id')->references('id')->on('tag');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('posttag');
    }
}
