<template>
  <div id="app">
    <heading></heading>
    <div class="appBody">
      <sidebar></sidebar>
      <main-wrapper>
        <router-view></router-view>
      </main-wrapper>
    </div>
  </div>
</template>

<script>
import Heading from '@/components/Heading.vue'
import Sidebar from '@/components/Sidebar.vue'
import MainWrapper from '@/components/MainWrapper'

export default {
  name: 'app',
  components: {
    MainWrapper,
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

  .appBody {
    display: flex;
  }
</style>
