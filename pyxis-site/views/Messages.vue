<template>
  <container>
    <text-block>
      <h3>Messages</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
      <h4>Questo è il mio h4</h4>
    </text-block>

    <elm-message></elm-message>
  </container>
</template>

<script>
import VueElmBridge from '@/others/vue-elm-bridge.js'
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'

export default {
  name: 'Messages',
  props: {
    msg: String
  },
  components: {
    'elm-message': VueElmBridge(require('../elm-components/Message.elm').Elm.Message),
    Container,
    TextBlock
  }
}
</script>
