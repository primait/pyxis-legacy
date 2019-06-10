<template>
  <aside class="sidebar" :class="{'is-open' : $store.getters.isSidebarOpen }">
    <div class="sidebar__wrapper">
      <div class="sidebar__heading">
        <div class="sidebar__action" v-on:click="toggleSidebar">
          <simple-svg
                  :fill="'#4D5969'"
                  :filepath="icon.closeIcon"
                  :height="'28px'"
                  :width="'28px'"
                  />
        </div>
        <div class="sidebar__info">
          <div class="sidebar__logo">
            <simple-svg
                  :fill="'#fff'"
                  :filepath="icon.logoSvg"
                  :height="'20px'"
                  :width="'20px'"
                  />
          </div>
          <span class="sidebar__logo__name">Pyxis</span>
          <span class="sidebar__logo__version fsXsmall">{{pyxisLastRelease}}</span>
        </div>
      </div>
    <ul class="domains directionColumn noListStyle">
      <li class="domains__item" v-for="domain in domainsList" :key="toSlug(domain.label)">

        <h4 class="domains__item__title fwHeavy">
          {{ domain.label }}
        </h4>

        <ul class="routes directionColumn noListStyle">
          <li class="routes__item" v-for="route in domain.routes" :key="toSlug(route.label)">
            <router-link class="routes__item__link fwBase" :to="route.path">
              <simple-svg
                :fill="isActive(route.name)"
                :filepath="route.icon"
                :height="'14px'"
                :width="'14px'"
                />
              {{ route.label }}
            </router-link>
          </li>
        </ul>
      </li>
    </ul>
  </div>
  </aside>
</template>

<script>
import routes from '@/others/routes.js'
import helpers from '@/others/helpers.js'
import logoSvg from '@/assets/images/logo.svg'
import closeIcon from '@/assets/icons/close.svg'

export default {
  name: 'Sidebar',
  data: function () {
    return {
      domainsList: [
        { label: '',
          routes: [{ path: '/', label: 'Default', icon: 'default' }]
        }
      ],
      pyxisLastRelease: process.env.PYXIS_VERSION
    }
  },
  created: function () {
    this.domainsList = routes.map(domain => {
      domain.routes = domain.routes.map(route => {
        route.icon = require(`@/assets/icons/${route.icon}.svg`)
        return route
      })
      return domain
    })
  },
  methods: {
    toSlug: function (label) {
      return helpers.toSlug(label)
    },

    isActive: function (pathName) {
      if (this.$route.name === pathName) {
        return '#6B70D7'
      } else {
        return '#4D5969'
      }
    },
    toggleSidebar: function () {
      this.$store.commit('toggleSidebar')
    }
  },
  computed: {
    icon () {
      return {
        logoSvg: logoSvg,
        closeIcon: closeIcon
      }
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/assets/sass/helpers.scss';

.sidebar {
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
  overflow: scroll;
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

  .simple-svg-wrapper {
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

  .simple-svg-wrapper {
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

  &.router-link-active:before {
    transform: scaleX(1);
  }
}

.simple-svg-wrapper {
  display: flex;
  margin-right: 20px;
  transform: translateY(-2px);
}

</style>
