<template>
   <div class="main"> 
     <div class="card">
       <div class="row">
         <div class="col-md-12">
            <h1>User Info</h1>
         </div>
       </div>
       <div class="row">
         <div class="col-md-12">
           <img src="/images/user.png">
         </div>
       </div>
       <div class="row third">
         <div class="col-md-6">
           <p class="label">Name</p>
         </div>
         <div class="col-md-6">
           <p>{{users.users.name}}</p>
         </div>
       </div>
        <div class="row">
         <div class="col-md-6">
           <p class="label">E-mail</p>
         </div>
         <div class="col-md-6">
           <p>{{users.users.email}}</p>
         </div>
       </div>
        <div class="row">
         <div class="col-md-6">
           <p class="label">Tags</p>
         </div>
         <div class="col-md-6">
           <p>{{users.tags}}</p>
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
     <edituser v-if="show" @close="show = false;getUsers()"></edituser>
      <deleteuser v-if="show2" @close="show2 = false;deleteuser()" ></deleteuser>
   </div>
</template>

<script>
import edituser from '../components/EditUserModal.vue'
import deleteuser from '../components/DeleteUserModal.vue'
  export default {
    data() {
      return {
        show:false,
        show2:false,
        has_error: false,
        users: [],
        name:sessionStorage.name
      }
    },
    mounted() {
      this.getUsers()
    },
    components:{
      edituser,
      deleteuser
    },
    

    methods: {
      getUsers() {
        this.$http({
          url: `users/`+this.$route.params.id,
          method: 'GET'
        })
            .then((res) => {
              this.users = res.data.user[0]
              
            }, () => {
              this.has_error = true
            })
      },
      deleteuser(){
          this.$router.push({name: 'admin.userlist'}) 
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
</style>