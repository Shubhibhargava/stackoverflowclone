<template>
<div>
    <h3>Questions List</h3>
    
    

    <div class="main">
                  <form id="search" class="label">
                    Search
                    <input name="query" v-model="searchQuery" class="search">
                  </form>
                <div id="demo">
                  <data-table :data="question_data" :columns-to-display="gridColumns" :columnsToSort="sort" :filter-key="searchQuery" :itemsPerPage=2 >
                      <template slot="title" class="l" slot-scope="props">
                       <p class="l">{{props.entry.title}}</p>
                      </template>
                       <template slot="tags" class="l" slot-scope="props">
                       <p class="l">{{props.entry.tags}}</p>
                      </template>
                       <template slot="views" class="r" slot-scope="props">
                       <p class="r">{{props.entry.views}}   </p>                   </template>
                       <template slot="answer" class="r" slot-scope="props">
                       <p class="r">{{props.entry.answer}}</p>
                      </template>
                       <template slot="action" class="r" slot-scope="props">
                      <p class="r"> <router-link :to="{ name: 'openquestion', params: { id: props.entry.id }}"><i class="fa fa-eye" aria-hidden="true"></i></router-link></p>
                      </template>
                  </data-table>
                </div>
             
                 <!-- <pagination :data="uData" @pagination-change-page="userInfo" class="pagi"></pagination> -->
            </div>
</div>
</template>

<script>

  export default {
    data() {
      return {
        has_error: false,
        questions: [],
        question_data:[],
         searchQuery: '',
      gridColumns: ['s.no.','title','tags','views','answer','action'],
       sort: ['title','tags','views','answer'],
      }
    },
    mounted() {
      this.getUsers()
    },
    methods: {
      getUsers() {
        this.$http({
          url: `questionlist`,
          method: 'GET'
        })
            .then((res) => {
              this.questions = res.data.questions

              console.log(this.questions);
              this.questions.forEach(element => {
                this.question_data.push({'title':element.questions.title,'views' : element.questions.views,'tags' : element.tags,'answer': element.questions.answer_count, 'id' : element.questions.id });
                

});
console.log(this.question_data);
            }, () => {
              this.has_error = true
            })
      }
    }
  }
</script>
<style scoped>
/deep/ tfoot{
  text-align: center !important;
  margin-top: 10%;
}
i{
  color: #1E6176
}
h3{
  text-align: center;
  padding: 20px;

}
.main >>> tbody {
  counter-reset: serial-number;  /* Set the serial number counter to 0 */
}

.main >>> tbody td:first-child:before {
  counter-increment: serial-number;  /* Increment the serial number counter */
  content: counter(serial-number);  /* Display the counter */
}
.main >>> table tr{
 
  border-bottom: 1px solid #DEE2E6;
  border-top: 1px solid #DEE2E6;
}
.main >>> tbody tr td{
 
  padding: 15px;
}
.main >>> thead tr th{
 
  padding: 15px;
}
.l{
  text-align: left;
}
.r{
  text-align: right;
}
.main >>> p{
  margin:0px !important;
}
#search{
  padding: 20px;
  text-align: right;
}
#demo >>> tfoot{
  text-align: center !important;
}
/deep/ th.active .arrow {
  opacity: 1;
}

/deep/ .arrow {
  display: inline-block;
  vertical-align: middle;
  width: 0;
  height: 0;
  margin-left: 5px;
  opacity: 0.66;
}

/deep/ .arrow.asc {
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-bottom: 4px solid #000;
}

/deep/ .arrow.dsc {
  border-left: 4px solid transparent;
  border-right: 4px solid transparent;
  border-top: 4px solid #000;
}

/deep/ .previousPage {
  position: relative;
}
/deep/ .previousPage:before {
  content: "\f104";
  font-family: FontAwesome;
  
  position: absolute;
}
 
/deep/ .nextPage {
  position: relative;
}
/deep/ .nextPage:before {
  content: "\f105";
  font-family: FontAwesome;
  position: absolute;
  left: 5px;
}

</style>