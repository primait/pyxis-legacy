<template>
  <main :class="mainClasses">
    <slot />
  </main>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'MainWrapper',
  computed: {
    ...mapGetters([
      'isDesignModeEnabled'
    ]),
    mainClasses () {
      return {
        'main': true,
        'design-mode': this.isDesignModeEnabled
      }
    }
  }
}
</script>

<style lang="scss" scoped>

  @import '@/assets/sass/helpers.scss';

  .main {
    display: flex;
    flex: 1;
    padding: 60px 0;

    @include mq(small) {
      padding: 80px;
    }

    &.design-mode {
      padding-left: 0;
      padding-right: 0;
      margin-left: 0;
      margin-right: 0;
    }
  }
</style>
