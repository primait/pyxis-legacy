<template>
  <container>

    <text-block>
      <h3>Accordion</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <code-inspector :key="type" v-for="type in accordionTypes" :title="type | capitalize">
      <elm-accordion class="elm-accordion" :flags="getFlags(type)"></elm-accordion>
    </code-inspector>

  </container>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge.js'
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'
import CodeInspector from '@/components/CodeInspector.vue'

export default {
  name: 'Accordions',
  components: {
    CodeInspector,
    Container,
    TextBlock,
    'elm-accordion': VueElmBridge(require('../elm-components/Accordion.elm').Elm.Accordion)
  },
  data: function () {
    return {
      accordionTypes: ['dark', 'base', 'light']
    }
  },
  methods: {
    getFlags (accordionType) {
      return {
        accordionType: accordionType
      }
    }
  }
}
</script>

<style lang="scss" scoped>
  .elm-accordion::v-deep {
    @import "../elm-components/pyxis.scss";
  }
</style>
