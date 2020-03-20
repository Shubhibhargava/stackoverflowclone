<?php

namespace App\Http\Controllers;
use App\Answer;
use App\Question;
use Illuminate\Http\Request;

class AnswerController extends Controller
{
    //
    public function store(Request $request)
    {
        // $q=Tag::where('id','>','10')
        // ->delete();
    
       
        // $v = Validator::make($request->all(), [
        //     'title' => 'required|min:8',
        //     'question'  => 'required',
        //     'tags'=> 'required'
        // ]);
        // if ($v->fails())
        // {
        //     return response()->json([
        //         'status' => 'error',
        //         'errors' => $v->errors()
        //     ], 422);
        // }
        $ans = new Answer;
        $ans->user_id = $request->user_id;
        $ans->question_id = $request->question_id;
        $ans->answer = $request->answer;
        $ans->save();

        $id= $request->question_id;
        $que = Question::find($id);
        $ans_count=$que["answer_count"]+1;
        
        if($que) {
            
            $que->answer_count = $ans_count;
            $que->save();
        }
        return response()->json(['status' => 'success'], 200);
    }
    public function answers(Request $request, $id)
    {
       
        $ans = Answer::with('user')->where('question_id',$id)->get()->toArray();
       $count =count($ans);
       $val=true;
     
        if(empty($ans)){
            $val=false;
        }
           
        return response()->json(
            [
                'count' => $count,
                'value' => $val,
                'status' => 'success',
                'answers' => $ans
            ], 200);
    }
    public function updateanswer(Request $request,$id)
    {
     
       
        $des=$request->answer;
       
        $tags = Answer::where('id', $id)
        ->update(['answer' => $des]);;
       
        return response()->json(
            [
                'status' => 'success',
            ], 200);
    }
    public function deleteanswer($id){
        
        $users = Answer::where('id', $id)->delete();
       
        return response()->json(
            [
                'status' => 'success',
            ], 200);
    }
    public function openanswer($id)
    {
       
        $ans = Answer::where('id',$id)->get()->toArray();
      
       
     
        
        return response()->json(
            [
                
                'status' => 'success',
                'answers' => $ans
            ], 200);
    }

}
