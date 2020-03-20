<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });
// Route::prefix('auth')->group(function () {
//     Route::post('register', 'AuthController@register');
//     Route::post('login', 'AuthController@login');
//     Route::get('refresh', 'AuthController@refresh');
//     Route::group(['middleware' => 'auth:api'], function(){
//       //  Route::get('user', 'AuthController@user');
//         // Route::post('logout', 'AuthController@logout');
//     });
//      Route::get('user', 'UserController@index');
//      Route::get('logout', 'AuthController@logout');
// });

// Route::group(['middleware' => 'auth:api'], function(){
//     // Users
//     Route::get('users', 'UserController@index')->middleware('isAdmin');
//     Route::get('users/{id}', 'UserController@show')->middleware('isAdminOrSelf');
// });



Route::prefix('auth')->group(function () {
  Route::post('register', 'AuthController@register');
  Route::post('login', 'AuthController@login');
  Route::get('refresh', 'AuthController@refresh');
  Route::group(['middleware' => 'auth:api'], function(){
      Route::get('user', 'AuthController@user');
      Route::post('logout', 'AuthController@logout');
  });
});


Route::group(['middleware' => 'auth:api'], function(){
  // Users
  Route::get('users', 'UserController@index')->middleware('isAdmin');
  Route::post('updateuser/{id}', 'UserController@updateuser')->middleware('isAdmin');
  Route::post('deleteuser/{id}', 'UserController@deleteuser')->middleware('isAdmin');

  Route::post('updatetag/{id}', 'TagController@updatetag')->middleware('isAdmin');
  Route::post('deletetag/{id}', 'TagController@deletetag')->middleware('isAdmin');

  
  Route::post('deletequestion/{id}', 'QuestionController@deletequestion')->middleware('isAdmin');

  Route::post('updateanswer/{id}', 'AnswerController@updateanswer')->middleware('isAdmin');
  Route::post('deleteanswer/{id}', 'AnswerController@deleteanswer')->middleware('isAdmin');
  Route::get('users/{id}', 'UserController@show')->middleware('isAdminOrSelf');
});

Route::post('addquestion', 'QuestionController@store');
Route::get('questions', 'QuestionController@index');
Route::get('questionlist', 'QuestionController@questionlist');
Route::post('findtag', 'TagController@show');
Route::post('search', 'TagController@search');
Route::get('viewquestion/{id}', 'QuestionController@viewquestion');
Route::get('userquestion/{id}', 'QuestionController@userquestion');
Route::post('addanswer', 'AnswerController@store');
Route::get('answers/{id}', 'AnswerController@answers');
Route::get('openanswer/{id}', 'AnswerController@openanswer');


Route::post('views', 'QuestionController@view');

Route::get('tags', 'TagController@index');
Route::get('viewtag/{id}', 'TagController@viewtag');
Route::post('addnewtag', 'TagController@addnewtag');
Route::get('alluser', 'UserController@alluser');
Route::get('userlist', 'UserController@userlist');
Route::post('updatequestion/{id}', 'QuestionController@updatequestion');

