<template>
   <div>
   
    <div class="alert alert-danger" v-if="has_error">
        <p>Erreur, impossible de récupérer la liste des utilisateurs.</p>
    </div>
    <div class="main">
        <div v-for="question in questions" v-bind:key="question.id" style="margin-bottom: 5px;" class="row mainrow">
          <!-- <p><span class="q" v-html="question.questions.question.title" ></span></p> -->
          <div class="col-md-1 stats">
            <p class="value">{{question.questions.views}}</p>
            <p class="nor">views</p>
          </div>
          <div class="col-md-1 stats">
             <p class="value">{{question.questions.answer_count}}</p>
             <p class="nor">answers</p>
          </div>
          <div class="col-md-10">
              <p class="title">
                <router-link :to="{ name: 'viewquestion', params: { id: question.questions.id }}">{{question.questions.title}}</router-link>
              </p>
             
              <div class="row qtag">
                <div v-for="tag in question.tags" v-bind:key="tag.id" style="margin-bottom: 5px;">
                  <div class="col tag2">
                    <router-link :to="{ name: 'viewtag', params: { id: tag.id }}"> <span class="tag">{{ tag.name }}</span></router-link>
                  </div>
                </div>
              </div>
          </div>
        </div>
    </div>
  </div>
</template>
<script>
export default {
     data() {
      return {
        has_error: false,
        questions: null,
        view: null,
      }
    },
    mounted() {
      this.getQuestions()
    },
    methods: {
      getQuestions() {
        this.$http({
          url: `questions`,
          method: 'GET'
        })
            .then((res) => {
              this.questions = res.data.questions
            }, () => {
              this.has_error = true
            })
      }
      
    }
}
</script>
<style scoped>

/* .b  {
    background-color:grey;
} */
.q >>> blockquote {
    background-color: #FBF2D4 ;
    border-left: #FBEB8E solid 3px;
   
}
.q >>> blockquote p {
   padding: 8px;
   
}
.q >>> pre {
    background-color: #DCDEE0 ;
 
}
.q >>> pre code{
  
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
.tag:hover{
  text-decoration: none !important;
}
.tag2{
  padding: 0 !important;
}
.stats{
  text-align: center;
 
}
.stats p{
 margin: 0 !important;

}
.main{
  margin-top:2%;
}
.value{
  color: #6B747D;
}
.nor{
   color: #9DA4AA;
}
.title{
  margin-bottom: 10px;
  font-size: 19px;
}
.qtag{
  margin-left: 0.1%;
}
.mainrow{
  border-bottom: 1px solid #EFF0F1;
  padding: 10px;

}


</style>