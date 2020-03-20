<template>
<div class="container">
    <div class="row">
        <div class="col">
         <router-link :to="{ name: 'topquestions'}">  <span>  Home</span></router-link>
        </div>
    </div>
    <div class="row">
        <p></p>
    </div>
    <div class="row">
        <div class="col">
            <p>PUBLIC</p>
        </div>
    </div>           
    <div class="row">
        <div class="col">
             <span><svg aria-hidden="true" class="svg-icon iconGlobe" width="18" height="18" viewBox="0 0 18 18" fill="grey"><path d="M9 1a8 8 0 1 0 0 16A8 8 0 0 0 9 1zM8 15.32a6.4 6.4 0 0 1-5.23-7.75L7 11.68v.8c0 .88.12 1.32 1 1.32v1.52zm5.72-2c-.2-.66-1-1.32-1.72-1.32h-1v-2c0-.44-.56-1-1-1H6V7h1c.44 0 1-.56 1-1V5h2c.88 0 1.4-.72 1.4-1.6v-.33a6.4 6.4 0 0 1 2.32 10.24v.01z"></path></svg>
           Stack Overflow</span>
        </div>
    </div>
               
    <div class="row">
        <div class="col-2">
            <p></p>
        </div>
        <div class="col-10 shift">
            <router-link :to="{ name: 'tags'}"><span @click="activate(2)" :class="{ active : active_el == 2 }"  > Tags </span></router-link>
        </div>
    </div>
    <div class="row">
        <div class="col">
            <p></p>
        </div>
        <div class="col-10 shift">
            <router-link :to="{ name: 'alluser'}"> <span @click="activate(1)" :class="{ active : active_el == 1 }">Users</span></router-link>
        </div>
    </div>
</div>
</template>
<script>
export default {
     data() {
      return {
          active_el:0
        
      }
    },
    mounted() {
      
    },
    methods: {
      activate:function(el){
        this.active_el = el;
    }
    }
  }

</script>
<style scoped>
div{
    font-size: 100%;
}
p{
    color: grey;
}
span{
    cursor: pointer;
    color: grey;
}
span:hover{
    color: black;
    
}
.shift{
    text-align: center;
}
.active{
    color: black;
}
</style>