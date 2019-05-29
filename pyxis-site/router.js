import Vue from 'vue'
import Router from 'vue-router'

import Home from './views/Home.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home
    },
    {
      path: '/accordions',
      name: 'accordions',
      component: () => import(/* webpackChunkName: "accordions-view" */ '@/views/Accordions.vue'),
      props: {
        title: 'Accordions',
        excerpt: 'Lorem ipsum dolor sit amet'
      }
    },
    {
      path: '/messages',
      name: 'messages',
      component: () => import(/* webpackChunkName: "accordions-view" */ '@/views/Messages.vue'),
      props: {
        title: 'Messages',
        excerpt: 'Lorem ipsum dolor sit amet'
      }
    },
    {
      path: '/tables',
      name: 'tables',
      component: () => import(/* webpackChunkName: "accordions-view" */ '@/views/Messages.vue'),
      props: {
        title: 'Tables',
        excerpt: 'Lorem ipsum dolor sit amet'
      }
    }
  ]
})
