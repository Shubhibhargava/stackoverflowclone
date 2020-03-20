import VueRouter from 'vue-router'
// Pages
import Home from './pages/Home'
import Register from './pages/register'
import Login from './pages/login'
import TopQuestions from './pages/user/TopQuestions'
import AskQuestion from './pages/user/AskQuestion'
import AdminDashboard from './pages/admin/Dashboard'
import viewuser from './components/viewuser'
import viewquestion from './pages/user/ViewQuestion'
import tags from './pages/user/Tags'
import alluser from './pages/user/AllUser'
import viewtag from './pages/user/ViewTag'
import dashboard from './pages/user/Dashboard'
import userlist from './pages/admin/UserList'
import taglist from './pages/admin/TagList'
import questionlist from './pages/admin/QuestionList'
import answerlist from './pages/admin/AnswerList'
import opentag from './components/opentag'
import openquestion from './components/OpenQuestion'
import answerList from './components/AnswerList'
import openanswer from './components/openanswer'
import addnewtag from './components/AddnewTag'
import editquestionuser from './components/EditQuestionuser'
import nopage from './components/nopage'


// Routes
const routes = [
  {
    path: '/',
    name: 'home',
    component: Home,
    meta: {
      auth: undefined,
      title: 'Stackoverflow-Home'
    }
  },
  {
    path: '/register',
    name: 'register',
    component: Register,
    meta: {
      auth: false,
      title: 'Stackoverflow-Signup'
    }
  },
  {
    path: '/login',
    name: 'login',
    component: Login,
    meta: {
      auth: false,
      title: 'Stackoverflow-login'
    }
  },
  // USER ROUTES
  {
    path: '/dashboard',
    name: 'dashboard',
    component: dashboard,
    meta: {
      auth: true,
      title: 'Stackoverflow-userdashboard'
    }
  },
  {
    path: '/topquestions',
    name: 'topquestions',
    component: TopQuestions,
    meta:{
      
      title: 'Stackoverflow-topquestions'
    }
    
  },
  {
    path: '/askquestion',
    name: 'askquestion',
    component: AskQuestion,
    meta: {
      auth: true,
      title: 'Stackoverflow-askquestion'
    }
  },
  {
    path: '/viewquestion/:id',
    name: 'viewquestion',
    component: viewquestion,
    meta: {
      auth: true,
      title: 'Stackoverflow-viewquestion'
    }
  },
  {
    path: '/editquestionuser/:id',
    name: 'editquestionuser',
    component: editquestionuser,
    meta: {
      auth: true,
      title: 'Stackoverflow-editquestion'
    }
  },
  {
    path: '/tags',
    name: 'tags',
    component: tags,
    meta:{
      title : 'Stackoverflow-tags'
    }
   
  },
  {
    path: '/viewtag/:id',
    name: 'viewtag',
    component: viewtag,
    meta:{
      title : 'Stackoverflow-viewtag'
    }
    
    
  },
  {
    path: '/alluser',
    name: 'alluser',
    component: alluser,
    meta:{
      title : 'Stackoverflow-users'
    }
    
  },
  // ADMIN ROUTES
  {
    path: '/admin',
    name: 'admin.dashboard',
    component: AdminDashboard,
    meta: {
      auth: {roles: 2, redirect: {name: 'login'}, forbiddenRedirect: '/403'},
      title: 'stackoverflow-admin'
    }
  },
  {
    path: '/userlist',
    name: 'admin.userlist',
    component: userlist,
    meta: {
      auth: {roles: 2, redirect: {name: 'login'}, forbiddenRedirect: '/403'},
      title: 'stackoverflow-userlist'
    }
  },
  {
    path: '/taglist',
    name: 'admin.taglist',
    component: taglist,
    meta: {
      auth: {roles: 2, redirect: {name: 'login'}, forbiddenRedirect: '/403'},
      title: 'stackoverflow-taglist'
    }
  },
  {
    path: '/notfound',
    name: 'nopage',
    component: nopage,
    meta:{
      title: 'not found'
    }
   
  },
  {
    path: '/addnewtag',
    name: 'addnewtag',
    component: addnewtag,
    meta: {
      auth: {roles: 2, redirect: {name: 'login'}, forbiddenRedirect: '/403'},
      title: 'stackoverflow-newtag'
    }
  },
  {
    path: '/questionlist',
    name: 'admin.questionlist',
    component: questionlist,
    meta: {
      auth: {roles: 2, redirect: {name: 'login'}, forbiddenRedirect: '/403'},
      title: 'stackoverflow-questionlist'
    }
  },
  {
    path: '/answerlist',
    name: 'admin.answerlist',
    component: answerlist,
    meta: {
      auth: {roles: 2, redirect: {name: 'login'}, forbiddenRedirect: '/403'},
      title: 'stackoverflow-answerlist'
    }
  },
  {
    path: '/opentag/:id',
    name: 'opentag',
    component: opentag,
    meta: {
      auth: {roles: 2, redirect: {name: 'login'}, forbiddenRedirect: '/403'},
      title: 'stackoverflow-opentag'
    }
  },
  {
    path: '/openquestion/:id',
    name: 'openquestion',
    component: openquestion,
    meta: {
      auth: {roles: 2, redirect: {name: 'login'}, forbiddenRedirect: '/403'},
      title: 'stackoverflow-openquestion'
    }
  },
  {
    path: '/openanswer/:id',
    name: 'openanswer',
    component: openanswer,
    meta: {
      auth: {roles: 2, redirect: {name: 'login'}, forbiddenRedirect: '/403'},
      title: 'stackoverflow-answer'
    }
  },
  {
    path: '/answerList/:id',
    name: 'answerList',
    component: answerList,
    meta: {
      auth: {roles: 2, redirect: {name: 'login'}, forbiddenRedirect: '/403'},
      title: 'stackoverflow-answerlist'
    }
  },
  {
    path: '/viewuser/:id',
    name: 'viewuser',
    component: viewuser,
    meta: {
      auth: true,
      title: 'stackoverflow-viewuser'
    }
  }
]
const router = new VueRouter({
  history: true,
  mode: 'history',
  routes,
})
export default router