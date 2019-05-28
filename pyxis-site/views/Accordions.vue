<template>
    <elm-accordion></elm-accordion>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge.js'
export default {
  name: 'Accordions',
  props: {
    msg: String
  },
  components: {
    'elm-accordion': VueElmBridge(require('../elm-components/Accordion.elm').Elm.Accordion)
  }
}
</script>
