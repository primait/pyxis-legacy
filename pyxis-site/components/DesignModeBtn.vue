<template>
  <button class="design-mode-btn" v-on:click="toggleDesignMode">
    <simple-svg
      :src="icons.logoSvg"
      fill="#fff"
      width="36px"
      height="36px"
      custom-class-name="simple-svg-wrapper"
    /> Design mode: {{ isDesignModeEnabled }}
  </button>
</template>

<script>
import logoSvg from '@/assets/images/logo.svg'
import { mapActions, mapGetters } from 'vuex'

export default {
  name: 'DesignModeBtn',
  // components: { SearchInput },
  data: function () {
    return {
    }
  },
  computed: {
    icons () {
      return {
        logoSvg: logoSvg
      }
    },
    ...mapGetters([
      'isDesignModeEnabled'
    ])
  },
  methods: {
    ...mapActions([
      'toggleDesignMode'
    ])
  }
}
</script>

<style lang="scss" scoped>
  @import '@/assets/sass/helpers.scss';

  .design-mode-btn{
    align-items: center;
    align-content: center;
    align-self: center;
    border: 2px solid rgba(0, 0, 0, 0);
    border-radius: 80px;
    cursor: pointer;
    display: flex;
    font-size: 14px;
    justify-content: center;
    letter-spacing: 0.8px;
    height: 40px;
    margin: 5px auto;
    min-width: 160px;
    outline: none;
    overflow: hidden;
    padding: 0 25px;
    position: relative;
    text-transform: uppercase;
    white-space: nowrap;
  }
</style>
