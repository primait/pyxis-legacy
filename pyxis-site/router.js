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
      component: () => import(/* webpackChunkName: "accordions-view" */ '@/views/Accordions.vue')
    },
    {
      path: '/colors',
      name: 'colors',
      component: () => import(/* webpackChunkName: "colors-view" */ '@/views/Colors.vue')
    },
    {
      path: '/icons',
      name: 'icons',
      component: () => import(/* webpackChunkName: "icons-view" */ '@/views/Icons.vue')
    },
    {
      path: '/messages',
      name: 'messages',
      component: () => import(/* webpackChunkName: "messages-view" */ '@/views/Messages.vue')
    },
    {
      path: '/tables',
      name: 'tables',
      component: () => import(/* webpackChunkName: "tables-view" */ '@/views/Tables.vue')
    },
    {
      path: '/typography',
      name: 'typography',
      component: () => import(/* webpackChunkName: "typography-view" */ '@/views/Typography.vue')
    }
  ]
})
