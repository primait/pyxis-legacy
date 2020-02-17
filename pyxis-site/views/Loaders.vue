<template>
  <container>

    <text-block>
      <h3>Loaders</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <code-inspector :key="type" v-for="type in loaderTypes" :title="type | capitalize">
      <elm-loader class="elm-loader" :flags="getFlags(type)"></elm-loader>
    </code-inspector>

  </container>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge.js'
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'
import CodeInspector from '@/components/CodeInspector.vue'

export default {
  name: 'Loaders',
  components: {
    CodeInspector,
    Container,
    TextBlock,
    'elm-loader': VueElmBridge(require('../elm-components/Loader.elm').Elm.Loader)
  },
  data: function () {
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
  /deep/.elm-loader {
    @import "../elm-components/pyxis.scss";
  }
</style>
