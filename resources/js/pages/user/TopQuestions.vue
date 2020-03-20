<template>
    <div class="container">
        <div class="row">
            <div class="col">
                <sidebar></sidebar>
            </div>
            <div class="col-10 maindiv">
                <div class="row headrow">
                    <div class="col-4">
                         <h1>Top Questions</h1>
                    </div>
                    <div class="col-6">
                    </div>
                    <div class="col-2">
                      <router-link :to="{ name: 'askquestion'}">  <button class="btn btn-primary" >Ask Question </button></router-link>
                    </div>
                </div>
                <questions></questions>
            </div>
        </div>
    </div>
</template>
<style scoped>

.headrow{
    border-bottom: 1px solid #D6D9DC;
    padding: 20px;
    

}
.maindiv{
    min-height: 600px;
     border-left: 1px solid #D6D9DC;
}
</style>
<script>
import sidebar from '../../components/SideBar.vue'
import questions from '../../components/Questions.vue'

export default {
    data() {
      return {
        //
      }
    },
    components: {
        sidebar,
        questions
    }
    
}
</script>


