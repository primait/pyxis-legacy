<template>
  <container :fluid="true">
    <container>
      <text-block>
        <h3>Tooltips</h3>
        <p>Sono disponibili tooltip differenziati per stato (errore o messaggio di attenzione) e differenziati per posizione.</p>
      </text-block>
    </container>
    <hr />
    <container>
      <text-block>
        <h4>Stati tooltip disponibili</h4>
      </text-block>
    </container>
    <container>
      <code-inspector
        title="Warning tooltip"
        class="dashed">
        <div id="syntaxWrapper">
          <div class="tooltip-wrapper tooltip-wrapper--bottom">
            <div>
              <button class="a-btn a-btn--callout">
                <span>Bottone</span>
              </button>
              <div class="a-tooltip a-tooltip--down a-tooltip--warning">
                <span class="fsSmall">
                  <strong>Attenzione</strong>
                  <br />
                  Generico messaggio di errore
                </span>
              </div>
            </div>
          </div>
        </div>
      </code-inspector>
      <code-inspector
        title="Error Tooltip"
        class="dashed">
        <div id="syntaxWrapper">
          <div class="tooltip-wrapper tooltip-wrapper--bottom">
            <div>
              <button class="a-btn a-btn--callout">
                <span>Bottone</span>
              </button>
              <div class="a-tooltip a-tooltip--down a-tooltip--error">
                <span class="fsSmall">
                  <strong>Attenzione</strong>
                  <br />
                  Generico messaggio di errore
                  </span>
              </div>
            </div>
          </div>
        </div>
      </code-inspector>
    </container>
    <hr />
    <container>
      <text-block>
        <h4>Posizioni</h4>
      </text-block>
    </container>
    <container>
      <code-inspector
        title="Top tooltip"
        class="dashed">
        <div id="syntaxWrapper">
          <div class="tooltip-wrapper tooltip-wrapper--top">
            <div>
              <button class="a-btn a-btn--callout">
                <span>Bottone</span>
              </button>
              <div class="a-tooltip a-tooltip--up a-tooltip--warning">
                <span class="fsSmall">
                  <strong>Attenzione</strong>
                  <br />
                  Generico messaggio di errore
                </span>
              </div>
            </div>
          </div>
        </div>
      </code-inspector>
      <code-inspector
        title="Right Tooltip"
        class="dashed">
        <div id="syntaxWrapper">
          <div class="tooltip-wrapper">
            <div>
              <button class="a-btn a-btn--callout">
                <span>Bottone</span>
              </button>
              <div class="a-tooltip a-tooltip--right a-tooltip--error">
                <span class="fsSmall">
                  <strong>Attenzione</strong>
                  <br />
                  Generico messaggio di errore
                </span>
              </div>
            </div>
          </div>
        </div>
      </code-inspector>
      <code-inspector
        title="Bottom tooltip"
        class="dashed">
        <div id="syntaxWrapper">
          <div class="tooltip-wrapper tooltip-wrapper--bottom">
            <div>
              <button class="a-btn a-btn--callout">
                <span>Bottone</span>
              </button>
              <div class="a-tooltip a-tooltip--down a-tooltip--warning">
                <span class="fsSmall">
                  <strong>Attenzione</strong>
                  <br />
                  Generico messaggio di errore
                </span>
              </div>
            </div>
          </div>
        </div>
      </code-inspector>
      <code-inspector
        title="Left Tooltip"
        class="dashed">
        <div id="syntaxWrapper">
          <div class="tooltip-wrapper">
            <div>
              <button class="a-btn a-btn--callout">
                <span>Bottone</span>
              </button>
              <div class="a-tooltip a-tooltip--left a-tooltip--error">
                <span class="fsSmall">
                  <strong>Attenzione</strong>
                  <br />
                  Generico messaggio di errore
                </span>
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
import { mapGetters } from 'vuex'

export default {
  name: 'Containers',
  components: {
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

<style lang="scss" scoped>
  .tooltip-wrapper {
    display: flex;
    align-items: center;
    justify-content: center;

    > div {
      position: relative;
    }
  }

  .tooltip-wrapper--top {
    > div {
      margin-top: 4.375rem;
    }
  }

  .tooltip-wrapper--bottom {
    > div {
      margin-bottom: 4.375rem;
    }
  }
</style>
