<template>
    <div class="container">
        <div class="row">
            <div class="col">
                <sidebar></sidebar>
            </div>
            <div class="col-10 maindiv">
                <div class="row">
                    <div class="col-md-10">
                         <h1>{{questions.questions.title}}</h1>
                    </div>
                   
                    <div class="col-md-2">
                      <router-link :to="{ name: 'askquestion'}">  <button class="btn btn-primary" >Ask Question </button></router-link>
                    </div>
                   
                </div>
                 <div class="row headrow">
                    <div class="col-md-2">
                        <p><span>Asked</span> {{questions.date}} days ago</p>
                    </div>
                    <div class="col-md-2">
                       <p><span>Viewed </span>{{questions.questions.views}} times</p>
                    </div>

                </div>
                
                <vquestion></vquestion>
            </div>
        </div>
    </div>
</template>
<style scoped>

.headrow{
    border-bottom: 1px solid #D6D9DC;
    

}
.maindiv{
    min-height: 600px;
     border-left: 1px solid #D6D9DC;
}
span{
    color: #717A81;
}
</style>
<script>

import sidebar from '../../components/SideBar.vue'
import vquestion from '../../components/ViewQuestion.vue'

export default {
   data() {
      return {
        has_error: false,
        questions: null,
       
      }
    },
    components: {
        sidebar,
        vquestion
    },
    mounted() {
      this.getQuestions()
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
      }
    }
  }
    

</script>