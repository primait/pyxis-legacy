import Vue from 'vue'
import Vuex from 'vuex'
import initialState from '@/store/initialState.js'
import mutations from '@/store/mutations.js'
import getters from '@/store/getters.js'

Vue.use(Vuex)

export default new Vuex.Store({
  state: initialState,
  mutations: mutations,
  getters: getters,
  actions: {

  }
})
