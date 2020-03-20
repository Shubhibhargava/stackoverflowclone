<template>
    
  <transition name="modal">
    <div class="modal-mask">
      <div class="modal-wrapper">
        <div class="modal-container">

          <div class="modal-header">
            <slot name="header">
              <h2>Asking a good question</h2>
             
                  <svg @click="$emit('close')" aria-hidden="true" class="svg-icon iconClearSm" fill="grey" width="14" height="14" viewBox="0 0 14 14"><path d="M12 3.41L10.59 2 7 5.59 3.41 2 2 3.41 5.59 7 2 10.59 3.41 12 7 8.41 10.59 12 12 10.59 8.41 7 12 3.41z"></path></svg>
            </slot>
          </div>

          <div class="modal-body">
            <slot name="body">
              <p>
                  You’re ready to ask your first programming-related question and the community is here to help! To get you the best answers, we’ve provided some guidance:
              </p>
              <p>
                  Before you post, search the site to make sure your question hasn’t been answered
              </p>
              <p>
                  <img src="https://cdn.sstatic.net/Img/list-1.svg?v=e8dd475ba207" alt="1." class="grid--cell"> &nbsp;
                  Summarize the problem
              </p>
              <p>
                  <img src="https://cdn.sstatic.net/Img/list-2.svg?v=9382fc2c3631" alt="2." class="grid--cell"> &nbsp;
                  Describe what you’ve tried
              </p>
              <p>
                  <img src="https://cdn.sstatic.net/Img/list-3.svg?v=323a95564232" alt="3." class="grid--cell"> &nbsp;
                  When appropriate, show some code
              </p>
              <p>
                  <span>You’ll find more tips in the sidebar.</span>
              </p>
            </slot>
          </div>
          <div class="closebtn">
            <button class="btn btn-primary" @click="$emit('close')">
                            Start writing
                        </button> &nbsp;  &nbsp;
                       
         </div>

        </div>
      </div>
    </div>
  </transition>

</template>
<script>
export default {
     mounted() {
      //
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
}

.modal-body {
  /* margin: 10px 0; */
   border: none !important;
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
</style>
