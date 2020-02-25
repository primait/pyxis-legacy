<template>
  <div id="app">
    <heading />
    <div class="appBody">
      <sidebar />
      <main-wrapper>
        <router-view />
      </main-wrapper>
    </div>
  </div>
</template>

<script>
import Heading from '@/components/Heading'
import Sidebar from '@/components/Sidebar'
import MainWrapper from '@/components/MainWrapper'

export default {
  name: 'app',
  components: {
    MainWrapper,
    Heading,
    Sidebar
  }
}
</script>

<style lang="scss">
  @import '@/assets/sass/app.scss';

  .appBody {
    display: flex;
  }
</style>
