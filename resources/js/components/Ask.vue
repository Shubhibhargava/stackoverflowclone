<template>
<div class="main">
    <div class="content">
        <div class="row">
            <div class="col">
                <h2>Ask a public question</h2>
                <div class="alert alert-danger" v-if="status == false" style="width:60%; font-size:20px;">
            <p>Please fill all the fields.</p>
        </div>
            </div>
            
        </div>
        <form autocomplete="off" @submit.prevent="register" method="post">
        <div class="row">
            <div class="col">
                <div class="card shadow p-3 mb-5 bg-white rounded qdiv">
                    
                        <div class="form-group">
                            <label for="title">Title</label>
                            <p class="smalltext">Be specific and imagine you’re asking a question to another person</p>
                            <input type="text" id="title" class="form-control"  v-model="title" >
                        </div>
                        <div class="form-group">
                            <label for="title">Body</label>
                            <p class="smalltext">Include all the information someone would need to answer your question</p>
                          
                        <editor
                            api-key="t9ucqkavy0b9j3bvmo9g7nnloxmxy5b6ybzsyv8ywmq2wlrn"
                           
                            :init="{
                                
                                height: 300,
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
                            
                            class="edit" id="edit" v-model="edit" 
                            >
                            </editor>
                        </div>
                        <div class="form-group">
                            <label for="title">Tags</label>
                             <p class="smalltext">Add up to 5 tags to describe what your question is about</p>
                              <div class="chip-container">
                                <div class="chip" v-for="(chip, i) of chips" :key="chip.label">
                                    {{chip}}
                                    <i class="material-icons" @click="deleteChip(i)">clear</i>
                                </div>
                                <input type="text" id="title" class="tags" @focus="viewsuggestion=true"  @keypress.space="saveChip" @keydown.delete="backspaceDelete" v-on:keyup="findtag" v-model="tags">
                              </div>
                              
                        </div>
                      
     
                    

                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
                <div class="card shadow p-3 mb-5 bg-white suggestion" v-if="viewsuggestion">
                    <div class="row">
                        <div v-for="ta in tag.slice(0,3)" v-bind:key="ta.id" class="col" style="margin-bottom: 5px;">
                            <a class="chip2" @click="saveChip2(ta.name )">  {{ta.name}}</a>
                            <p class="des"> {{ta.description}}</p>       
                        </div>
                    </div>
                     <div class="row">
                        <div v-for="ta in tag.slice(3,6)" v-bind:key="ta.id" class="col" style="margin-bottom: 5px;">
                            <a class="chip2" @click="saveChip2(ta.name )">  {{ta.name}}</a>
                            <p class="des"> {{ta.description}}</p>       
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <button type="submit" class="btn btn-primary submit">Submit</button>
                 <router-link :to="{ name: 'topquestions'}">  <button  class="btn btn-primary submit">back</button></router-link>
            </div>
           
            
        </div>
        </form>
    </div> 
    <div v-for="spli in split" v-bind:key="spli">
   <a @click="saveChip"> {{spli}}</a> 
    </div>
</div>
</template>
<script>
import Editor from '@tinymce/tinymce-vue'


export default {
    props: {
    set: {
      type: Boolean,
      default: true
    }
  },
     data(){
         
            return {
                title: '',
                edit: '',
                tags: '',
                split:'',
                full:'',
                chips:[],
                tag:'',
                a:[],
                error:"",
               status:true,
                viewsuggestion:false
                
                
            };
        },
     mounted() {
      //
    },
    components: {
      
        'editor': Editor
    },
     methods: {
         findtag(){
                
                var app = this
                this.$http({
                     url: `findtag`,
                    method: 'POST',
                    data: {
                        tags:app.tags
                      
                    }
                }) 
                .then((res) => {
              this.tag = res.data.tag.data;
              console.log(this.tag);
            }, () => {
              this.has_error = true
            })               
            },
            register(){
                 var app = this
                if(app.edit == '' || app.title== '' || this.chips == '')
                this.status=false;
                if(this.status){
               console.log(this.status);
                this.$http({
                     url: `addquestion`,
                    method: 'POST',
                    data: {
                        user_id: sessionStorage.id,
                        title: app.title,
                        question: app.edit,
                        tags: this.chips

                      
                    }, 
                    success: function () {
                       
                        
                    },
                    error: function (resp) {
                        app.error = true;
                        app.errors = resp.response.data.errors;
                     
                    },
                    redirect: null
                }); 
                this.$router.push({name: 'topquestions'})  
                }             
            },
             
            saveChip() {
                
            const {chips, tags, set} = this;
            ((set && chips.indexOf(tags) === -1) || !set) && chips.push(tags);
            this.tags= '';
            this.a=chips;
            console.log(this.a);
            this.viewsuggestion=false;
            },
             saveChip2(value) {
                
            const {chips, tags, set} = this;
            ((set && chips.indexOf(tags) === -1) || !set) && chips.push(value);
            this.tags= '';
             this.a=chips;
            console.log(this.a);
             this.viewsuggestion=false;
            },
            deleteChip(index) {
            this.chips.splice(index, 1);
            this.viewsuggestion=false;
             console.log(this.a);
            },
            backspaceDelete({which}) {
            which == 8 && this.tags=== '' && this.chips.splice(this.chips.length - 1);
           this.viewsuggestion=false;
            },

    
     }

   
}
</script>
<style scoped>
.main{
    margin-left: 10%;
}
.qdiv{
    width: 60%;
    margin-bottom: 25px !important;
    position: relative;
}
.editor{

    height: 250px;
    overflow: scroll;
    margin-left: -3px;
}
.smalltext{
    font-size: 12px;
    margin: 1px ! important;
}
label{
    margin: 0 ! important;
    font-weight: bold;
}
h2{
    margin-bottom: 8vh;
}
button{
    margin-bottom: 23px !important;
    font-size: 12px;
}
.chip-container {
  width: 100%;
  border: 1px solid #ccc;
  min-height: 34px;
  display:flex;
  flex-wrap: wrap;
  align-content: space-between;
  
}
  .chip {
    margin:4px;
    background:#E1ECF5;
    padding:0px 4px;
    border: 1px solid #ccc;
    border-radius: 3px;
    display:flex;
    align-items: center;
    color: #3F78A0;
    font-size: 15px;
  }
    i {
      cursor: pointer;
      opacity: .56;
      margin-left:8px;
      
    }
 .tags{
     
    flex: 1 1 auto;
    width:30px;
    border: none;
    outline: none;
    padding:4px;
  
 } 
 .des{
     font-size: 12px;
 }
.suggestion{
    position: absolute;
    width: 56.5%;
    top: -7.5vh;
    left: 4vh;
    z-index: 2;
    border: solid 1px black;
    
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
