<template>
   <div class="container">
        <div class="row">
            <div class="col">
                <sidebar></sidebar>
            </div>
            <div class="col-10 maindiv">
                <div class="row headrow">
                    <div class="col-10">
                         <h2>Questions tagged [ {{tags.name}}]</h2>
                    </div>
                    
                    <div class="col-2">
                      <router-link :to="{ name: 'askquestion'}">  <button class="btn btn-primary" >Ask Question </button></router-link>
                    </div>
                </div>
                <div class="row secondrow">
                    <div class="col-10">
                        <p>{{tags.description}}</p>
                        <h5>{{count}} questions</h5>
                    </div>
                </div>
                <!-- questions -->

                <div class="main">
                    <div v-for="question in questions" v-bind:key="question.questions.id" style="margin-bottom: 5px;" class="row mainrow">
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



                <!-- questions ends here -->
                
            </div>
        </div>
    </div>
</template>
<script>
import sidebar from '../../components/SideBar.vue'

export default {
     data() {
      return {
        has_error: false,
        tags: [],
        questions:[],
        count:null
        
      }
    },
    components: {
        sidebar
    },
    mounted() {
      this.getTags()
    },
    methods: {
      
      getTags() {
                this.$http({
                url: `viewtag/`+this.$route.params.id,
                method: 'GET'
                })
                    .then((res) => {
                    this.tags = res.data.tags.tags[0],
                    this.questions=res.data.tags.questions,
                    this.count=res.data.count
                    }, () => {
                    this.has_error = true
                    })
                }
            },
            watch: {
    '$route.params.id'(newId, oldId) {
        this.getTags();
    }
            }
        }
</script>

<style scoped>

.headrow{
   
    padding: 20px;
    margin-top: -1%;

}
.secondrow{
     border-bottom: 1px solid #D6D9DC;
      padding-left: 20px;
     font-size: 13px;
}
.maindiv{
    min-height: 600px;
     border-left: 1px solid #D6D9DC;
}
h5{
    padding-bottom: 10px;
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