export default {
  state: {
    isSidebarOpen: false,
    isDesignModeEnabled: false,
    currentSearchQuery: null
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
    },
    setCurrentSearchQuery (state, value) {
      state.currentSearchQuery = value
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
