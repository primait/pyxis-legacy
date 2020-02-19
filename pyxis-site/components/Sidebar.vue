<template>
  <aside v-if="!isDesignModeEnabled" class="sidebar" :class="{'is-open' : isSidebarOpen }">
    <div class="sidebar__wrapper">
      <div class="sidebar__heading">
        <div class="sidebar__action" v-on:click="toggleSidebar">
          <simple-svg
            src="@/assets/icons/close.svg"
            fill="#4D5969"
            height="28px"
            width="28px"
            custom-class-name="simple-svg-wrapper" />
        </div>
        <div class="sidebar__info">
          <div class="sidebar__logo">
            <simple-svg
              src="@/assets/images/logo.svg"
              fill="#fff"
              height="20px"
              width="20px"
              custom-class-name="simple-svg-wrapper" />
          </div>
          <span class="sidebar__logo__name">Pyxis</span>
          <span class="sidebar__logo__version fsXsmall">{{ pyxisLastRelease }}</span>
        </div>
      </div>
    <ul class="domains directionColumn noListStyle">
      <li
        v-for="(children, domain) in routes"
        :key="toSlug(domain)"
        class="domains__item">

        <h4 class="domains__item__title fwHeavy">
          {{ domain }}
        </h4>

        <ul class="routes directionColumn noListStyle">
          <li
            v-for="route in children"
            :key="toSlug(route.meta.label)"
            class="routes__item" >
            <router-link
              :to="route"
              class="routes__item__link fwBase">
              <simple-svg
                :src="require(`@/assets/icons/${route.meta.icon}.svg`)"
                height="14px"
                width="14px"
                custom-class-name="simple-svg-wrapper" />
              {{ route.meta.label }}
            </router-link>
          </li>
        </ul>
      </li>
    </ul>
  </div>
  </aside>
</template>

<script>
import helpers from '@/others/helpers'
import { mapGetters, mapActions } from 'vuex'
import groupBy from 'lodash.groupby'

export default {
  name: 'Sidebar',
  data () {
    return {
      pyxisLastRelease: process.env.PYXIS_VERSION
    }
  },
  methods: {
    toSlug (label) {
      return helpers.toSlug(label)
    },
    ...mapActions([
      'toggleSidebar'
    ])
  },
  computed: {
    ...mapGetters([
      'currentSearchQuery',
      'isSidebarOpen',
      'isDesignModeEnabled'
    ]),
    routes () {
      return groupBy(this.$router.options.routes.filter(item => item.meta && item.meta.label.includes(this.currentSearchQuery)), item => item.meta.category)
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/assets/sass/helpers.scss';

.sidebar {
  height: 100vh;
  display: block;
  overflow-x: hidden;
  position: sticky;
  top: 0;

  @include mqDown(small) {
    position: fixed;
    top: 0;
    overflow: scroll;
    width: 250px;
    height: 100%;
    z-index: 9;
    transform: translate3d(-100%, 0, 0);
    transition: transform 0.3s ease-in-out;
    will-change: transform;

    &.is-open {
      transform: translate3d(0%, 0, 0);
    }
  }
}

.sidebar__wrapper {
  border-right: 1px solid color(shape);
  background-color: #fff;
  display: flex;
  flex-direction: column;
  flex: 0 0 auto;
  overflow-y: scroll;
  overflow-x: hidden;
  position: absolute;
  width: 250px;

  @include mq(small) {
    height: 100vh;
    left: 0;
    overflow: scroll;
    position: sticky;
    top: 0;
    padding: 80px 0;
  }

  @include mq(medium) {
    width: 320px;
  }
}

.sidebar__heading {
  align-items: center;
  justify-content: center;
  border-bottom: 1px solid color(shape);
  display: flex;
  flex: 1;
  min-height: 70px;
  margin-bottom: 40px;

  @include mq(small) {
    display: none;
  }
}

.sidebar__info {
  display: flex;
  align-items: center;
  margin-right: auto;
  padding-left: 25px;
}

.sidebar__action {
  align-items: center;
  border-right: 1px solid color(shape);
  display: flex;
  justify-content: center;
  height: 70px;
  width: 70px;

  /deep/.simple-svg-wrapper {
    margin: 0;
    transform: translate(0);
  }
}

.sidebar__logo {
  align-items: center;
  background-color: color(pyxisBrand, base);
  border-radius: 6px;
  display: flex;
  justify-content: center;
  height: 30px;
  margin-right: 10px;
  width: 30px;

  /deep/.simple-svg-wrapper {
    margin: 0;
    padding: 0;
    transform: translate(0);
  }
}

.sidebar__logo__name {
  color: color(pyxisBrand);
  font-family: font(heavy);
  font-size: size(base);
}

.sidebar__logo__version {
  color: color(pyxisBrand);
  font-family: font(heavy);
  font-size: size(xsmall);
  padding-left: 5px;
  opacity: 0.5;
}

.domains,
.routes {
  padding: 0;
  margin: 0;
}

.domains {
  display: flex;
  flex: 1 0 auto;
}

.domains__item {
  padding: 0;
  margin: 0;

  & + & {
    margin-top: 50px;
  }

  &:last-child {
    padding-bottom: 50px;
  }
}

.domains__item__title {
  color: color(text, dark);
  font-size: 18px;
  margin-bottom: 15px;
  padding-left: 30px;
  text-transform: capitalize;

  @include mq(small) {
    padding-left: 4vw;
  }
}

.routes {
  display: flex;
  flex: 1 0 auto;
}

.routes__item {
  align-items: center;
  display: flex;
  height: 40px;
  margin: 0;
  padding: 0;
}

.routes__item__link {
  align-items: center;
  background: #fff;
  color: color(text);
  display: flex;
  font-size: 16px;
  height: 100%;
  padding: 2px 0 0 40px;
  position: relative;
  text-decoration: none;
  text-transform: capitalize;
  transition: background 0.3s;
  width: 100%;

  @include mq(small) {
    padding: 2px 0 0 4.5vw;
  }

  &:before {
    background: #6B70D7;
    bottom: 0;
    content: '';
    height: 100%;
    left: 0;
    position: absolute;
    top: 0;
    transform: scaleX(0);
    transform-origin: 0 100%;
    transition: ease-out 0.2s 0.1s;
    width: 5px;
  }

  &:hover,
  &.router-link-active {
    background: rgba(#6B70D7, 0.06);
    color: #6B70D7;
  }

  /deep/ svg {
    fill: #4D5969;
  }

  &.router-link-active {
    /deep/ svg {
      fill: #6B70D7;
    }
    &::before {
      transform: scaleX(1);
    }
  }

}

/deep/.simple-svg-wrapper {
  display: flex;
  margin-right: 20px;
  transform: translateY(-2px);
}

::-webkit-scrollbar {
  background: color(background);
  width: 0px;
  -webkit-border-radius: 100px;
}

::-webkit-scrollbar:hover {
  background: color(background);
}

::-webkit-scrollbar-thumb:vertical,
::-webkit-scrollbar-thumb:horizontal {
  background: color(background);
  -webkit-border-radius: 100px;
}

::-webkit-scrollbar-thumb:vertical:active,
::-webkit-scrollbar-thumb:horizontal:active {
  background: color(background);
  -webkit-border-radius: 100px;
}

</style>
