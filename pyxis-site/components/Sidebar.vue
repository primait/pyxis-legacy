<template>
  <aside class="sidebar">
    <ul class="domains directionColumn noListStyle">
      <li class="domains__item" v-for="domain in domainsList" :key="toSlug(domain.label)">

        <h4 class="domains__item__title fwHeavy">
          {{ domain.label }}
        </h4>

        <ul class="routes directionColumn noListStyle">
          <li class="routes__item" v-for="route in domain.routes" :key="toSlug(route.label)">
            <router-link class="routes__item__link fwBase" :to="route.path">
              <object class="routes__item__link__icon" :data="route.icon" type="image/svg+xml"></object>
              {{ route.label }}
            </router-link>
          </li>
        </ul>

      </li>
    </ul>
  </aside>
</template>

<script>
import routes from '@/others/routes.js'
import helpers from '@/others/helpers.js'

export default {
  name: 'Sidebar',
  data: function () {
    return {
      domainsList: [
        { label: '',
          routes: [{ path: '/', label: 'Default', icon: 'default' }]
        }
      ]
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
    }
  }
}
</script>

<style lang="scss" scoped>
@import '@/assets/sass/app.scss';

.sidebar {
  border-right: 1px solid color(shape);
  display: flex;
  flex: 0 1 auto;
  padding: 80px 0;
  width: 388px;
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
    margin-top: 60px;
  }
}

.domains__item__title {
  font-size: 18px;
  margin-bottom: 10px;
  padding-left: 80px;
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
  padding: 0 0 0 100px;
  position: relative;
  text-decoration: none;
  transition: background 0.3s;
  width: 100%;

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

.routes__item__link__icon {
  margin-right: 15px;
  width: 16px;
}
</style>
