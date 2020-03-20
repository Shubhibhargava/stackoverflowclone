<?php

namespace App\Http\Controllers;
use App\Question;
use App\Tag;
use App\Answer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Carbon\Carbon;

class QuestionController extends Controller
{
    public function index()
    {
       $tag=[];
       $question=[];
        $que = Question::get()->toArray();
       
        $count=count($que);
       for($i=0;$i<$count;$i++){
        
            $str_arr = explode (",", $que[$i]["tags"]);  
            $tag[$i]=Tag::whereIn('id', $str_arr)->get()->toArray();

            $d=$que[$i]['created_at'];
            $date = Carbon::parse($d);
            $now = Carbon::now();
        
            $diff = $date->diffInDays($now);
       

            $question[$i]=['questions'=>$que[$i],'tags'=>$tag[$i], 'date' =>$diff];
        }
        
        return response()->json(
            [
               
                'status' => 'success',
                'questions' => $question
            ], 200);
    }
    public function store(Request $request)
    {
        // $q=Tag::where('id','>','10')
        // ->delete();
    
       $arr2=[];
       $arr=$request->tags;
       $count=count($arr);
       

       for($i=0;$i<$count;$i++){
           $j=$arr[$i];
           
           $tag = Tag::where('name',$j)->get()->toArray();
           
           if(empty($tag)){
           
            $tag2 = new Tag;
            $tag2->name = $j;
            $tag2->description = "new tag";
            $tag2->save();
            $tag = Tag::where('name',$j)->get()->toArray();
            $arr2[$i]=$tag[0]["id"];
              
            }
          
           else{
            $arr2[$i]=$tag[0]["id"];
            
           }

       }
       $arr3 = implode(', ', $arr2);
      
        $v = Validator::make($request->all(), [
            'title' => 'required',
            'question'  => 'required',
            'tags'=> 'required'
        ]);
        if ($v->fails())
        {
            return response()->json([
                'status' => 'error',
                'errors' => $v->errors()
            ], 422);
        }
        $que = new Question;
        $que->user_id = $request->user_id;
        $que->title = $request->title;
        $que->question = $request->question;
        $que->tags = $arr3;
        $que->save();
        return response()->json(['status' => 'success'], 200);
    }


    public function viewquestion(Request $request, $id)
    {
       $tag=[];
       $question=[];
        $que = Question::with('user')->where('id',$id)->get()->toArray();
       
       
        

        $d=$que[0]['created_at'];
        $date = Carbon::parse($d);
        $now = Carbon::now();
    
        $diff = $date->diffInDays($now);

            $str_arr = explode (",", $que[0]["tags"]);  
            $tag=Tag::whereIn('id', $str_arr)->get()->toArray();
          
            $question=['questions'=>$que[0],'tags'=>$tag, 'date' => $diff];
          
        
    
       
        return response()->json(
            [
                
                'status' => 'success',
                'questions' => $question
            ], 200);
    }
    public function view(Request $request){
        $id= $request->question_id;
        $que = Question::find($id);
        $view=$que["views"]+1;
        
        if($que) {
            
            $que->views = $view;
            $que->save();
        }
        return response()->json(
            [
                
                'status' => 'success'
            ], 200);

    }
    public function userquestion($id)
    {
       $tag=[];
       $question=[];
       $tagname=[];
        $que = Question::where('user_id',$id)->get()->toArray();
       
        $count=count($que);
       for($i=0;$i<$count;$i++){
        
            $str_arr = explode (",", $que[$i]["tags"]);  
            $tag[$i]=Tag::whereIn('id', $str_arr)->get()->toArray();
          
            $question[$i]=['questions'=>$que[$i],'tags'=>$tag[$i]];
        }

      
        return response()->json(
            [
               
                'status' => 'success',
                'questions' => $question
            ], 200);
    }
    public function updatequestion(Request $request,$id)
    {
     
        $name=$request->title;
        $des=$request->question;
       
        $tags = Question::where('id', $id)
        ->update(['title' => $name],['question' => $des]);;
       
        return response()->json(
            [
                'status' => 'success',
            ], 200);
    }
    public function deletequestion($id){
        
        $users = Answer::where('question_id', $id)->delete();
        $que=Question::where('id', $id)->delete();
       
        return response()->json(
            [
                'status' => 'success',
            ], 200);
    }
    public function questionlist()
    {
       $tag=[];
       $question=[];
       $tag_list= [];
        $que = Question::get()->toArray();
       
        $count=count($que);
       for($i=0;$i<$count;$i++){
        
            $str_arr = explode (",", $que[$i]["tags"]);  
            
            $tag[$i]=Tag::select('name')->whereIn('id', $str_arr)->get()->toArray();

            $d=$que[$i]['created_at'];
            $date = Carbon::parse($d);
            $now = Carbon::now();
        
            $diff = $date->diffInDays($now);
            for($j=0;$j<count($tag[$i]);$j++){
            $tag_list[$j] = $tag[$i][$j]["name"];
            }
            $tag_l=(implode(" ",$tag_list));

            $question[$i]=['questions'=>$que[$i],'tags'=>$tag_l, 'date' =>$diff];
        }
        
        return response()->json(
            [
               
                'status' => 'success',
                'questions' => $question
            ], 200);
    }
}
