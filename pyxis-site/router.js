import Vue from 'vue'
import Router from 'vue-router'

import Home from './views/Home.vue'
import Container from './components/Container.vue'
import Accordions from './views/Accordions.vue'
import Messages from './views/Messages.vue'
import Tables from './views/Tables.vue'

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
      component: Container,
      props: {
        title: 'Accordions',
        excerpt: 'Lorem ipsum dolor sit amet',
        component: Accordions
      }
    },
    {
      path: '/messages',
      name: 'messages',
      component: Container,
      props: {
        title: 'Messages',
        excerpt: 'Lorem ipsum dolor sit amet',
        component: Messages
      }
    },
    {
      path: '/tables',
      name: 'tables',
      component: Container,
      props: {
        title: 'Tables',
        excerpt: 'Lorem ipsum dolor sit amet',
        component: Tables
      }
    }
  ]
})
