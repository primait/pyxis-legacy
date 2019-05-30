import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueSimpleSvg from 'vue-simple-svg'

Vue.config.productionTip = false
Vue.use(VueSimpleSvg)

Vue.filter('capitalize', function (value) {
  if (!value) return ''
  value = value.toString()
  return value.charAt(0).toUpperCase() + value.slice(1)
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
