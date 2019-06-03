<template>
  <div class="palette-element__wrapper">
    <div class="palette-element">
      <div class="palette-element__picker" :style="pickerStyle"></div>
      <div class="palette-element__description">
        <span class="variant-name">{{ variant | capitalize }}</span>
        <span class="variant-hex">{{ hex }}</span>
        <span class="variant-rgba">{{ formattedRGBA }}</span>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PaletteElement',
  props: {
    variant: {
      required: true,
      type: String
    },
    hex: {
      required: true,
      type: String
    },
    rgba: {
      required: true,
      type: Object
    }
  },
  computed: {
    pickerStyle: function () {
      return {
        'background': `rgba(${this.rgba.r}, ${this.rgba.g}, ${this.rgba.b}, ${this.rgba.a})`
      }
    },
    formattedRGBA: function () {
      return `rgba (${this.rgba.r}, ${this.rgba.g}, ${this.rgba.b}, ${this.rgba.a})`
    }
  }
}
</script>

<style lang="scss" scoped>
  @import '../assets/sass/helpers';

  $borderRadius: 10px;
  span {
    display: block;
  }

  .palette-element__wrapper {
    padding: 5px;
  }

  .palette-element {
    width: 200px;
    height: 200px;
    display: flex;
    flex-flow: column;
  }

  .palette-element__picker {
    border-left: 1px solid color(shape);
    border-right: 1px solid color(shape);
    border-top: 1px solid color(shape);
    border-top-left-radius: $borderRadius;
    border-top-right-radius: $borderRadius;
    height: 50%;
    position: relative;

    &:before {
      background-image: url('../assets/images/checker.jpg');
      background-size: auto auto;
      position: absolute;
      content: ' ';
      left: 0;
      right: 0;
      top: 0;
      bottom: 0;
      z-index: -1;
      border-top-left-radius: $borderRadius;
      border-top-right-radius: $borderRadius;
    }
  }

  .palette-element__description {
    border: 1px solid color(shape);
    border-bottom-left-radius: $borderRadius;
    border-bottom-right-radius: $borderRadius;
    display: flex;
    flex-flow: column;
    height: 50%;
    justify-content: space-evenly;
    padding: 10px;
  }

  .variant-name {
    font-weight: 700;
  }

  .variant-hex, .variant-rgba {
    color: color(text);
    font-family: monospace;
    font-size: 11px;
  }
</style>
