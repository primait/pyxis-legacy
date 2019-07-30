<template>
  <container :fluid="true">
    <design-mode-btn></design-mode-btn>
    <container>
      <text-block>
        <h3>Accordion</h3>
        <p>Un accordion è un elemento che offre una sezione con un titolo e un corpo collassabile</p>
        <p>Un accordion può essere singolo o contenuto in un accordion group</p>
        <h4>Accordion singoli</h4>
      </text-block>
    </container>
    <container :fluid="isDesignModeEnabled">
      <code-inspector :key="type" v-for="type in accordionTypes" :title="type | capitalize">
        <container :fluid="!isDesignModeEnabled">
          <h1>Text</h1>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime
            autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
        </container>
        <elm-accordion class="elm-accordion" :flags="getFlags(type)"></elm-accordion>
        </code-inspector>
    </container>
    <hr>
    <container>
      <text-block>
        <h4>Accordion Group</h4>
        <p>In caso di necessità di impilare più accordions è opportuno raggrupparli all'interno di un accordion
          group</p>
      </text-block>
    </container>
    <container :fluid="isDesignModeEnabled">
      <code-inspector title="Accordion Group di accordion light">
        <container :fluid="!isDesignModeEnabled">
          <h1>Text</h1>
          <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime
            autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
        </container>
        <accordion-group></accordion-group>
      </code-inspector>
    </container>
  </container>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge.js'
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'
import CodeInspector from '@/components/CodeInspector.vue'
import { mapGetters } from 'vuex'
import DesignModeBtn from '@/components/DesignModeBtn'
import AccordionGroup from '@/components/AccordionGroup'

export default {
  name: 'Accordions',
  components: {
    AccordionGroup,
    DesignModeBtn,
    CodeInspector,
    Container,
    TextBlock,
    'elm-accordion': VueElmBridge(require('../elm-components/Accordion.elm').Elm.Accordion)
  },
  data: function () {
    return {
      accordionTypes: ['dark', 'base', 'light']
    }
  },
  methods: {
    getFlags (accordionType) {
      return {
        accordionType: accordionType
      }
    }
  },
  computed: {
    ...mapGetters([
      'isDesignModeEnabled'
    ])
  }
}
</script>

<style lang="scss" scoped>
  .elm-accordion::v-deep {
    @import "../elm-components/pyxis.scss";
  }
</style>
