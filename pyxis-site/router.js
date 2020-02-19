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
      path: '/start',
      name: 'start',
      meta: {
        category: 'overview',
        label: 'start using pyxis',
        icon: 'logo'
      },
      component: () => import(/* webpackChunkName: "empty-view" */ '@/views/Empty.vue')
    },
    {
      path: '/accordions',
      name: 'accordions',
      meta: {
        category: 'components',
        label: 'accordions',
        icon: 'accordions'
      },
      component: () => import(/* webpackChunkName: "accordions-view" */ '@/views/Accordions.vue')
    },
    {
      path: '/buttons',
      name: 'buttons',
      meta: {
        category: 'components',
        label: 'buttons',
        icon: 'buttons'
      },
      component: () => import(/* webpackChunkName: "buttons-view" */ '@/views/Buttons.vue')
    },
    {
      path: '/classes',
      name: 'classes',
      meta: {
        category: 'utilities',
        label: 'classes',
        icon: 'classes'
      },
      component: () => import(/* webpackChunkName: "classes-view" */ '@/views/Classes.vue')
    },
    {
      path: '/colors',
      name: 'colors',
      meta: {
        category: 'design',
        label: 'colors',
        icon: 'colors'
      },
      component: () => import(/* webpackChunkName: "colors-view" */ '@/views/Colors.vue')
    },
    {
      path: '/containers',
      name: 'containers',
      meta: {
        category: 'design',
        label: 'containers',
        icon: 'containers'
      },
      component: () => import(/* webpackChunkName: "containers-view" */ '@/views/Containers.vue')
    },
    {
      path: '/forms',
      name: 'forms',
      meta: {
        category: 'components',
        label: 'Forms',
        icon: 'forms'
      },
      component: () => import(/* webpackChunkName: "empty-view" */ '@/views/Empty.vue')
    },
    {
      path: '/icons',
      name: 'icons',
      meta: {
        category: 'design',
        label: 'icons',
        icon: 'icons'
      },
      component: () => import(/* webpackChunkName: "icons-view" */ '@/views/Icons.vue')
    },
    {
      path: '/jumbotrons',
      name: 'jumbotrons',
      meta: {
        category: 'components',
        label: 'jumbotrons',
        icon: 'jumbotrons'
      },
      component: () => import(/* webpackChunkName: "jumbotrons-view" */ '@/views/Jumbotrons.vue')
    },
    {
      path: '/links',
      name: 'links',
      meta: {
        category: 'components',
        label: 'links',
        icon: 'links'
      },
      component: () => import(/* webpackChunkName: "links-view" */ '@/views/Links.vue')
    },
    {
      path: '/lists',
      name: 'lists',
      meta: {
        category: 'components',
        label: 'lists',
        icon: 'lists'
      },
      component: () => import(/* webpackChunkName: "empty-view" */ '@/views/Empty.vue')
    },
    {
      path: '/loaders',
      name: 'loaders',
      meta: {
        category: 'components',
        label: 'loaders',
        icon: 'loaders'
      },
      component: () => import(/* webpackChunkName: "loaders-view" */ '@/views/Loaders.vue')
    },
    {
      path: '/messages',
      name: 'messages',
      meta: {
        category: 'components',
        label: 'messages',
        icon: 'messages'
      },
      component: () => import(/* webpackChunkName: "messages-view" */ '@/views/Messages.vue')
    },
    {
      path: '/separators',
      name: 'separators',
      meta: {
        category: 'components',
        label: 'separators',
        icon: 'separators'
      },
      component: () => import(/* webpackChunkName: "empty-view" */ '@/views/Empty.vue')
    },
    {
      path: '/tooltips',
      name: 'tooltips',
      meta: {
        category: 'components',
        label: 'tooltips',
        icon: 'tooltips'
      },
      component: () => import(/* webpackChunkName: "tooltips-view" */ '@/views/Tooltips.vue')
    },
    {
      path: '/tabs',
      name: 'tabs',
      meta: {
        category: 'components',
        label: 'tabs',
        icon: 'tabs'
      },
      component: () => import(/* webpackChunkName: "empty-view" */ '@/views/Empty.vue')
    },
    {
      path: '/tables',
      name: 'tables',
      meta: {
        category: 'components',
        label: 'tables',
        icon: 'tabs'
      },
      component: () => import(/* webpackChunkName: "tables-view" */ '@/views/Tables.vue')
    },
    {
      path: '/typography',
      name: 'typography',
      meta: {
        category: 'design',
        label: 'typography',
        icon: 'typography'
      },
      component: () => import(/* webpackChunkName: "typography-view" */ '@/views/Typography.vue')
    },
    {
      path: '/resources',
      name: 'resources',
      meta: {
        category: 'utilities',
        label: 'kit',
        icon: 'kit'
      },
      component: () => import(/* webpackChunkName: "resources-view" */ '@/views/Resources.vue')
    }
  ]
})
