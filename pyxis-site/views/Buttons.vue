<template>
  <container>

    <text-block>
      <h3>Button</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <code-inspector :key="type" v-for="type in buttonTypes" :title="getTitle(type) | capitalize">
      <elm-button :flags="getFlags(type)"></elm-button>
    </code-inspector>

  </container>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge.js'
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'
import CodeInspector from '@/components/CodeInspector.vue'

export default {
  name: 'Buttons',
  components: {
    CodeInspector,
    Container,
    TextBlock,
    'elm-button': VueElmBridge(require('../elm-components/Button.elm').Elm.Button)
  },
  data: function () {
    return {
      buttonTypes: [
        'call_out',
        'call_out_small',
        'call_out_dark',
        'call_out_dark_small',
        'primary',
        'primary_small',
        'primary_dark',
        'primary_dark_small',
        'secondary',
        'secondary_small',
        'secondary_dark',
        'secondary_dark_small',
        'tertiary',
        'tertiary_small',
        'tertiary_dark',
        'tertiary_dark_small'
      ]
    }
  },
  methods: {
    getFlags (buttonType) {
      return {
        buttonType: buttonType
      }
    },
    getTitle (buttonType) {
      return buttonType.split('_').join(' ')
    }
  }
}
</script>
