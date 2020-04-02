import Vue from 'vue'
import Router from 'vue-router'

import Login from '../pages/Login'
import AccountRegistration from '../pages/AccountRegistration';
import Home from '../pages/Home';
import Posting from '../pages/Posting';
import Default from '../pages/Default';


Vue.use(Router)

export default new Router({
        routes: [
                {
                        path:'/',
                        redirect:'/home'
                }
                ,
                {
                        path: '/home',
                        name: 'home',
                        component: Home,
                }
                ,
                {
                        path: '/login',
                        name: 'login',
                        component: Login
                },
                {
                        path: '/ar',
                        name: 'ar',
                        component: AccountRegistration
                },
                {
                        path:'/posting',
                        name:'Posting',
                        component:Posting,
                },
                {
                        path:'/default',
                        name:'Default',
                        component:Default,
                }
        ]
})
