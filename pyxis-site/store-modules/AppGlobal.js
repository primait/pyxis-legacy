export default {
  state: {
    isSidebarOpen: false,
    isDesignModeEnabled: false
  },
  mutations: {
    openSidebar (state) {
      state.isSidebarOpen = true
    },
    closeSidebar (state) {
      state.isSidebarOpen = false
    },
    enableDesignMode (state) {
      state.isDesignModeEnabled = true
    },
    disableDesignMode (state) {
      state.isDesignModeEnabled = false
    }
  },
  getters: {
    isSidebarOpen: (state) => {
      return state.isSidebarOpen
    },
    isDesignModeEnabled: (state) => {
      return state.isDesignModeEnabled
    }
  },
  actions: {
    toggleSidebar ({ state, commit }) {
      if (state.isSidebarOpen) {
        commit('closeSidebar')
      } else {
        commit('openSidebar')
      }
    },
    toggleDesignMode ({ state, commit }) {
      if (state.isDesignModeEnabled) {
        commit('disableDesignMode')
      } else {
        commit('enableDesignMode')
      }
    }
  }
}
