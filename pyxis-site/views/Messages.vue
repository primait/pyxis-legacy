<template>
  <container>
    <text-block>
      <h3>Message</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <code-inspector
       v-for="type in messageTypes"
       :key="type"
       :title="type | capitalize">
      <elm-message
        :flags="getFlags(type)"
        class="elm-message" />
    </code-inspector>
  </container>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge'
import Container from '@/components/Container'
import TextBlock from '@/components/TextBlock'
import CodeInspector from '@/components/CodeInspector'

export default {
  name: 'Messages',
  components: {
    CodeInspector,
    Container,
    TextBlock,
    'ElmMessage': VueElmBridge(require('../elm-components/Message.elm').Elm.Message)
  },
  data () {
    return {
      messageTypes: ['info', 'success', 'error']
    }
  },
  methods: {
    getFlags (messageType) {
      return {
        messageType: messageType
      }
    }
  }
}
</script>

<style lang="scss" scoped>
  ::v-deep .elm-message {
    @import "../elm-components/pyxis.scss";
  }
</style>
