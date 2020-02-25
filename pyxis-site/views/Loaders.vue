<template>
  <container>
    <text-block>
      <h3>Loaders</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <code-inspector
      v-for="type in loaderTypes"
      :key="type"
      :title="type | capitalize">
      <elm-loader
        :flags="getFlags(type)"
        class="elm-loader" />
    </code-inspector>

  </container>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge'
import Container from '@/components/Container'
import TextBlock from '@/components/TextBlock'
import CodeInspector from '@/components/CodeInspector'

export default {
  name: 'Loaders',
  components: {
    CodeInspector,
    Container,
    TextBlock,
    'ElmLoader': VueElmBridge(require('../elm-components/Loader.elm').Elm.Loader)
  },
  data () {
    return {
      loaderTypes: ['spinner', 'vehicle']
    }
  },
  methods: {
    getFlags (loaderType) {
      return {
        loaderType: loaderType
      }
    }
  }
}
</script>

<style lang="scss" scoped>
  .elm-loader::v-deep {
    @import "../elm-components/pyxis.scss";
  }
</style>
