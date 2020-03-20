<template>
     <div class="inner shadow p-3 mb-5 bg-white rounded me">
      <nav class="navbar navbar-expand-lg navbar-light bg-light">
       
     <!-- <div id="nav-icon4">
  <span></span>
  <span></span>
  <span></span>
</div> -->
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
       
        <div v-if='!$auth.check()'>
     <!-- <a  class="navbar-brand" href="#"> <img class="three" src="/images/three.png" ></a>
      <a class="navbar-brand" href="#"> <img class="cross" src="/images/cross.png" ></a> -->
     
       </div>
     <a class="navbar-brand" href="http://192.168.18.135:8000/"> <img class="logo" src="/images/logo.png" ></a>
  
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
     
      
      <div v-if="$auth.check(1)">
            <li class="nav-item"  v-for="(route, key) in routes.user" v-bind:key="route.path">
                <router-link class="nav-link" :to="{ name : route.path }" :key="key">
                    {{route.name}}
                </router-link>
            </li>
        </div>

        <div v-if="$auth.check(2)">
            <li class="nav-item"  v-for="(route, key) in routes.admin" v-bind:key="route.path">
                <router-link class="nav-link" :to="{ name : route.path }" :key="key">
                    {{route.name}}
                </router-link>
            </li>
            </div>

    </ul>
   <form class="form-inline " autocomplete="off" @submit.prevent="search" method="post">
   <!-- Search form -->
  <div id="search-wrapper">
     

  <input type="text" id="name" class="form-control searchForm" placeholder="Search for tags..." aria-label="Search" v-model="name">


  
  </div>
   
  </form>&nbsp;&nbsp;&nbsp;&nbsp;
  <div v-if="$auth.check()">
    
                <a href="#" class="btn btn-primary" @click.prevent="$auth.logout()">Logout</a>
           
  </div>
   <div v-if='!$auth.check()'>
  <router-link :to="{ name: 'login' }"><button class="btn btn-primary login">Log in</button></router-link>&nbsp;
  <router-link :to="{ name: 'register' }"><button class="btn btn-primary">Sign up</button></router-link>
  </div>
  </div>
  <!-- fdjhkgdf -->
       
    </nav>
    
     </div>
</template>


<script>

  $(document).ready(function(){
	$('#nav-icon4').click(function(){
		$(this).toggleClass('open');
	});
});

  export default {
    data() {
      return {
         id:'',
         status:'',
        img:false,
        name:'',
        myimage:'/images/three.png',
        otherimage:'/images/cross.png',
      
        routes: {
          // UNLOGGED
          unlogged: [
            {
              name: 'Register',
              path: 'register'
            },
            {
              name: 'Log in',
              path: 'login'
            }
          ],
          // LOGGED USER
          user: [
            {
              name: 'Dashboard',
              path: 'dashboard'
            }
          ],
          // LOGGED ADMIN
          admin: [
            {
              name: 'Dashboard',
              path: 'admin.dashboard'
            },
            //{
            //   name: 'View User',
            //   path: 'viewuser'
            // }
          ]
        }
      }
    },
    mounted() {
      //
    },
     methods: {
         
           search(){
                 var app = this
                this.$http({
                     url: `search`,
                    method: 'POST',
                    data: {
                       name:app.name,

                       
                      
                    }
                  })
                  .then((res) => {
                     this.status=res.data.status
                    
                     if(this.status != "unsuccessful"){
                       
                    this.id = res.data.id
                    
                    this.page();
                  }
                  else{
                   
                    this.nopage();
                  }

                    
                    
                  }, () => {
                    this.has_error = true
            }); 
                
                                   
            },
          page(){
            this.$router.push({name: 'viewtag', params: { id: this.id }}) 
            
      },
      nopage(){
        console.log("hii");
        this.$router.push({name: 'nopage'}) 
      }
     }
             
  }
</script>


<style scoped>
.cross{
  height: 10%;
  width: 60%;
}
/* .s{
  position: relative;
} */

.searchForm{
    width: 50%;
    height: 60%;
    margin-left: -50%;
    margin-top: -1.2%;
    position: absolute;
}
.login{
    background-color:#E5EEF1 ;
    color:#036B8E ;
}
.logo{
  width: 80%;
  margin-bottom: 5%;
}
.me{
    
    border-top:#F37F25 solid 3px;
    border-bottom: #F6F7F7 solid 3px;
}
nav{
margin-left:10%;
    width:80%;
    padding: 0 20px;
    position: relative;
   
}

.panel-body{
  align-content: center;

}
.inner{
  height: 10%;
  padding: 0 !important;
}


.foot{
  margin-top: 40%;
  overflow: hidden;
}

.search-wrapper{
  width: 70%;
}


#oprationDiv{
 
 width: 100%;
  border-radius: 10px;
  margin-top: 5%;
  margin-left: 37%;
  padding:10px;
}

.popover>.triangle, .popover>.triangle:after {
    position: absolute;
    display: block;
    width: 0;
    height: 0;
    border-style: solid;
    border-width: 10px;
    border-top-width: 0;
    border-color: transparent;
}

.popover>.triangle {
    top: -10px;
    border-bottom-color: grey;
}

.popover>.triangle:after{
    top: 11px;
    margin: -10px;
    content: " ";
    border-bottom-color: #fff;
}

#oprationDiv>.triangle {
    left: 10px;
}
@media (max-width: 767px) {
  .search-wrapper .popover {
    position: relative !important ;
  }
}



 #nav-icon4 {
  width: 20px;
  height: 15px;
  position: relative;
  /* margin: 20px auto; */
  
  -webkit-transform: rotate(0deg);
  -moz-transform: rotate(0deg);
  -o-transform: rotate(0deg);
  transform: rotate(0deg);
  -webkit-transition: .5s ease-in-out;
  -moz-transition: .5s ease-in-out;
  -o-transition: .5s ease-in-out;
  transition: .5s ease-in-out;
  cursor: pointer;
}

 #nav-icon4 span {
  display: block;
  position: absolute;
  height: 2px;
  width: 100%;
  background: grey;
  border-radius: 9px;
  opacity: 1;
  left: 0;
  -webkit-transform: rotate(0deg);
  -moz-transform: rotate(0deg);
  -o-transform: rotate(0deg);
  transform: rotate(0deg);
  -webkit-transition: .25s ease-in-out;
  -moz-transition: .25s ease-in-out;
  -o-transition: .25s ease-in-out;
  transition: .25s ease-in-out;
}



#nav-icon4 {
}

#nav-icon4 span:nth-child(1) {
  top: 0px;
  -webkit-transform-origin: left center;
  -moz-transform-origin: left center;
  -o-transform-origin: left center;
  transform-origin: left center;
}

#nav-icon4 span:nth-child(2) {
  top: 5px;
  -webkit-transform-origin: left center;
  -moz-transform-origin: left center;
  -o-transform-origin: left center;
  transform-origin: left center;
}

#nav-icon4 span:nth-child(3) {
  top: 10px;
  -webkit-transform-origin: left center !important;
  -moz-transform-origin: left center;
  -o-transform-origin: left center;
  transform-origin: left center !important;
}

#nav-icon4.open span:nth-child(1) {
  -webkit-transform: rotate(45deg);
  -moz-transform: rotate(45deg);
  -o-transform: rotate(45deg);
  transform: rotate(45deg);
  top: 1px;
  left: 0px;
}

#nav-icon4.open span:nth-child(2) {
  width: 0%;
  opacity: 0;
}

#nav-icon4.open span:nth-child(3) {
  -webkit-transform: rotate(-45deg);
  -moz-transform: rotate(-45deg);
  -o-transform: rotate(-45deg);
  transform: rotate(-45deg);
  top: 15px;
  left: 0px;
}
 .chip2 {
     width: auto;
    margin:4px;
    background:#E1ECF5;
    padding:0px 4px;
    /* border: 1px solid #ccc; */
    border-radius: 3px;

    align-items: center;
    color: #3F78A0;
    font-size: 15px;
    cursor: pointer;
  }




</style>
