<template>
  <div id="app">
    <heading></heading>
    <sidebar :menu=menu></sidebar>
    <router-view></router-view>
  </div>
</template>

<script>
import routes from '@/others/routes.js'
import Heading from '@/components/Heading'
import Sidebar from '@/components/Sidebar.vue'

export default {
  name: 'app',
  components: {
    Heading, Sidebar
  },
  data: function () {
    return {
      menu: routes
    }
  }
}
</script>

<style lang="scss">
  @import './assets/sass/app.scss';
  #app {
    font-family: 'Avenir', Helvetica, Arial, sans-serif;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
    text-align: center;
    color: #2c3e50;
  }

  #nav {
    padding: 30px;

    a {
      font-weight: bold;
      color: #2c3e50;

      &.router-link-exact-active {
        color: #42b983;
      }
    }
  }
</style>
