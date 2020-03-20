<template>
<div>
    <nav class="navbar navbar-expand-lg navbar-light  navbar-fixed-top">
        <div class="collapse navbar-collapse nav-element" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <img src="/images/icons8-menu-24.png" id="sidebarCollapse" class="nav-link navfont" @click="show()" >
                </li>
            </ul>
        </div>
    </nav>

<div class="wrapper">
    <!-- Sidebar -->
    <div class="row mainrow">
        <div class="col-md-2">
            <nav id="sidebar" v-bind:class="{'active':(status == true)}">
                <ul class="list-unstyled components">
                    <li @click="activate(1)" :class="{ active : active_el == 1 }">
                        <router-link :to="{ name: 'admin.dashboard'}" >Home</router-link>
                    </li>
                    <li>
                        <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle" >Tags</a>
                        <ul class="collapse list-unstyled" id="homeSubmenu">
                            <li @click="activate(4)" :class="{ active : active_el == 4 }">
                            <router-link :to="{ name: 'admin.taglist'}"> View All</router-link>
                            </li>
                            <li @click="activate(5)" :class="{ active : active_el == 5 }">
                               <router-link :to="{ name: 'addnewtag'}"> Add New</router-link>
                            </li>
                        </ul>
                    </li>
                    <li @click="activate(2)" :class="{ active : active_el == 2 }">
                        <router-link :to="{ name: 'admin.userlist'}" >Users List</router-link>
                    </li>
                    <li @click="activate(3)" :class="{ active : active_el == 3 }">
                        <router-link :to="{ name: 'admin.questionlist'}">Questions List</router-link>
                    </li>
                    <li>
                            <a @click.prevent="$auth.logout()">Logout</a>
                    </li>
                </ul>
            </nav>
        </div>
        
        <div class="col-md-10">
            <router-view></router-view>
        </div>
    </div>
   
    


</div>
</div>
</template>
<script>
export default {
    data() {
      return {
        status:false,
         active_el:1
      }
    },
    mounted() {
      
    },
    methods: {
     show() {
        this.status=(!this.status)
      },
    activate:function(el){
        this.active_el = el;
    }
    }
  }
</script>

<style scoped>
@import "https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700";


.logoimg{
    height: 50px;
}
nav{
    background-color: #E5EEF1  ;
    height: 60px;
}
.wrapper {
    display: flex;
    align-items: stretch;
   
}

#sidebar {
    
    min-height: 300vh;
   
}

#sidebar.active {
    margin-left: -250px;
}
a[data-toggle="collapse"] {
    position: relative;
}

.dropdown-toggle::after {
    display: block;
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
}
@media (max-width: 768px) {
    #sidebar {
        margin-left: -250px;
    }
    #sidebar.active {
        margin-left: 0;
    }
}









p {
    font-family: 'Poppins', sans-serif;
    font-size: 1.1em;
    font-weight: 300;
    line-height: 1.7em;
    color: #999;
}

a, a:hover, a:focus {
    color: inherit;
    text-decoration: none;
    transition: all 0.3s;
}

#sidebar {
    /* don't forget to add all the previously mentioned styles here too */
    background:#1E6176	;
    color: #fff;
    transition: all 0.3s;
}

#sidebar .sidebar-header {
    padding: 20px;
    background: #1E6176;
}

#sidebar ul.components {
    padding: 20px 0;
    border-bottom: 1px solid #47748b;
    cursor: pointer;
}

#sidebar ul p {
    color: #fff;
    padding: 10px;
}

#sidebar ul li a {
    padding: 10px;
    font-size: 1.1em;
    display: block;
}
#sidebar ul li a:hover {
    color: #7386D5;
    background: #fff;
}

#sidebar ul li.active > a, a[aria-expanded="true"] {
    color: #fff;
    background:  #424444;
}
ul ul a {
    font-size: 0.9em !important;
    padding-left: 30px !important;
    background: #1E6176;
}
.nav-element{
    margin-left: 80px;
}
.navfont{
    
    font-family: "Open Sans", sans-serif;
    font-size: 14px;
    text-transform: uppercase;
        padding: 12px 18px 11px;
        font-weight: 550;
       
}
.logoimg{
    padding-left:20px;
  padding-right:30px;
}
#sidebarCollapse{
    margin-left: -50px;
}
.active{
    color: #fff;
    background:  #424444;
}

.mainrow{
    width: 100%;
}

</style>