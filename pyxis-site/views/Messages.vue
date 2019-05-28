<template>
    <elm-message></elm-message>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge.js'
export default {
  name: 'Messages',
  props: {
    msg: String
  },
  components: {
    'elm-message': VueElmBridge(require('../elm-components/Message.elm').Elm.Message)
  }
}
</script>
