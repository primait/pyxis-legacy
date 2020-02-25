import Vue from 'vue'
import Vuex from 'vuex'
import GlobalModule from '@/store-modules/AppGlobal'

Vue.use(Vuex)

export default new Vuex.Store({
  ...GlobalModule
})
