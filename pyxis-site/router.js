import Vue from 'vue'
import Router from 'vue-router'

import Home from './views/Home.vue'
import Container from './components/Container.vue'
import Accordions from './views/Accordions.vue'

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
      // children: [
      //   { path: '', component: Accordions }
      // ]
    }
  ]
})
