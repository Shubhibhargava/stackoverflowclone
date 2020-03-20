<template>
    <div class="container">
        <div class="header">
            <h1>Admin Dashboard</h1>
            
        </div>
        <div>
           <div class="row">
             <div class="col-md-4">
                <div class="card  one">
                  <router-link :to="{ name: 'admin.taglist'}"><img src="images/tag.jpeg"></router-link>
                   <router-link :to="{ name: 'admin.taglist'}"><p>tags</p></router-link>
                  </div>
             </div>
             <div class="col-md-4">
               <div class="card  one">
                  <router-link :to="{ name: 'admin.userlist'}"><img src="images/users.png"></router-link>
                   <router-link :to="{ name: 'admin.userlist'}"><p>users</p></router-link>
                  </div>
             </div>
             <div class="col-md-4">
              <div class="card  one">
                  <router-link :to="{ name: 'admin.questionlist'}"><img src="images/questions.jpeg"></router-link>
                  <router-link :to="{ name: 'admin.questionlist'}"><p>questions</p></router-link>
                  </div>
             </div>
           </div>
            
        </div>
    </div>
</template>
<script>
 
  export default {
    mounted() {
      //
    },
    components: {
      
    }
  }
</script>
<style scoped>
.container{
  text-align: center;
  align-content: center;
  
  }
  .header{
    text-align: center;
  }
  img{
    width: 348px;
    height: 220px;
  }

  h1{
  text-align: center;
  padding: 20px;

}
  
  
</style>