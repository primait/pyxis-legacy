<template>
  <container>
    <text-block>
      <h3>Icons</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <ul class="icon-list">
      <li
        v-for="icon in iconSet"
        :key="icon.name"
        class="icon-list__item" >
        <i :class="icon.prefix + icon.name" />
        <div class="icon-list__item__description">
          <span class="icon-list__item__description__name">
            {{ icon.name }}
          </span>
          <span
            v-if="icon.code"
            class="icon-list__item__description__code">
            {{ icon.code }}
          </span>
        </div>
      </li>
    </ul>
  </container>
</template>

<script>
import Container from '@/components/Container'
import TextBlock from '@/components/TextBlock'
import iconSetConfig from '@pyxis-src/assets/pyxisIconset/selection.json'

const toUnicode = str => str.split('').map(c => '\\u' + ('000' + c.charCodeAt(0).toString(16)).substr(-4)).join('')

export default {
  name: 'Icons',
  components: {
    Container,
    TextBlock
  },
  data: function () {
    return {
      iconSet: iconSetConfig.icons.map(item => {
        return {
          prefix: iconSetConfig.preferences.fontPref.prefix,
          name: item.properties.name,
          code: null
        }
      })
    }
  },
  methods: {
    updateIconCode: function () {
      this.iconSet = this.iconSet.map(icon => {
        const selector = ['.', icon.prefix, icon.name].join('')
        const unicodeIconCode = getComputedStyle(document.querySelector(selector), '::before').getPropertyValue('content')

        return {
          prefix: icon.prefix,
          name: icon.name,
          code: toUnicode(unicodeIconCode).replace(/\\u0022/gi, '').replace(/\\u/gi, '')
        }
      })
    }
  },
  mounted: function () {
    this.updateIconCode()
  }
}
</script>

<style lang="scss" scoped>
    @import '@/assets/sass/helpers.scss';

    .icon-list {
      display: grid;
      grid-gap: 15px;
      grid-template-columns: repeat(2, 1fr);
      list-style: none;
      margin-top: 50px;

      @include mq(large) {
        grid-template-columns: repeat(4, 1fr);
      }
    }

    .icon-list__item {
        align-items: center;
        border: 1px solid color(shape);
        border-radius: 8px;
        display: flex;
        flex: 0 0 48%;
        padding: 30px;

        @include mq(small) {
            flex: 0 0 18%;
        }

        i {
            color: color(text, dark);
            font-size: 28px;
        }
    }

    .icon-list__item__description {
      display: flex;
      flex-direction: column;
      margin-left: 25px;
    }

    .icon-list__item__description__name {
        color: color(text, dark);
        font-size: 14px;
        font-family: font(base);
        margin-bottom: 5px;
        user-select: all;
    }

    .icon-list__item__description__code {
        font-size: 12px;
        font-family: font(monospace);
        user-select: all;
    }

</style>
