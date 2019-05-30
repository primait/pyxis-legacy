import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueSimpleSvg from 'vue-simple-svg'
import VueCodeHighlight from 'vue-code-highlight'

Vue.config.productionTip = false
Vue.use(VueSimpleSvg)
Vue.use(VueCodeHighlight)

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
