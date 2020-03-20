<template>
   <div class="main"> 
     <div class="card">
       <div class="row">
         <div class="col-md-12">
            <h1>Add New Tag</h1>
         </div>
       </div>
       
       <div class="alert alert-danger" v-if="status == 'Tag exists already'">
            <p>{{this.status}}</p>
        </div>

             <form  @submit.prevent="addnewtag"  method="post">
                 <div class="row first">
                     
            
                 <div class="col-md-2">
                <label for="name" class="lab">Name : </label>
                 </div>
                 <div class="col-md-8">
                <input type="text" id="name" class="form-control" v-model="name" required>
                 </div>
             
            </div>

            <div class="row"></div>
                <div class="row first">
                     
            
                 <div class="col-md-2">
                <label for="name" class="lab">Description: </label>
                 </div>
                 <div class="col-md-8">
                <textarea type="text" id="name" class="form-control" v-model="description" required></textarea>
                 </div>
             
            </div>
                
          
            <button class="btn btn-primary">
                           Add tag
            </button> 
        </form>
       
       
        
        
       

     </div>
     
   </div>
</template>

<script>

  export default {
    data() {
      return {
       
        name:'',
        description:'',
        status:"",
        sta: false
      }
    },
    mounted() {
      
    },
    
    methods: {
      addnewtag(){
                 var app = this
                this.$http({
                     url: `addnewtag`,
                    method: 'POST',
                    data: {
                       name:app.name,
                       description:app.description
                      
                    }
                  })
                  .then((res) => {
                    this.status = res.data.status
                     if(this.status != "success"){
                        this.sta =true
                       
                     }
                     else
                     {
                       this.sta = false 
                       this.$router.push({name: 'admin.taglist'}) 
                       
                     }
                    
                  }, () => {
                    this.has_error = true
            }); 
            
                                   
            }
    }
  }
</script>
<style scoped>

.card{
  width: 50%;
  padding: 20px;
  align-content: center;
  text-align: center;
  margin-left: 25%;
  margin-top: 5%;
}
.first{
    padding: 20px;
}
.card label{
    font-weight: bold;
}

</style>