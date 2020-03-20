<template>
  <div class="hello">
    <form 
     autocomplete="off" @submit.prevent="submit()" method="post">
    <input
    
      placeholder="Enter Text Here"
      v-model="tempMessage"
     
    />
    </form>
  </div>
</template>

<script>
export default {
  name: "UsrMsg",
  data() {
    return {
      tempMessage: ""
    };
  },
  methods: {
    submit: function() {
      this.$emit("inputData", this.tempMessage);
      this.tempMessage = "";
    }
  }
};
</script>