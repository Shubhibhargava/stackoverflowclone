<template>
    <div class="container">
        
        
        <div class="row">
            
            <div class="col-md-12">
                <userList></userList>
            </div>
        </div>
    </div>
</template>
<script>
  import userList from '../../components/user-list.vue'
  
  export default {
    mounted() {
      //
    },
    components: {
      userList
    }
  }
</script>
<style scoped>
.container{
  text-align: left;
  align-content: center;

  }
</style>