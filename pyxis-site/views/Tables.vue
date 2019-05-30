<template>
    <elm-table></elm-table>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge.js'
export default {
  name: 'Tables',
  props: {
    msg: String
  },
  components: {
    'elm-table': VueElmBridge(require('../elm-components/Table.elm').Elm.Table)
  }
}
</script>
