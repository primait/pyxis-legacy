<template>
  <div class="heading">
    <div class="heading__menu" v-on:click="toggleSidebar">
      <simple-svg
        :src="icons.menuIcon"
        fill="#fff"
        width="30px"
        height="30px"
        custom-class-name="simple-svg-wrapper" />
    </div>
    <div class="heading__logo">
      <simple-svg
        :src="icons.logoSvg"
        fill="#fff"
        width="36px"
        height="36px"
        custom-class-name="simple-svg-wrapper" />
    </div>
    <div class="heading__intro">
      <div class="heading__name fwHeavy">
        <strong class="fsXlarge">Pyxis</strong>
        <span class="fsXsmall">{{ pyxisLastRelease }}</span>
      </div>
      <span class="fsSmall">Prima.it Design System</span>
    </div>
    <search-input
      :value="currentSearchQuery"
      :placeholder="placeholder"
      @input="setCurrentSearchQuery" />
  </div>
</template>

<script>
import logoSvg from '@/assets/images/logo.svg'
import SearchInput from '@/components/Heading/SearchInput.vue'
import menuIcon from '@/assets/icons/menu.svg'
import { mapActions, mapState, mapMutations } from 'vuex'

export default {
  name: 'Heading',
  components: {
    SearchInput
  },
  data: function () {
    return {
      pyxisLastRelease: process.env.PYXIS_VERSION,
      placeholder: 'search'
    }
  },
  computed: {
    ...mapState([
      'currentSearchQuery'
    ]),
    icons () {
      return {
        logoSvg: logoSvg,
        menuIcon: menuIcon
      }
    }
  },
  methods: {
    ...mapMutations([
      'setCurrentSearchQuery'
    ]),
    ...mapActions([
      'toggleSidebar'
    ])
  }
}
</script>

<style lang="scss" scoped>
@import '@/assets/sass/helpers.scss';

.heading {
  align-items: center;
  background-image: linear-gradient(to right, #667eea, color(brand, base));
  color: color(textAlt, light);
  display: flex;
  justify-content: center;
  height: $headerHeight;
  padding: 0 4vw;

  @include mq(small) {
    justify-content: flex-start;
  }
}

.heading__intro {
  align-items: center;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;

  @include mq(small) {
    align-items: flex-start;
    padding-left: 25px;
    margin-right: auto;
  }
}

.heading__logo {
  $size: 66px;

  align-items: center;
  background-color: rgba(0, 0, 0, 0.1);
  border-radius: 12px;
  display: none;
  justify-content: center;
  height: $size;
  width: $size;

  @include mq(small) {
    display: flex;
  }

  .logo {
    width: 32px;

    svg {
      opacity: 0.3;
    }
  }
}

.heading__name {
  align-items: center;
  display: flex;

  span {
    background-color: rgba(255, 255, 255, 0.1);
    border-radius: 5px;
    margin-left: 15px;
    padding: 5px 10px 3px;
  }
}

.heading__menu {
  left: 0;
  top: 0;
  padding: 1.5rem;
  position: absolute;

  @include mq(small) {
    display: none;
  }
}

/deep/.simple-svg-wrapper {
  display: flex;
}
</style>
