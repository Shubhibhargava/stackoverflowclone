<template>
   <div class="main"> 
     <div class="card">
       <div class="row">
         <div class="col-md-12">
            <h1>Question Info</h1>
         </div>
       </div>
       
        <div class="row last">
         
         <div class="col-md-6">
           <p class="lab">Title :</p>
         </div>
       </div>
        <div class="row">
         
         <div class="col-md-12">
           <p class="des">{{questions.title}}</p>
         </div>
       </div>
        <div class="row last">
         
         <div class="col-md-6">
           <p class="lab">Question :</p>
         </div>
       </div>
        <div class="row">
         
         <div class="col-md-12">
            <span class="q des" v-html="questions.question" ></span>
         </div>
       </div>

        <div class="row last">
         
         <div class="col-md-6">
           <p class="label">Views : {{questions.views}}</p>
         </div>
         <div class="col-md-6">
           <p class="label">Answers : {{questions.answer_count}} </p>
         </div>
       </div>
        
        
       <div class="row btnrow">
        
          <div class="col">
           <router-link :to="{ name: 'answerList', params: { id: questions.id }}"><button class="btn btn-success" >Answers</button></router-link>&nbsp;
            <button class="btn btn-primary" @click="show = true">Edit</button>&nbsp;
            <button class="btn btn-danger" @click="show2 = true">Delete</button>&nbsp;
         </div>
        </div>

     </div>
     <editquestion v-if="show" @close="show = false;getQuestions()"></editquestion>
      <deletequestion v-if="show2" @close="show2 = false;deleteuser()"></deletequestion>
   </div>
</template>

<script>
import editquestion from '../components/EditQuestion.vue'
import deletequestion from '../components/DeleteQuestion.vue'
  export default {
    data() {
      return {
        show:false,
        show2:false,
        has_error: false,
        questions: null,
        name:sessionStorage.name,
        count:''
      }
    },
    mounted() {
      this.getQuestions()
    },
    components:{
      editquestion,
      deletequestion
    },
    methods: {
       getQuestions() {
                this.$http({
                url: `viewquestion/`+this.$route.params.id,
                method: 'GET'
                })
                    .then((res) => {
                    this.questions = res.data.questions.questions
                    }, () => {
                    this.has_error = true
                    })
      },
       deleteuser(){
          this.$router.push({name: 'admin.questionlist'}) 
      }
    }
  }
</script>
<style scoped>
img{
  height: 100px;
  width: 100px;
}
.card{
  width: 50%;
  padding: 20px;
  align-content: center;
  text-align: center;
  margin-left: 25%;
  margin-top: 5%;
}
.label{
  font-weight: bold;

}
p{
  margin-bottom: 10px;
}
.third{
  margin-top: 5%;
}
button{
  width: 90px;
}
.btnrow{
  margin-top: 10%;
}
.last{
    margin-top: 2%;
}
.des{
    text-align: justify;
}
.lab{
    text-align: left;
     font-weight: bold;
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
.q >>> p{
    margin-bottom: 5px;
}
</style>