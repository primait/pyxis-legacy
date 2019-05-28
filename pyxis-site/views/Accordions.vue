<template>
    <elm-counter></elm-counter>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge.js'
export default {
  name: 'Accordions',
  props: {
    msg: String
  },
  components: {
    'elm-counter': VueElmBridge(require('../elm-components/Counter.elm').Elm.Counter)
  }
}
</script>
