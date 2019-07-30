<template>
    <div :class="containerClasses">
      <slot></slot>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
  name: 'Container',
  props: {
    fluid: {
      type: Boolean,
      default: false
    }
  },
  computed: {
    ...mapGetters([
      'isDesignModeEnabled'
    ]),
    containerClasses () {
      return {
        'a-container': !this.fluid,
        'a-containerFluid': this.fluid,
        'directionColumn': true,
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
}

.a-container:not(.design-mode) {
  display: flex;
  margin: 0 auto;
  width: 90%;
}
</style>
