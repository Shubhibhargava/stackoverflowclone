<template>
    <div>
        <modal v-if="showModal" @close="showModal = false"></modal>
        <ask></ask>
       
    </div>  
</template>  

<script>
import modal from '../../components/modal.vue'
import ask from '../../components/Ask.vue'

export default {
    data() {
        return{
    showModal: true
        }
  },
   components: {
       modal,
       ask
    }
    
}
</script>
   
  
  

  


