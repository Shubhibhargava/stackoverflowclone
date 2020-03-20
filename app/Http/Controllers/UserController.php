<?php
namespace App\Http\Controllers;
use App\User;
use App\Question;
use App\Tag;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
class UserController extends Controller
{
    public function index()
    {
       
        $users = User::all();
       
        return response()->json(
            [
                'status' => 'success',
                'users' => $users->toArray()
            ], 200);
    }
    public function show(Request $request, $id)
    {
        $tag=[];
        $userinfo=[];
        $tagname=[];
        $k=[];
        $l;
        $user = User::where('id',$id)->get()->toArray();


        for($j=0;$j<count($user);$j++){

            $que = Question::where('user_id',$user[$j]['id'])->get()->toArray();
            $count=count($que);
            if($que){
            for($i=0;$i<$count;$i++){
            
                $str_arr = explode (",", $que[$i]["tags"]);  
                $tag[$i]=Tag::whereIn('id', $str_arr)->pluck('name')->toArray();
                $k[$i]=implode($tag[$i], ', ');
              
               
            }
            $tagname[$j]=$k;
            $l=implode(array_unique($tagname[$j]), ', ');
        }
        
        else{
            $l="no tags";
        }
        
        $userinfo[$j]=['users'=>$user[$j],'tags'=>$l];
            
        }
        

        return response()->json(
            [
                'status' => 'success',
                'user' => $userinfo
            ], 200);
    }

    public function alluser()
    {
       
        $tag=[];
        $userinfo=[];
        $tagname=[];
        $k=[];
        $l;
        $user=User::get()->toArray();
         
        
        
         for($j=0;$j<count($user);$j++){

            $que = Question::where('user_id',$user[$j]['id'])->get()->toArray();
            $count=count($que);
            if($que){
            for($i=0;$i<$count;$i++){
            
                $str_arr = explode (",", $que[$i]["tags"]);  
               
                $tag[$i]=Tag::whereIn('id', $str_arr)->pluck('name')->toArray();
                $k[$i]=($tag[$i]);
                $tagname[$j]=$k[$i];
              
               
            $l=implode(array_unique($tagname[$j]), ', ');
            
          
            $userinfo[$j]=['users'=>$user[$j],'tags'=>$l];
              
               
            }
        
            
        }
            
        }
        
 
         return response()->json(
             [
                
                 'status' => 'success',
                 'userinfo' => $userinfo
             ], 200);
       
        
    }
    public function userlist()
    {
       
        $tag=[];
        $userinfo=[];
        $tagname=[];
        $k=[];
        $l;
        $user=User::where('role','!=','2')->get()->toArray();
        
        
 
         return response()->json(
             [
                
                 'status' => 'success',
                 'userinfo' => $user
             ], 200);
       
        
    }
    public function updateuser(Request $request,$id)
    {
     
        $name=$request->name;
        $email=$request->email;
       
        $users = User::where('id', $id)
        ->update(['name' => $name],['email' => $email]);;
       
        return response()->json(
            [
                'status' => 'success',
            ], 200);
    }
    public function deleteuser($id){
        $que=Question::where('user_id', $id)->delete();
        $users = User::where('id', $id)->delete();
        return response()->json(
            [
                'status' => 'success',
            ], 200);
    }
}