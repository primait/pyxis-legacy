<template>
  <container fluid>
    <container>
      <design-mode-btn />
      <text-block>
        <h3>Container</h3>
        <p>I container sono l'elemento base in cui contenere qualunque componente di pyxis e gestire
          l'aspetto
          base della pagina</p>
        <p>I container di default <b>non hanno una flex direction</b> assegnata, utilizzare l'utility class flexDirection per
          impostare una direzione di flexing ed eventualmente specificare un wrap</p>
        <p>I container <b>non applicano</b> di default padding o margini ai componenti interni</p>
        <h4>Container regolari</h4>
        <p>I container regolari hanno una dimensione massima che dipende dal breakpoint e dei margini laterali</p>
      </text-block>
    </container>
    <container :fluid="isDesignModeEnabled">
      <code-inspector title="Container regolare, direzione riga">
        <div
          id="syntaxWrapper"
          :class="codeInspectorContentClasses">
          <div class="a-container directionRow">
            <p
              class="fs-small"
              style="padding: 10px">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum
              amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
            <div class="block-wrapper dashedLeft">
              <div class="block" />
            </div>
          </div>
        </div>
      </code-inspector>
      <code-inspector title="Container regolare, direzione colonna">
        <div
          id="syntaxWrapper"
          :class="codeInspectorContentClasses">
          <div class="a-container directionColumn">
            <p
              class="fs-small"
              style="padding: 10px">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum
              amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut
              ut.</p>
            <div class="block-wrapper dashedTop">
              <div class="block" />
            </div>
          </div>
        </div>
      </code-inspector>
    </container>
    <container>
      <text-block>
        <h4>Container Fluidi</h4>
        <p>I container fluidi occupano sempre il 100% della larghezza della pagina</p>
      </text-block>
    </container>
    <container :fluid="isDesignModeEnabled">
      <code-inspector title="Container fluido, direzione colonna">
        <div
          id="syntaxWrapper"
          :class="codeInspectorContentClasses">
          <div class="a-containerFluid directionColumn">
            <p
              class="fs-small"
              style="padding: 10px">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum
              amet modi
              nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut
              ut.
            </p>
            <div class="block-wrapper dashedTop">
              <div class="block" />
            </div>
          </div>
        </div>
      </code-inspector>
    </container>
    <container>
      <text-block>
        <h3>Casi speciali e combinazioni</h3>
        <h4>Container Utility</h4>
        <p>Tramite i modificatori dei container è possibile creare container che sono fluidi o regolari in base a un breakpoint specifico</p>
        <p>Queste utility seguono il principio mobile first per cui si applicano solo dal breakpoint xsmall a salire, il range 0 - xsmall è coperto dal container scelto</p>
        <p>Il comportamento di base regolare o fluido viene sostituito al comportamento del modificatore <b>solo nel range di un breakpoint specifico</b></p>
      </text-block>
    </container>
    <container :fluid="isDesignModeEnabled">
      <code-inspector title="Container fluido, regolare su small">
        <div
          id="syntaxWrapper"
          :class="codeInspectorContentClasses">
          <div class="a-containerFluid a-containerOnBpSmall directionColumn">
            <p
              class="fs-small"
              style="padding: 10px">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi
              nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.
            </p>
            <div class="block-wrapper dashedTop">
              <div class="block" />
            </div>
          </div>
        </div>
      </code-inspector>
      <code-inspector title="Container regolare, fluido su small">
        <div
          id="syntaxWrapper"
          :class="codeInspectorContentClasses">
          <div class="a-container a-containerFluidOnBpSmall directionColumn">
            <p
              class="fs-small"
              style="padding: 10px">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi
              nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.
            </p>
            <div class="block-wrapper dashedTop">
              <div class="block" />
            </div>
          </div>
        </div>
      </code-inspector>
      <code-inspector title="Container fluido fino a small compreso, regolare a salire">
        <div
          id="syntaxWrapper"
          :class="codeInspectorContentClasses">
          <div class="a-containerFluid a-containerOnBpMedium a-containerOnBpLarge a-containerOnBpXlarge directionColumn">
            <p
              class="fs-small"
              style="padding: 10px">
              Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi
              nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.
            </p>
            <div class="block-wrapper dashedTop">
              <div class="block" />
            </div>
          </div>
        </div>
      </code-inspector>
    </container>
    <container>
      <text-block>
        <h4>Container combinati</h4>
        <p>I container possono essere combinati per ottenere effetti come ad esempio un background colorato al 100% con un contenuto regolare</p>
      </text-block>
    </container>
    <container :fluid="isDesignModeEnabled">
      <code-inspector title="Container regolare dentro a un container fluido">
        <div
          id="syntaxWrapper"
          :class="codeInspectorContentClasses">
          <div class="a-containerFluid">
            <div class="a-container">
              <p
                class="fs-small dashedLeft"
                style="padding: 10px">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi
                nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.
              </p>
              <div class="block-wrapper dashedLeft dashedRight">
                <div class="block" />
              </div>
            </div>
          </div>
        </div>
      </code-inspector>
    </container>
  </container>
</template>

<script>
import Container from '@/components/Container'
import TextBlock from '@/components/TextBlock'
import CodeInspector from '@/components/CodeInspector'
import DesignModeBtn from '@/components/DesignModeBtn'
import { mapGetters } from 'vuex'

export default {
  name: 'Containers',
  components: {
    DesignModeBtn,
    CodeInspector,
    Container,
    TextBlock
  },
  data () {
    return {
      sizes: ['default', 'xsmall', 'small', 'fluid']
    }
  },
  methods: {
    getClass (size) {
      const defaultClass = 'a-container'
      return size === 'default' ? defaultClass : `${defaultClass} ${defaultClass}--${size}`
    }
  },
  computed: {
    ...mapGetters([
      'isDesignModeEnabled'
    ]),
    codeInspectorContentClasses () {
      return {
        'design-mode': this.isDesignModeEnabled,
        'shape': true
      }
    }
  }
}
</script>

<style lang="scss">
  @import '@/assets/sass/helpers.scss';

  .shape > .a-container, .shape > .a-containerFluid {
    background: color(pyxisBrand, light);
    color: color(text, dark);
    // border: 2px dashed rgba(color(pyxisBrand), 0.3);
  }

  .block-wrapper {
    padding: 5px;
  }

  .block {
    width: 100px;
    height: 100px;
    background-color: #f79eb8;
    border-radius: 10px;
  }

  .dashedLeft {
    border-left: 2px dashed rgba(color(pyxisBrand), 0.3);
  }

  .dashedRight {
     border-right: 2px dashed rgba(color(pyxisBrand), 0.3);
   }

  .dashedTop {
    border-top: 2px dashed rgba(color(pyxisBrand), 0.3);
  }

  .dashedBottom {
    border-bottom: 2px dashed rgba(color(pyxisBrand), 0.3);
  }

  .backgroundColored {
    background-color: lavender;
  }

</style>
