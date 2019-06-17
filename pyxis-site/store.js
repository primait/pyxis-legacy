import Vue from 'vue'
import Vuex from 'vuex'
import GlobalModule from '@/store-modules/AppGlobal.js'

Vue.use(Vuex)

export default new Vuex.Store({
  modules: {
    global: GlobalModule
  }
})
