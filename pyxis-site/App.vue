<template>
  <div id="app">
    <heading></heading>
    <sidebar></sidebar>
    <router-view></router-view>
  </div>
</template>

<script>
import Heading from '@/components/Heading.vue'
import Sidebar from '@/components/Sidebar.vue'

export default {
  name: 'app',
  components: {
    Heading,
    Sidebar
  },
  data: function () {
    return {
    }
  }
}
</script>

<style lang="scss">
  @import '@/assets/sass/app.scss';
</style>
