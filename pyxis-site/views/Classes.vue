<template>
  <container>

    <text-block>
      <h3>Classes</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <hr/>
    <h4>Design</h4>
    <div class="rules">
      <div class="rules__item fsXsmall" v-highlight :key="index" v-for="(match, index) in matches.design">
        {{match}}
      </div>
    </div>
    <hr/>

    <h4>Colors</h4>
    <div class="rules">
      <div class="rules__item fsXsmall" v-highlight :key="index" v-for="(match, index) in matches.colors">
        {{match}}
      </div>
    </div>
    <hr/>

    <h4>Fonts</h4>
    <div class="rules">
      <div class="rules__item fsXsmall" v-highlight :key="index" v-for="(match, index) in matches.fonts">
        {{match}}
      </div>
    </div>
    <hr/>

    <h4>Others</h4>
    <div class="rules">
      <div class="rules__item fsXsmall" v-highlight :key="index" v-for="(match, index) in matches.others">
        {{match}}
      </div>
    </div>

  </container>
</template>

<style lang="scss" scoped>
  @import '@/assets/sass/helpers.scss';

  .rules {
    display: grid;

    @include mq(small) {
      grid-column-gap: 15px;
      grid-template-columns: repeat(5, 1fr);
    }
  }

  .rules__item {
    background: color(backgroundAlt);
    border-radius: 5px;
    color: color(textAlt, light);
    font-family: font(monospace);
    font-weight: 700;
    margin: 15px 0 0 0;
    padding: 15px;
    text-align: center;
  }
</style>

<script>
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'
// Keep the comment below
// eslint-disable-next-line import/no-webpack-loader-syntax
import styles from '!css-loader!sass-loader?modules!@/assets/sass/utilityClasses.scss'

const toCamelCase = str => str.split('-').map(s => s[0].toUpperCase() + s.slice(1)).join('')

export default {
  name: 'Classes',
  components: {
    Container,
    TextBlock
  },
  computed: {
    matches: function () {
      const pyxisStyle = styles[0][1]
      const regExp = /^\.(?![amo]-)[\w-]+/igm
      let rules = []
      const matches = {
        design: [],
        colors: [],
        fonts: [],
        others: []
      }

      pyxisStyle.replace(regExp, (match, g1, g2) => { rules.push(match) })

      rules = rules.map(item => toCamelCase(item))

      matches.design = rules.filter(item => {
        return (
          item.startsWith('.align') ||
          item.startsWith('.border') ||
          item.startsWith('.line') ||
          item.startsWith('.no') ||
          item.startsWith('.overflow') ||
          item.startsWith('.lowercase') ||
          item.startsWith('.sticky') ||
          item.startsWith('.underline') ||
          item.startsWith('.uppercase') ||
          item.startsWith('.word')
        )
      })

      matches.colors = rules.filter(item => {
        return (
          item.startsWith('.bg') ||
          item.startsWith('.c')
        )
      })

      matches.fonts = rules.filter(item => {
        return (
          item.startsWith('.fs') ||
          item.startsWith('.fw')
        )
      })

      matches.others = rules.filter(item => {
        return (
          !matches.colors.includes(item) &&
          !matches.design.includes(item) &&
          !matches.fonts.includes(item)
        )
      })

      return {
        design: [...new Set(matches.design.sort())],
        colors: [...new Set(matches.colors.sort())],
        fonts: [...new Set(matches.fonts.sort())],
        others: [...new Set(matches.others.sort())]
      }
    }
  }
}
</script>
