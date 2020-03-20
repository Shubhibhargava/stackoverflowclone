<template>
   
       <div>
    <h3>Answers List</h3>
            <div class="main">
                  <form id="search" class="label">
                    Search
                    <input name="query" v-model="searchQuery" class="search">
                  </form>
                <div id="demo">
                  <data-table :data="answers" :columns-to-display="gridColumns" :columns-to-sort="sort" :filter-key="searchQuery" :itemsPerPage=2 >
                      <template slot="Answer" slot-scope="props">
                        <p v-html="props.entry.answer"> </p>
                      </template>
                      <template slot="action" class="r" slot-scope="props">
                      <p class="r"><router-link :to="{ name: 'openanswer', params: { id: props.entry.id }}"><i class="fa fa-eye" aria-hidden="true"></i></router-link></p>
                      </template>
                  </data-table>
                </div>
             
                 
            </div>
            
     </div>
</template>

<style scoped>
/deep/ tfoot{
  text-align: center !important;
}
i{
  color: #1E6176
}
h3{
  text-align: center;
  padding: 20px;

}
#demo >>> table{
  margin-top: 3%;
 margin-left: 38%;
  
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
  text-align: center;
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

<script>
export default {
  data() {
    return {
      uData: {},
      searchQuery: '',
      gridColumns: ['s.no.','answer','action'],
      userData: [],
      editRec : '',
      answers:[],
      sort:['answer'],
  }
  },
  created() {
  this.userInfo();
  },
   methods: {

   
  
   userInfo() {
     
                    this.$http({
                    url: `answers/`+this.$route.params.id,
                    method: 'GET'
                    })
                        .then((res) => {
                        this.editRec =res.data;

                        this.answers=this.editRec['answers'];
                        console.log(this.answers);

                       
                        }, () => {
                        this.has_error = true
                        })
                },
}
}
</script>
