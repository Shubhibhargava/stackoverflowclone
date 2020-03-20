<template>
<div>
<div id="yellowbg">
    <div class="row">
        <img  src="images/mainbg.png">
        
       </div>
       </div>
   


    
<div>
    <div class="row">
        <div class="col-md-2">
        </div>
         <div class="col-md-8">
             <h1 class="fourth">For developers, by developers</h1>
        </div>
         <div class="col-md-2">
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
        </div>
         <div class="col-md-8 fifth">
             <p>Stack Overflow is an open community for anyone that codes. We help you </p><p> answers to your toughest coding questions, share knowledge with</p><p> your coworkers in private, and find your next dream job.

             </p>
        </div>
         <div class="col-md-2">
        </div>
    </div>
     <div class="row">
        <div class="col-md-2">
        </div>
         <div class="col-md-4">
            <div class="card firstcard" id="firstcard">
                <div class="row">
                    <div class="col">
                        <img class="mb16" src="https://cdn.sstatic.net/Img/home/public-qa.svg?v=d82acaa7df9f">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <h4>Public Q&A</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col pcol">
                        <p>Get answers to more than 16.5 million questions and give back by sharing your knowledge with others. Sign up for an account.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <router-link :to="{ name: 'register' }"> <button class="btn btn-success">Sign up</button></router-link>
                    </div>
                </div>
            </div>
        </div>
         <div class="col-md-4">
            <div class="card firstcard">
                <div class="row">
                    <div class="col">
                        <img class="mb16" src="https://cdn.sstatic.net/Img/home/private-qa.svg?v=2c1de180b6d7">
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <h4>Private Q&A</h4>
                    </div>
                </div>
                <div class="row">
                    <div class="col pcol">
                        <p>Level up with Stack Overflow while you work. Share knowledge privately with your coworkers using our flagship</p><p> Q&A engine.</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col">
                        <router-link :to="{ name: 'topquestions' }"> <button class="btn btn-success">Ask a question</button></router-link>
                    </div>
                </div>
            </div>
        </div>
         <div class="col-md-2">
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
        </div>
         <div class="col-md-8">
             <h1 class="sixth">Questions are everywhere, answers are on Stack Overflow</h1>
        </div>
         <div class="col-md-2">
        </div>
    </div>
     <div class="row">
        <div class="col-md-2">
        </div>
         <div class="col-md-8">
             <img class="seven" src="images/ss.png">
        </div>
         <div class="col-md-2">
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
        </div>
         <div class="col-md-6 fifth">
            <p>Ask a question publicly on 170+ Stack Exchange sites or privately using Stack Overflow for Teams.
             </p>
            <router-link :to="{ name: 'register' }"> <button class="btn btn-primary btcreate">Create an account</button></router-link>
        </div>
         <div class="col-md-3">
        </div>
    </div>

    
</div>
<foot></foot>
</div>
</template>
<style scoped>
 #yellowbg{
   margin-top: -2.7%;
    min-height: 500px;
   
} 

.first{
    font-size: 50px;
    font-weight: bold;
    text-align: center;
    margin-top: 10%;
}
.second{
    font-size: 20px;
    margin-bottom: 0 !important;
    text-align: center;
}
.third{
    font-size: 20px;
    margin-bottom: 0 !important;
    text-align: center;
}
.fourth{
    font-size: 40px;
    font-weight: bold;
    text-align: center;
    margin-top: 5%;
    padding: 30px;
    border-bottom: 5px solid #F2720D;
    
}
.fifth{
    font-size: 20px;
   
    text-align: center;
   
    padding: 40px;
   
    
}
.sixth{
    font-size: 30px;
    font-weight: bold;
    text-align: center;
    margin-top: 5%;
    padding: 30px;
    border-bottom: 5px solid #F2720D;
    
}
.seven{
    padding: 30px;
}
.btcreate{
    background-color: #F48025;
    border-color: #F48025;
    font-size: 15px;
    
}
.img1{

}
.l{
    margin-left: -7%;
}
.dev{
    border-color: #F48025;
    background-color: #FFFFFF;
    color: #F48025;
    height: 45px;
    font-size: 15px;
}
.buss{
    border-color: #F48025;
    background-color: #F48025;
     height: 45px;
     width: 120px;
     font-size: 15px;

   
}
.firstcard{
    text-align: center;
    align-content: center;
    padding: 20px;
    width: 65%;
    min-height: 340px;
    
}
.firstcard img{
    padding: 20px;
}
.firstcard h4{
    font-weight: bold;
}
.firstcard button{
    background-color: #2B2D6E;
    border-color: #2B2D6E;
    font-size: 15px;
    width: 150px;
   
}
.firstcard p{
    margin-bottom: 0px;
}
.pcol{
    padding: 20px;
}
#firstcard{
    float:right;
}


</style>
<script>
  
  import foot from '../components/Footer.vue'
  export default {
    data() {
      return {
        //
      }
    },
    components: {
      
      foot
    }
  }
</script>