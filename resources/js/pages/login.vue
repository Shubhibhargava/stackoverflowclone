
<template>
<div class="parent">
 <img class="icon" src="/images/icon.png"  >
    <div class="card shadow p-3 mb-5 bg-white rounded login">
        
        <div class="alert alert-danger" v-if="has_error && !success">
            <p>Invalid credentials</p>
        </div>
        <form autocomplete="off" @submit.prevent="login" method="post">
            <div class="form-group">
                <label for="email">E-mail</label>
                <input type="email" id="email" class="form-control"  v-model="email" >
                <span v-if="this.has_error">{{this.error.email}}</span>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <!-- <span class="logspan">Forgot password?</span> -->
                <input type="password" id="password" class="form-control" v-model="password" >
                 <span v-if="this.has_error">{{this.error.password}}</span>
            </div>
            <button type="submit" class="btn btn-primary submit">Log in</button>
        </form>
    </div>
    <div class="signup">
        <p>Don't have an account?&nbsp;<router-link :to="{ name: 'register' }"><span>Sign up</span></router-link></p>
    </div>
  
</div>

</template>
<style scoped>
.parent{
    position: relative;
}
.login{
    width: 20%;
    margin-left: 40%;
    margin-top: 10%;
    position: absolute;
   
   
    
}
.submit{
    width: 100%;
}
.icon{
    margin-left: 48%;
    position: absolute;
    margin-top: 5% 
}
label{
    font-weight: bold;
    font-size: 115%;
   
}
.logspan{
    margin-left: 30%;
    color:#0B7BA0  ;
}
.signup{
    position: absolute;
    margin-top: 40%;
    margin-left: 43%;
}
.signup span{
    color: #0B7BA0;
}


</style>
<script>
  export default {
    data() {
      return {
        email: null,
        password: null,
        has_error: false,
        error: '',
        success:false
      }
    },
    mounted() {
      //
    },
    methods: {
      login() {
        // get the redirect object
        var redirect = this.$auth.redirect()
        var app = this
       
      
       {
        this.$auth.login({
          params: {
            email: app.email,
            password: app.password
          },
          success: function() {
            // handle redirection
            app.success=true;
            sessionStorage.id=this.$auth.user().id;
            sessionStorage.name=this.$auth.user().email;
            const redirectTo = redirect ? redirect.from.name : this.$auth.user().role === 2 ? 'admin.dashboard' : 'topquestions'
            this.$router.push({name: redirectTo})
          },
          error: function(resp) {
           
            app.has_error = true
            console.log(app.has_error);
            this.error=app.errors = resp.response.data.error;
            console.log(this.error);
           // this.error="Unable to sign in with those credentials, Check them again then login"
          },
          rememberMe: true,
          fetchUser: true
        })
       }
      }
    }
  }
</script>