export default {
  state: {
    isSidebarOpen: false
  },
  mutations: {
    openSidebar (state) {
      state.isSidebarOpen = true
    },
    closeSidebar (state) {
      state.isSidebarOpen = false
    }
  },
  getters: {
    isSidebarOpen: (state) => {
      return state.isSidebarOpen
    }
  },
  actions: {
    toggleSidebar ({ state, commit }) {
      if (state.isSidebarOpen) {
        commit('closeSidebar')
      } else {
        commit('openSidebar')
      }
    }
  }
}
