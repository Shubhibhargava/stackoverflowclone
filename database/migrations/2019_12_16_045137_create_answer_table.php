<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAnswerTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('answer', function (Blueprint $table) {
            $table->integerIncrements('id');
            $table->unsignedinteger('user_id');
            $table->unsignedinteger('question_id');
            $table->integer('parent_answer_id')->nullable();
            $table->text('answer');
            $table->timestamps();



            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('question_id')->references('id')->on('question');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('answer');
    }
}
