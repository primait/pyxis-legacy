<template>
  <container fluid>
    <container>
      <text-block>
        <h3>Form</h3>
        <p>Made in Elm with embedded configuration</p>
      </text-block>
    </container>
    <hr />
    <container>
      <code-inspector
        title="Small form"
        class="dashed">
          <elm-form :class="['elm-form']" />
      </code-inspector>
    </container>
  </container>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge'
import Container from '@/components/Container'
import TextBlock from '@/components/TextBlock'
import CodeInspector from '@/components/CodeInspector'

export default {
  name: 'formComponent',
  components: {
    CodeInspector,
    Container,
    TextBlock,
    ElmForm: VueElmBridge(require('../elm-components/Form.elm').Elm.Form)
  }
}
</script>

<style lang="scss" scoped>
  ::v-deep .elm-form {
    @import "../elm-components/pyxis.scss";
  }
</style>
