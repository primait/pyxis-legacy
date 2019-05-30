<template>
  <div :class="getInspectorClasses()">
      <h4 class="inspector__title" @click="toggleCodeInspector">
        <simple-svg
          :filepath="codeIcon"
          :fill="codeIconColor"
          :width="codeIconWidth"
          :height="codeIconHeight"
          />
          {{title}}
      </h4>
      <div class="inspector__content">
        <div class="inspector__content__sandbox">
          <slot></slot>
        </div>

        <div class="inspector__content__code" v-if="code !== ''" v-highlight>
          <pre class="language-html"><code>{{code}}</code></pre>
        </div>
      </div>
  </div>
</template>

<script>
import codeIcon from '@/assets/icons/code.svg'
import htmlFormatter from 'html-formatter'

const iconColors = {
  default: '#6B70D7',
  active: '#FFFFFF'
}

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
      codeIconWidth: '20px',
      codeIconHeight: '20px',
      codeIconColor: iconColors.default,
      code: ''
    }
  },
  methods: {
    getInspectorClasses () {
      return ['inspector', (this.isActive ? 'is-active' : '')].join(' ')
    },
    getCodeIconColor () {
      return this.codeIconColor === iconColors.default
        ? iconColors.active
        : iconColors.default
    },
    toggleCodeInspector (event) {
      const inspectorNode = event.target.closest('.inspector')

      this.isActive = !this.isActive
      this.codeIconColor = this.getCodeIconColor()

      if (this.isActive) {
        this.code = htmlFormatter.render(inspectorNode.querySelector('#elmSyntaxWrapper').innerHTML.trim())
      } else {
        this.code = ''
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
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
