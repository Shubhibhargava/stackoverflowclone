import 'es6-promise/auto'
import axios from 'axios'
import './bootstrap'
import Vue from 'vue'
import VueAuth from '@websanova/vue-auth'
import VueAxios from 'vue-axios'
import VueRouter from 'vue-router'
import Index from './index'
import auth from './auth'
import router from './router'


// require styles
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'
import DataTable from 'v-data-table';

import SortedTablePlugin from "vue-sorted-table";
import vuetify from '@/plugins/vuetify'

Vue.use(SortedTablePlugin);
import _ from "lodash";

Vue.prototype.$_ = _;
 
// Set Vue globally
window.Vue = Vue
// Set Vue router
Vue.router = router
Vue.use(VueRouter)

Vue.use(DataTable)
Vue.component('pagination', require('laravel-vue-pagination'));


// Set Vue authentication
Vue.use(VueAxios, axios)
axios.defaults.baseURL = `/api`
Vue.use(VueAuth, auth)
// Load Index
Vue.component('index', Index)
const app = new Vue({

  el: '#app',
 
  router,
  vuetify
});
router.beforeEach((to, from, next) => {
  document.title = to.meta.title
  next()
  });