<template>
  <container>
    <text-block>
      <h3>Table</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <code-inspector title="Table">
      <elm-table class="elm-table" />
    </code-inspector>

  </container>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge'
import Container from '@/components/Container'
import TextBlock from '@/components/TextBlock'
import CodeInspector from '@/components/CodeInspector'

export default {
  name: 'Tables',
  components: {
    CodeInspector,
    Container,
    TextBlock,
    'ElmTable': VueElmBridge(require('../elm-components/Table.elm').Elm.Table)
  }
}
</script>

<style lang="scss" scoped>
  /deep/.elm-table {
    @import "../elm-components/pyxis.scss";
  }
</style>
