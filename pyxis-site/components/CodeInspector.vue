<template>
    <div :class="inspectorClasses">
      <container :fluid="!isDesignModeEnabled">
        <h4
          class="inspector__title"
          @click="toggleCodeInspector">
          <simple-svg
            :src="require('@/assets/icons/code.svg')"
            :fill="codeIconColor"
            width="20px"
            height="20px"
            custom-class-name="simple-svg-wrapper" />
          {{ title }}
        </h4>
      </container>
      <div class="inspector__content">
        <div :class="inspectorContentSandboxClasses">
          <slot />
        </div>
        <container :fluid="!isDesignModeEnabled">
          <div
            v-if="code"
            v-highlight
            class="inspector__content__code">
            <pre class="language-html">
              <code>
                {{ code }}
              </code>
            </pre>
          </div>
        </container>
      </div>
    </div>
</template>

<script>
import htmlFormatter from 'html-formatter'
import { mapGetters } from 'vuex'
import Container from '@/components/Container'

export default {
  name: 'CodeInspector',
  components: {
    Container
  },
  props: {
    title: {
      type: String,
      required: true
    }
  },
  data () {
    return {
      isActive: false,
      code: null
    }
  },
  methods: {
    formatHtml (str) {
      return htmlFormatter.render(str.replace(/data-v-\w+=""/gi, ''))
    },
    toggleCodeInspector (event) {
      this.isActive = !this.isActive

      try {
        if (this.isActive) {
          const syntaxSelector = event.target.closest('.inspector').querySelector('#syntaxWrapper')
          this.code = this.formatHtml(syntaxSelector.innerHTML.trim())
        } else {
          this.code = null
        }
      } catch {
        this.code = null
      }
    }
  },
  computed: {
    inspectorClasses () {
      return {
        'inspector': true,
        'is-active': this.isActive,
        'design-mode': this.isDesignModeEnabled
      }
    },
    inspectorContentSandboxClasses () {
      return {
        'inspector__content__sandbox': true
      }
    },
    codeIconColor () {
      return this.isActive ? '#FFFFFF' : '#6B70D7'
    },
    ...mapGetters([
      'isDesignModeEnabled'
    ])
  }
}
</script>

<style lang="scss">
  @import '@/assets/sass/syntaxHighlight.scss';
</style>

<style lang="scss" scoped>
  @import '@/assets/sass/helpers.scss';

  $iconWrapperSize: 34px;

  .inspector {
    padding: 50px 0;
    position: relative;

    & + & {
      border-top: 2px solid color(shape, light);
    }
  }

  .inspector__title {
    align-items: center;
    color: color(text, dark);
    font-size: size(large);
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
    margin-bottom: 40px;
  }

  .inspector__content__code {
    background: color(backgroundAlt);
    border-left: 8px solid color(pyxisBrand);
    border-radius: 8px;
    margin-top: 40px;
    overflow: auto;
    padding: 5px;

    pre {
      height: 100%;
    }

    &.is-visible {
      height: 180px;
    }
  }

  ::v-deep .simple-svg-wrapper {
    align-items: center;
    background: color(pyxisBrand, light);
    border-radius: 5px;
    cursor: pointer;
    display: flex;
    line-height: $iconWrapperSize;
    justify-content: center;
    margin-right: 20px;
    text-align: center;
    transition: all 0.3s;
    height: $iconWrapperSize;
    width: $iconWrapperSize;

    .inspector.is-active & {
      background: color(pyxisBrand);
    }
  }

  .language-html {
    white-space: pre-wrap;
  }
</style>
