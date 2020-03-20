<template>
    <div>
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
                    <div class="row mainlink">
                        <div class="col">
                            <p class="links">share &nbsp; edit</p>
                        </div>
                    </div>
                    <div class="row">
                        <div class="ml-auto mr-3 user">
                           
                            <p><span class="date">answered Oct 22 '15 at 17:36</span></p>
                            <p><img  class="perimg" src="/images/permanent.png" >  &nbsp;{{answer.user.name}}</p>
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
        
        
        answers: null,
       
       
      }
    },
   
    mounted() {
     
      this.getAnswers()
    },
    methods: {
     
      getAnswers() {
                    this.$http({
                    url: `answers/`+this.$route.params.id,
                    method: 'GET'
                    })
                        .then((res) => {
                        this.answers = res.data.answers
                       
                        }, () => {
                        this.has_error = true
                        })
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

.que{
    font-size: 18px;
}

.user{
    margin:4px;
   
    padding:5px;
    min-width: 200px;
    max-height: 100px;
    border-radius: 3px;
  
    align-items: center;
    color: #3F78A0;
    font-size: 15px;
}
.user p{
    margin-bottom: 4px !important;
}

.links{
    color: #6B6F73;
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



.date{
    color: #848D96;
}
.perimg{
    height: 25px;
    width: 25px;
}



</style>
