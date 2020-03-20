<template>
   <div class="main"> 
     <div class="card">
       <div class="row">
         <div class="col-md-12">
            <h1>Tag Info</h1>
         </div>
       </div>
       <div class="row">
         <div class="col-md-12">
           <img src="/images/user.png">
         </div>
       </div>
       <div class="row third">
         <div class="col-md-6">
           <p class="label">Name :</p>
         </div>
         <div class="col-md-6">
           <p>{{tags.name}}</p>
         </div>
       </div>
       <div class="row">
         <div class="col-md-6">
           <p class="label">Used :</p>
         </div>
         <div class="col-md-6">
           <p>{{count}} times</p>
         </div>
       </div>
       <div class="row last">
         
         <div class="col-md-6">
           <p class="label">Description :</p>
         </div>
       </div>
        <div class="row">
         
         <div class="col-md-12">
           <p class="des">{{tags.description}}</p>
         </div>
       </div>
        
       <div class="row btnrow">
         <div class="col-md-3"></div>
          
         <div class="col-md-3">
           <button class="btn btn-primary" @click="show = true">Edit</button>
         </div>
         <div class="col-md-3">
           <button class="btn btn-danger" @click="show2 = true">Delete</button>
         </div>
         
         <div class="col-md-3"></div>
       </div>

     </div>
     <edittag v-if="show" @close="show = false;getUsers()"></edittag>
      <deletetag v-if="show2" @close="show2 = false;deleteuser()"></deletetag>
   </div>
</template>

<script>
import edittag from '../components/EditTagModal.vue'
import deletetag from '../components/DeleteTagModal.vue'
  export default {
    data() {
      return {
        show:false,
        show2:false,
        has_error: false,
        tags: null,
        name:sessionStorage.name,
        count:''
      }
    },
    mounted() {
      this.getUsers()
    },
    components:{
      edittag,
      deletetag
    },
    methods: {
      getUsers() {
        this.$http({
          url: `viewtag/`+this.$route.params.id,
          method: 'GET'
        })
            .then((res) => {
              this.tags = res.data.tags.tags[0]
              this.count=res.data.count
            }, () => {
              this.has_error = true
            })
      },
       deleteuser(){
          this.$router.push({name: 'admin.taglist'}) 
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
  width: 30%;
  padding: 20px;
  align-content: center;
  text-align: center;
  margin-left: 35%;
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
  width: 80px;
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
</style>