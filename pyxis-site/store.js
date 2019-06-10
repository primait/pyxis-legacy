import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    isSidebarOpen: false
  },
  mutations: {
    toggleSidebar () {
      this.state.isSidebarOpen = !this.state.isSidebarOpen
    }
  },
  getters: {
    isSidebarOpen: state => {
      return state.isSidebarOpen
    }
  },
  actions: {

  }
})
