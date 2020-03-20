<template>
    <div>
        <div class="container">
        <div class="row">
            <div class="col">
                <sidebar></sidebar>
            </div>
            <div class="col-10 maindiv">
                <div class="row headrow">
                    <div class="col">
                         <h1>Tags</h1>
                         <p class="first">A tag is a keyword that categorizes question with similar questions. Using the right tags makes it easier for others to find your question.</p>
                    </div>
                </div>
                <div class="row">
                    <div v-for="ta in tags" v-bind:key="ta.id" class="col-md-3">
                        <div class="contentrow">
                         <p><router-link :to="{ name: 'viewtag', params: { id: ta.id }}"><span class="tag">{{ta.name}}</span></router-link></p>
                         <p class="tagdes" v-if="ta.description.length<8">{{ta.description}}</p>
                         <p class="tagdes" v-else>{{ ta.description.substring(0,60)+"..." }}</p>
                        </div>
                    </div>
                    
                </div>
            </div>
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
        tags: null,
       
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
          url: `tags`,
          method: 'GET'
        })
            .then((res) => {
              this.tags = res.data.tags
            }, () => {
              this.has_error = true
            })
      }
      
    }
}
</script>

<style scoped>

.headrow{
   
    padding: 20px;
    

}
.maindiv{
    min-height: 600px;
     border-left: 1px solid #D6D9DC;
}
.contentrow{
    padding: 10px;
  
}
.contentrow p{
    margin: 0 !important;
}
.tag{
   margin:4px;
    background:#E1ECF5;
    padding:0px 4px;
  
    border-radius: 3px;
  
    align-items: center;
    color: #3F78A0;
    font-size: 15px;
    cursor: pointer;
}
.tagdes{
    color: #9199A0;
    font-size: 13px;
}
.first{
    padding-top: 15px;
}
</style>