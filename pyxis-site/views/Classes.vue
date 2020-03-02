<template>
  <container>
    <text-block>
      <h3>Classes</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <text-block>
      <h4>Design</h4>
    </text-block>
    <div class="rules">
      <div
        v-for="(match, index) in matches.design"
        :key="index"
        v-highlight
        class="rules__item fsXsmall">
        {{ match }}
      </div>
    </div>

    <text-block>
      <hr/>
      <h4>Colors</h4>
    </text-block>
    <div class="rules">
      <div
        v-for="(match, index) in matches.colors"
        :key="index"
        v-highlight
        class="rules__item fsXsmall">
        {{ match }}
      </div>
    </div>

    <text-block>
      <hr/>
      <h4>Fonts</h4>
    </text-block>
    <div class="rules">
      <div
        v-for="(match, index) in matches.fonts"
        :key="index"
        v-highlight
        class="rules__item fsXsmall">
        {{ match }}
      </div>
    </div>

    <text-block>
      <hr/>
      <h4>Others</h4>
    </text-block>
    <div class="rules">
      <div
        v-for="(match, index) in matches.others"
        :key="index"
        v-highlight
        class="rules__item fsXsmall">
        {{ match }}
      </div>
    </div>
  </container>
</template>

<script>
import Container from '@/components/Container'
import TextBlock from '@/components/TextBlock'
// Keep the comment below
// eslint-disable-next-line import/no-webpack-loader-syntax
import styles from '!css-loader!sass-loader?modules!@/assets/sass/utilityClasses.scss'

let toCamelCase = str => str.split('-').map(s => s[0].toUpperCase() + s.slice(1)).join('')

export default {
  name: 'Classes',
  components: {
    Container,
    TextBlock
  },
  computed: {
    matches () {
      let pyxisStyle = styles[0][1]
      let regExp = /\.(?![amo]-)[\w-]+/igm
      let rules = []
      let matches = {
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

<style lang="scss" scoped>
  @import '@/assets/sass/helpers.scss';

  .rules {
    display: grid;

    @include mq(small) {
      grid-gap: 15px;
      grid-template-columns: repeat(3, 1fr);
    }
  }

  .rules__item {
    border: 1px solid color(shape);
    border-radius: 8px;
    color: color(text, base);
    font-family: monospace;
    padding: 20px;
    text-align: center;
    user-select: all;
    transition: all 0.1s ease-in-out;
    font-size: size(small);
    position: relative;

    &:hover {
      background: color(backgroundAlt);
      color: color(textAlt, light);
      border: 1px solid color(backgroundAlt);
    }

    &::before {
      content: '';
      position: absolute;
      width: 100%;
      height: 100%;
      top:0;
      left: 0;
    }
  }
</style>
