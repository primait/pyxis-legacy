<template>
  <container>

    <text-block>
      <h3>Classes</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <div class="rules">
      <div class="rules__item fsXsmall" v-highlight :key="index" v-for="(match, index) in matches">
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

const pyxisStyle = styles[0][1]
const regExp = /^\.(?![amo]-)[\w-]+/igm
const matches = []
pyxisStyle.replace(regExp, (match, g1, g2) => { matches.push(match) })

export default {
  name: 'Classes',
  components: {
    Container,
    TextBlock
  },
  data: function () {
    return {
      matches
    }
  }
}
</script>
