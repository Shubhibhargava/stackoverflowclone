<?php

namespace App\Http\Controllers;
use App\Tag;
use App\Question;
use App\User;
use Illuminate\Http\Request;

class TagController extends Controller
{
    //
    public function index()
    {
       
        $tags = Tag::all();
       
        return response()->json(
            [
                'status' => 'success',
                'tags' => $tags->toArray()
            ], 200);
    }
    public function show(Request $request)
    {
        $searchq=$request["tags"];
       
        $tag = Tag::where('name','LIKE','%'.$searchq.'%')->orWhere('description','LIKE','%'.$searchq.'%')->paginate(6);
        
       
        return response()->json(
            [
                'status' => 'success',
                'tag' => $tag->toArray()
            ], 200);
    }
    public function viewtag(Request $request,$id)
    {
        $tag2=[];
       $question=[];
        $que = Question::with('user')->WHERE ('tags','LIKE','%'.$id.'%')->get()->toArray();
        $count=count($que);
        $tag=Tag::where('id', $id)->get()->toArray();
       

        for($i=0;$i<$count;$i++){
        
            $str_arr = explode (",", $que[$i]["tags"]);  
            $tag2[$i]=Tag::whereIn('id', $str_arr)->get()->toArray();
          
            $question[$i]=['questions'=>$que[$i],'tags'=>$tag2[$i]];
        }
        
        $tags=['questions'=>$question,'tags'=>$tag];

        return response()->json(
            [
                'count' => $count,
                'status' => 'success',
                'tags' => $tags
            ], 200);
    }
    public function updatetag(Request $request,$id)
    {
     
        $name=$request->name;
        $des=$request->description;
       
        $tags = Tag::where('id', $id)
        ->update(['name' => $name],['description' => $des]);;
       
        return response()->json(
            [
                'status' => 'success',
            ], 200);
    }
    public function deletetag($id){
        // $que=Question::where('user_id', $id)->delete();
        $users = Tag::where('id', $id)->delete();
        return response()->json(
            [
                'status' => 'success',
            ], 200);
    }
    public function searchtag(Request $request){
        $name=$request->tag;

        $tag =Tag :: where('name',$name)->get()->toArray();
        $id=$tag[0]['id'];
        $tag2=[];
       $question=[];
        $que = Question::with('user')->WHERE ('tags','LIKE','%'.$id.'%')->get()->toArray();
        $count=count($que);
        $tag=Tag::where('id', $id)->get()->toArray();
       

        for($i=0;$i<$count;$i++){
        
            $str_arr = explode (",", $que[$i]["tags"]);  
            $tag2[$i]=Tag::whereIn('id', $str_arr)->get()->toArray();
          
            $question[$i]=['questions'=>$que[$i],'tags'=>$tag2[$i]];
        }
        
        $tags=['questions'=>$question,'tags'=>$tag];

        return response()->json(
            [
                'count' => $count,
                'status' => 'success',
                'tags' => $tags
            ], 200);

    }
    public function addnewtag(Request $request)
    {
        $name=$request->name;
        $des=$request->description;
        $tag = Tag::where('name', $name)->get()->toArray();

        if($tag){
            return response()->json(
                [
                    'status' => 'Tag exists already',
                ], 200);
        }
        else{
        
       
        $tags =new Tag;
        $tags->name=$name;
        $tags->description=$des;
        $tags->save();
       
        return response()->json(
            [
                'status' => 'success',
            ], 200);
        }
    }
    public function search(Request $request){
        $name=$request->name;

        $tag =Tag :: where('name',$name)->get()->toArray();
        
       
        if($tag){
            $id=$tag[0]['id'];
        return response()->json(
            [
                'id' => $id,
                'status' => 'true',
                
            ], 200);
        }
        else{
            return response()->json(
                [
                    
                    'status' => 'unsuccessful',
                    
                ], 200);
        }

    }
}
          
        
