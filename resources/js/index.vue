<template>
    <div id="main" >
      <!-- for logged in user -->
      <div v-if="$auth.check(1)">
        <header id="header">
            <navigationMenu></navigationMenu>
        </header>
         
          <div id="content">
            <router-view></router-view>
        </div>
        
         <div>
           <foot class="f"></foot>
         </div>
      </div>
      <!-- for admin -->
      <div v-if="$auth.check(2)">
        <div>
            <adminlayout></adminlayout>
        </div>
      </div>
      <!-- for user without login -->
      <div v-if="!$auth.check()">
        <header id="header" v-if="!$auth.check()">
            <navigationMenu></navigationMenu>
        </header>
        <div id="content">
            <router-view></router-view>
        </div>
        
      </div>
    </div>
    
</template>
<script>
  import navigationMenu from './components/Menu.vue'
  import adminlayout from './components/AdminLayout.vue'
  import foot from './components/Footer.vue'
  export default {
    data() {
      return {
        //
      }
    },
    components: {
      navigationMenu,
      foot,
      adminlayout
    }
  }
</script>
<style scoped>
#header{
  position: relative;
}
.f{
  position: absolute;
  margin-top: 10%;
  width: 100%;
  }
</style>
