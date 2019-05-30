import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import VueSimpleSvg from 'vue-simple-svg'

Vue.config.productionTip = false
Vue.use(VueSimpleSvg)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
