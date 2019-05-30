<template>
  <div :class="classObject">
      <h4 class="inspector__title" @click="toggleCodeInspector">
        <simple-svg
          :filepath="codeIcon"
          :fill="codeIconColor"
          :width="'20px'"
          :height="'20px'"
          />
          {{title}}
      </h4>
      <div class="inspector__content">
        <div class="inspector__content__sandbox">
          <slot></slot>
        </div>

        <div class="inspector__content__code" v-if="code" v-highlight>
          <pre class="language-html"><code>{{code}}</code></pre>
        </div>
      </div>
  </div>
</template>

<script>
import codeIcon from '@/assets/icons/code.svg'
import htmlFormatter from 'html-formatter'

export default {
  name: 'CodeInspector',
  props: {
    title: {
      type: String,
      required: true
    }
  },
  data: function () {
    return {
      isActive: false,
      codeIcon: codeIcon,
      code: null
    }
  },
  methods: {
    toggleCodeInspector (event) {
      this.isActive = !this.isActive

      try {
        if (this.isActive) {
          this.code = htmlFormatter.render(event.target.closest('.inspector').querySelector('#elmSyntaxWrapper').innerHTML.trim())
        } else {
          this.code = null
        }
      } catch {
        this.code = null
      }
    }
  },
  computed: {
    classObject: function () {
      return {
        'inspector': true,
        'is-active': this.isActive
      }
    },
    codeIconColor: function () {
      return this.isActive ? '#FFFFFF' : '#6B70D7'
    }
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
    margin: 30px 0 60px 0;
  }

  .inspector__content {
    margin: 40px 0;
  }

  .inspector__title {
    align-items: center;
    display: flex;
    flex-direction: row;
    justify-content: flex-start;
  }

  .inspector__content__code {
    background: color(backgroundAlt);
    border-left: 5px solid color(pyxisBrand);
    border-radius: 5px;
    margin: 40px 0;
    max-height: 200px;
    overflow: auto;
    padding: 5px;
  }

  .simple-svg-wrapper {
    align-items: center;
    background: color(pyxisBrand, light);
    border-radius: 5px;
    cursor: pointer;
    display: flex;
    line-height: $iconWrapperSize;
    justify-content: center;
    margin-right: 15px;
    text-align: center;
    transition: all 0.3s;
    height: $iconWrapperSize;
    width: $iconWrapperSize;

    .inspector.is-active & {
      background: color(pyxisBrand);
    }
  }
</style>
