<template>
  <container>

    <text-block>
      <h3>Messages</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <text-block :key="type" v-for="type in accordionTypes">
      <h4 @click="onClick">{{ type | capitalize }}</h4>
      <elm-accordion :ref="'elmAccordion'+type" :flags="getFlags(type)"></elm-accordion>
    </text-block>

  </container>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge.js'
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'

export default {
  name: 'Accordions',
  components: {
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
    },
    onClick (event) {
      console.log(event.target.parentElement.querySelector('[id*=slug-accordion]').parentElement.innerHTML)
    }
  }
}
</script>
