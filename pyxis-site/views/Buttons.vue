<template>
  <container>
    <design-mode-btn />
    <text-block>
      <h3>Bottoni a dimensione standard</h3>
      <p>Aggiungere la classe a-btn con i suoi vari modificatori per ottenere un bottone di dimensioni standard</p>
      <p>Un bottone standard di default si dispone automaticamente al centro orizzontale del suo elenento padre</p>
      <p>Le varianti dark sono visibili correttamente solo su un background scuro</p>
    </text-block>

    <code-inspector
      v-for="type in standardButtonTypes"
      :key="type.btn"
      :title="getTitle(type.btn) | capitalize">
      <elm-button
        :flags="getFlags(type.btn)"
        :class="['elm-buttons', { 'bgDark': type.bgDark }]" />
    </code-inspector>

    <text-block>
      <h3>Bottoni a dimensione small</h3>
      <p>Aggiungere il modificatore a-btn--small a un a-btn standard</p>
    </text-block>

    <code-inspector
      v-for="type in smallButtonTypes"
      :key="type.btn"
      :title="getTitle(type.btn) | capitalize">
      <elm-button
        :flags="getFlags(type.btn)"
        :class="['elm-buttons', { 'bgDark': type.bgDark }]" />
    </code-inspector>

    <text-block>
      <h3>Button Group</h3>
      <p>Quando è necessario impilare più bottoni in uno stesso contenuto è opportuno utilizzare la classe m-btnGroup e le sue varianti</p>
      <p>Button Group di default spazia bottoni adiacenti</p>
    </text-block>

    <code-inspector title="Button Group">
      <div
        id="syntaxWrapper"
        class="elm-buttons">
        <div class="m-btnGroup">
          <button class="a-btn a-btn--callout">
            <span>A</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>B</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>C</span>
          </button>
        </div>
      </div>
    </code-inspector>
    <text-block>
      <p>Button group non applica giustificazioni ai bottoni, per ottenere una giustificazione dello spazio si può combinare con le opportune classi di utility</p>
    </text-block>
    <code-inspector title="Button Group giustificato space-between">
      <div
        id="syntaxWrapper"
        class="elm-buttons">
        <div class="m-btnGroup justifyContentBetween">
          <button class="a-btn a-btn--callout">
            <span>A</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>B</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>C</span>
          </button>
        </div>
      </div>
    </code-inspector>
    <code-inspector title="Button Group giustificato space-evenly">
      <div
        id="syntaxWrapper"
        class="elm-buttons">
        <div class="m-btnGroup justifyContentEvenly">
          <button class="a-btn a-btn--callout">
            <span>A</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>B</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>C</span>
          </button>
        </div>
      </div>
    </code-inspector>
    <code-inspector title="Button Group giustificato al centro">
      <div
        id="syntaxWrapper"
        class="elm-buttons">
        <div class="m-btnGroup justifyContentCenter">
          <button class="a-btn a-btn--callout">
            <span>A</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>B</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>C</span>
          </button>
        </div>
      </div>
    </code-inspector>
    <code-inspector title="Button Group giustificato space-around">
      <div
        id="syntaxWrapper"
        class="elm-buttons">
        <div class="m-btnGroup justifyContentAround">
          <button class="a-btn a-btn--callout">
            <span>A</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>B</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>C</span>
          </button>
        </div>
      </div>
    </code-inspector>
    <code-inspector title="Button Group giustificato content-end">
      <div
        id="syntaxWrapper"
        class="elm-buttons">
        <div class="m-btnGroup justifyContentEnd">
          <button class="a-btn a-btn--callout">
            <span>A</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>B</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>C</span>
          </button>
        </div>
      </div>
    </code-inspector>
    <code-inspector title="Button Group giustificato content-start">
      <div
        id="syntaxWrapper"
        class="elm-buttons">
        <div class="m-btnGroup justifyContentStart">
          <button class="a-btn a-btn--callout">
            <span>A</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>B</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>C</span>
          </button>
        </div>
      </div>
    </code-inspector>
    <text-block>
      <h3>Button Group Cover Fluid</h3>
      <p>Aggiungendo il modificatore m-btnGroup--coverFluid i bottoni all'interno crescono in modo il più possibile equispaziato mantenendo i margini tra bottoni adiacenti</p>
      <p>Si può utilizzare questa classe in unione a un container per realizzare bottoni singoli di larghezza arbitraria</p>
      <p>Un bottone all'interno di un gruppo fluido ha una dimensione massima che non dipende dal testo, in caso di shrink oltre la sua dimensione prevista per mantenerlo su una linea il testo potrà scendere su un massimo di due righe e poi verrà tagliato</p>
      <p>I margini automatici sono supportati fino a un massimo di <b>4 bottoni</b> e funziona correttamente solo all'interno di un a-container o a-containerFluid diretto, nel caso di contenitori innestati è necessario sovrascrivere le media query di margine</p>

    </text-block>

    <code-inspector title="Button Group Cover Fluid">
      <div
        id="syntaxWrapper"
        class="elm-buttons">
        <div class="m-btnGroup m-btnGroup--coverFluid">
          <button class="a-btn a-btn--callout">
            <span>A</span>
          </button>
        </div>
      </div>
    </code-inspector>

    <code-inspector title="Button Group Cover Fluid">
      <div
        id="syntaxWrapper"
        class="elm-buttons">
        <div class="m-btnGroup m-btnGroup--coverFluid">
          <button class="a-btn a-btn--callout">
            <span>SONO</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>UN</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>BOTTONE</span>
          </button>
          <button class="a-btn a-btn--callout">
            <span>SONO UN BOTTONE</span>
          </button>
        </div>
      </div>
    </code-inspector>
  </container>
</template>

<script>
import VueElmBridge from '../others/vue-elm-bridge'
import Container from '@/components/Container'
import TextBlock from '@/components/TextBlock'
import CodeInspector from '@/components/CodeInspector'
import DesignModeBtn from '@/components/DesignModeBtn'

export default {
  name: 'Buttons',
  components: {
    DesignModeBtn,
    CodeInspector,
    Container,
    TextBlock,
    ElmButton: VueElmBridge(require('../elm-components/Button.elm').Elm.Button)
  },
  data () {
    return {
      standardButtonTypes: [
        { btn: 'call_out', bgDark: false },
        { btn: 'call_out_dark', bgDark: true },
        { btn: 'primary', bgDark: false },
        { btn: 'primary_dark', bgDark: true },
        { btn: 'secondary', bgDark: false },
        { btn: 'secondary_dark', bgDark: true },
        { btn: 'tertiary', bgDark: false },
        { btn: 'tertiary_dark', bgDark: true }
      ],
      smallButtonTypes: [
        { btn: 'call_out_small', bgDark: false },
        { btn: 'call_out_dark_small', bgDark: true },
        { btn: 'primary_small', bgDark: false },
        { btn: 'primary_dark_small', bgDark: true },
        { btn: 'secondary_small', bgDark: false },
        { btn: 'secondary_dark_small', bgDark: true },
        { btn: 'tertiary_small', bgDark: false },
        { btn: 'tertiary_dark_small', bgDark: true }
      ]
    }
  },
  methods: {
    getFlags (buttonType) {
      return {
        buttonType: buttonType
      }
    },
    getTitle (buttonType) {
      return buttonType.split('_').join(' ')
    }
  }
}
</script>

<style lang="scss" scoped>
  .elm-buttons::v-deep {
    @import "../elm-components/pyxis.scss";
  }

  @import "../assets/sass/utilityClasses";
  .bgDark {
    background-color: color(shape, dark);
  }
</style>
