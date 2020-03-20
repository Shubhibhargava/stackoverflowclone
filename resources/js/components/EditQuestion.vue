<template>
    
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">
             
          <div class="modal-header">
            <slot name="header">
             
                
              <h2>Edit Question</h2>
             
                  <svg @click="$emit('close')" aria-hidden="true" class="svg-icon iconClearSm" fill="grey" width="14" height="14" viewBox="0 0 14 14"><path d="M12 3.41L10.59 2 7 5.59 3.41 2 2 3.41 5.59 7 2 10.59 3.41 12 7 8.41 10.59 12 12 10.59 8.41 7 12 3.41z"></path></svg>
            </slot>
          </div>

          <div class="modal-body">
            <div class="row" v-if="status == 'success'">
                <div class="col">
               <div class="alert alert-success">
                  <p>Question updated successfully</p>
              </div>
                </div></div>
            <slot name="body">
              <div class="row">
         <div class="col-md-12">
           <img class="userimg" src="/images/user.png">
         </div>
       </div>
       <form autocomplete="off" @submit.prevent="update" v-if="!success" method="post">
             <div class="form-group" v-bind:class="{ 'has-error': error && errors.name }">
                <label for="name" class="lab">Title</label>
                <input type="text" id="name" class="form-control" v-model="questions.title" required>
                
            </div>
            <div class="form-group" v-bind:class="{ 'has-error': error && errors.email }">
                <label for="email" class="lab">Question</label>
                <textarea type="text" id="email" class="form-control"  v-model="questions.question" required></textarea>
                
            </div>
            <button class="btn btn-primary">
                            Update
                        </button> 
        </form>
            </slot>
          </div>
        </div>
      </div>
    </div>
  </transition>

</template>
<script>
export default {
    data() {
      return {
        show:false,
        has_error: false,
        questions: null,
        name:sessionStorage.name,
        status:false
      }
    },
    mounted() {
      this.getQuestions()
    },
    
    methods: {
      getQuestions() {
                this.$http({
                url: `viewquestion/`+this.$route.params.id,
                method: 'GET'
                })
                    .then((res) => {
                    this.questions = res.data.questions.questions
                    }, () => {
                    this.has_error = true
                    })
      },
       update(){
                 var app = this
                this.$http({
                     url: `updatequestion/`+this.$route.params.id,
                    method: 'POST',
                    data: {
                       title:this.questions.title,
                       question:this.questions.question
                      
                    }
                  })
                  .then((res) => {
                    this.status = res.data.status
                     console.log(this.status);
                  }, () => {
                    this.has_error = true
            }); 
                
                                   
            }
    }
}
</script>
<style scoped>
.modal-mask {
  position: fixed;
  z-index: 9998;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-color: rgba(0, 0, 0, .5);
  display: table;
  transition: opacity .3s ease;
}

.modal-wrapper {
  display: table-cell;
  vertical-align: middle;
}

.modal-container {
  width: 400px;
  margin: 0px auto;
  padding-left:10px;
  padding-top: 5px; 
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 2px 8px rgba(0, 0, 0, .33);
  transition: all .3s ease;
  font-family: Helvetica, Arial, sans-serif;
  
}

.modal-header  {
  margin-top: 0;
  padding-bottom: 0px;
  border: none !important;
  align-content: center;
  text-align: center;
}

.modal-body {
  /* margin: 10px 0; */
   border: none !important;
   align-content: center;
  text-align: center;
}
.modal-footer {
  /* margin: 10px 0; */
   border: none !important;
}
.closebtn{
    padding-left: 15px;
    padding-bottom: 20px;
}
span{
    font-size: 13px;
    color: grey;
}

/*
 * The following styles are auto-applied to elements with
 * transition="modal" when their visibility is toggled
 * by Vue.js.
 *
 * You can easily play with the modal transition by editing
 * these styles.
 */

.modal-enter {
  opacity: 0;
}

.modal-leave-active {
  opacity: 0;
}

.modal-enter .modal-container,
.modal-leave-active .modal-container {
  -webkit-transform: scale(1.1);
  transform: scale(1.1);
}
.userimg{
     height: 100px;
  width: 100px;
}
.lab{
  font-size: 18px;
  font-weight: bold;
  padding: 5px;
}
form{
    text-align: left;
}
</style>
