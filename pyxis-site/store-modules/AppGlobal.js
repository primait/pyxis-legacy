export default {
  state: {
    sidebarOpen: false
  },
  mutations: {
    setSidebarOpen (state, isOpen) {
      state.sidebarOpen = isOpen
    },
    openSidebar (state) {
      state.sidebarOpen = true
    },
    closeSidebar (state) {
      state.sidebarOpen = false
    }
  },
  getters: {
    isSidebarOpen: (state) => {
      return state.sidebarOpen
    }
  },
  actions: {
    toggleSidebar ({ state, commit }) {
      if (state.sidebarOpen) {
        commit('closeSidebar')
      } else {
        commit('openSidebar')
      }
    }
  }
}
