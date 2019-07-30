<template>
  <container>

    <text-block>
      <h3>Message</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <code-inspector :key="type" v-for="type in messageTypes" :title="type | capitalize">
      <elm-message class="elm-message" :flags="getFlags(type)"></elm-message>
    </code-inspector>
  </container>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge.js'
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'
import CodeInspector from '@/components/CodeInspector.vue'

export default {
  name: 'Messages',
  components: {
    CodeInspector,
    Container,
    TextBlock,
    'elm-message': VueElmBridge(require('../elm-components/Message.elm').Elm.Message)
  },
  data: function () {
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
  .elm-message::v-deep {
    @import "../elm-components/pyxis.scss";
  }
</style>
