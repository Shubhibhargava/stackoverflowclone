<template>
  <div class="main">
     <editor
       api-key="t9ucqkavy0b9j3bvmo9g7nnloxmxy5b6ybzsyv8ywmq2wlrn"
       initialValue="<p>This is the initial content of the editor</p>"
       :init="{
         
         height: 500,
         menubar: false,
         plugins: [
           'advlist autolink lists link image charmap print preview anchor',
           'searchreplace visualblocks code fullscreen',
           'insertdatetime media table paste code help wordcount',
           'advcode','image code','codesample','link','quickbars'
         ],
          images_upload_url: 'postAcceptor.php',
          images_upload_handler: function (blobInfo, success, failure) {
    setTimeout(function () {
      /* no matter what you upload, we will turn it into TinyMCE logo :)*/
      success('http://moxiecode.cachefly.net/tinymce/v9/images/logo.png');
    }, 2000);
  },
         toolbar:
           'bold italic   |  link  blockquote image codesample| numlist bullist | undo redo '
       }"
       
       
       >
       </editor>
   </div>
 </template>

 <script>
 import Editor from '@tinymce/tinymce-vue'
  
 export default {
   name: 'app',
   components: {
     'editor': Editor
   }
 }
 </script>
 <style  scoped>
 /* .main{
  width: 500px;   
  height: 300px;
  overflow: scroll;
 } */
 </style>