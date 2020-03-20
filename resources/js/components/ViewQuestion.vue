<template>
<div class="container">
   <div class="main">
       <!-- question body -->
       <div class="row">
           <div class="col que" >
            <span class="q" v-html="questions.questions.question" ></span>
           </div>
        </div>
        <!-- tags used in question -->
        <div class="row maintag">
            <div v-for="tag in questions.tags" v-bind:key="tag.id" style="margin-bottom: 5px;">
                <div class="col tag2">
                   <router-link :to="{ name: 'viewtag', params: { id: tag.id }}"> <span class="tag">{{ tag.name }}</span></router-link>
                </div>
            </div>
        </div>
        <!-- link to share and edit -->
        <div class="row mainlink">
            <div class="col">
                <p class="links"><span @click="share = true">share </span>&nbsp; <router-link :to="{ name: 'editquestionuser', params: { id: questions.questions.id }}"><span class="editq"> edit</span></router-link></p>
            </div>
        </div>
        <div class="row">
            <div class="ml-auto mr-3 user">
                <div>
                <p><span class="date">asked {{questions.questions.created_at}} </span></p>
                <p><img  class="perimg" src="/images/permanent.png" >  &nbsp;{{questions.questions.user.name}}</p>
                </div>
            </div>
        </div>
        <div v-if="answer_exists" class="row">
            <h4 class=" answer-no">{{no_of_answers}} Answers</h4>
        </div>
    <!-- main div end -->
    </div>
    <!-- display answers -->
    <div v-if="answer_exists">
            <div v-for="answer in answers" v-bind:key="answer.id" style="margin-bottom: 5px;">
            <div class="container">
                <div class="main">
                    <!-- question body -->
                    <div class="row">
                        <div class="col que">
                            <span class="q" v-html="answer.answer" ></span>
                        </div>
                    </div>
                       
                    
                        <!-- link to share and edit -->
                    <!-- <div class="row mainlink">
                        <div class="col">
                            <p class="links">share &nbsp; edit</p>
                        </div>
                    </div> -->
                    <div class="row">
                        <div class="ml-auto mr-3 cmntuser">
                           
                            <p><span class="date">answered {{answer.created_at}}</span></p>
                            <p><img  class="perimg" src="/images/permanent.png" >  &nbsp;{{answer.user.name}}</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <!-- display answers ends here -->
    </div>
   <!-- post your answer -->
    <div>
    <h4>Your Answer</h4>
    <div class="alert alert-danger" v-if="has_error">
            <p>Please write your answer.Do not leave blank</p>
        </div>
    <!-- form to post answer -->
    <form autocomplete="off" @submit.prevent="register" method="post">
        <!-- div containing editor -->
        <div class="editor">
        <editor
            api-key="t9ucqkavy0b9j3bvmo9g7nnloxmxy5b6ybzsyv8ywmq2wlrn"
            
            :init="{
                
                height: 300,
                menubar: false,
                plugins: [
                'advlist autolink lists link image charmap print preview anchor',
                'searchreplace visualblocks code fullscreen',
                'insertdatetime media table paste code help wordcount',
                'advcode','image code','codesample','link','quickbars'
                ],
                images_upload_url: 'postAcceptor.php',
                images_upload_handler: function (blobInfo, success, failure) {
            setTimeout(function () {
            /* no matter what you upload, we will turn it into TinyMCE logo :)*/
            success('http://moxiecode.cachefly.net/tinymce/v9/images/logo.png');
            }, 2000);
        },
                toolbar:
                'bold italic   |  link  blockquote image codesample| numlist bullist | undo redo '
            }"
            
            class="edit" id="edit" v-model="edit" 
            >
        </editor>
         <!-- div containing editor ends here -->
        </div>
        <!-- button to submit answer -->
         <button type="submit" class="btn btn-primary submit">Post your Answer</button>
         <!-- form ends -->
    </form>
    <!-- post your answer div ends here -->
    </div>
    <!-- Browse more or post your question -->
    <div class="row maintag last">
    <p class="ask">Browse other questions tagged</p>
    <div v-for="tag in questions.tags" v-bind:key="tag.id" style="margin-bottom: 5px;">
                <div class="col tag2">
                    <router-link :to="{ name: 'viewtag', params: { id: tag.id }}"><span class="tag">{{ tag.name }}</span></router-link>
                </div>
            </div>
            <p class="ask">or <router-link :to="{ name: 'askquestion'}"> ask your own question </router-link>.</p>
    <!-- Browse more or post your question ends here -->
    </div>
     <sharemodal v-if="share" @close="share= false"></sharemodal>
</div>
</template>

<script>
import Editor from '@tinymce/tinymce-vue'
import answer from '../components/Answer'
import sharemodal from '../components/sharemodal.vue'

  export default {
    data() {
      return {
        has_error: false,
        questions: null,
        answers: null,
        no_of_answers: null,
        answer_exists: null,
        edit: '',
        share:false
       
      }
    },
    components:{
        'editor': Editor,
        answer,
        sharemodal
    },
    mounted() {
      this.getQuestions(),
      this.getAnswers(),
      this.view()
    },
    methods: {
        
      getQuestions() {
                this.$http({
                url: `viewquestion/`+this.$route.params.id,
                method: 'GET'
                })
                    .then((res) => {
                    this.questions = res.data.questions
                    }, () => {
                    this.has_error = true
                    })
      },
      register(){
                
                var app = this
                if(app.edit == ''){
                    this.has_error = true;
                }
                this.$http({
                     url: `addanswer`,
                    method: 'POST',
                    data: {
                        user_id: sessionStorage.id,
                        question_id:this.$route.params.id,
                        answer: app.edit,
                       
                      
                    }, 
                    success: function () {
                       console.log("hii");
                       
                    },
                    error: function (resp) {
                        app.error = true;
                        app.errors = resp.response.data.errors;
                          console.log("hii2");
                    },
                    redirect: null
                      
                });          
                  this.getAnswers();   
            },
      getAnswers() {
                    this.$http({
                    url: `answers/`+this.$route.params.id,
                    method: 'GET'
                    })
                        .then((res) => {
                        this.answers = res.data.answers,
                        this.no_of_answers=res.data.count,
                        this.answer_exists=res.data.value
                        }, () => {
                        this.has_error = true
                        })
                },
                 view() {
        this.$http({
          url: `views`,
          method: 'POST',
          data: {
                question_id: this.$route.params.id,
               
              
            }, 
            success: function () {
                
                
            },
            error: function (resp) {
                app.error = true;
                app.errors = resp.response.data.errors;
            },
            redirect: null
        });
     
      }
    }
   
}
    
</script>
<style scoped>
.main{
    border-bottom: 1px solid #D6D9DC;
    margin-left: 3%;
}
.q >>> blockquote {
    background-color: #FBF2D4 ;
    border-left: #FBEB8E solid 3px;
   
}
.q >>> blockquote p {
   padding: 8px;
   
}
.q >>> pre {
    background-color: #DCDEE0 ;
    max-width: 700px;
    max-height: 650px;
    overflow: scroll;
      padding: 10px !important;
      margin-top: 2%;
      
    
    
 
}
.answer-no{
    margin-left: -2%;
}
.que{
    font-size: 18px;
}
.tag{
   margin:4px;
    background:#E1ECF5;
    padding:0px 4px;
  
    border-radius: 3px;
  
    align-items: center;
    color: #3F78A0;
    font-size: 15px;
}
.user{
    margin:4px;
    background:#E1ECF5;
    padding:5px;
    min-width: 200px;
    max-height: 100px;
    border-radius: 3px;
  
    align-items: center;
    color: #3F78A0;
    font-size: 15px;
}
.cmntuser{
    margin:4px;
   
    padding:5px;
    min-width: 200px;
    max-height: 100px;
    border-radius: 3px;
  
    align-items: center;
    color: #3F78A0;
    font-size: 15px;
}
.user,.cmntuser p{
    margin-bottom: 4px !important;
}
.tag2{
  padding: 0 !important;
}
.links{
    color: #6B6F73;
    cursor: pointer;
}
.maintag{
    margin-left: 0.1%;
}
.mainlink{
    margin-top: 2%;
}
h4{
    padding: 20px;
}
.last{
    padding-bottom: 100px;
     margin-left: 2%;
}
.editor{
    padding: 20px;
}
.submit{
    margin-left: 2%;
}
.ask{
    font-size: 18px;
}
.date{
    color: #848D96;
}
.perimg{
    height: 25px;
    width: 25px;
}
.editq{
    color: #6B6F73;
}



</style>