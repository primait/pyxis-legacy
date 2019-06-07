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
      path: '/containers',
      name: 'containers',
      component: () => import(/* webpackChunkName: "containers-view" */ '@/views/Containers.vue')
    },
    {
      path: '/icons',
      name: 'icons',
      component: () => import(/* webpackChunkName: "icons-view" */ '@/views/Icons.vue')
    },
    {
      path: '/jumbotrons',
      name: 'jumbotrons',
      component: () => import(/* webpackChunkName: "jumbotrons-view" */ '@/views/Jumbotrons.vue')
    },
    {
      path: '/loaders',
      name: 'loaders',
      component: () => import(/* webpackChunkName: "loaders-view" */ '@/views/Loaders.vue')
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
