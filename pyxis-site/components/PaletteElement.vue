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
  @import '@/assets/sass/helpers.scss';

  $borderRadius: 8px;

  span {
    display: block;
  }

  .palette-element__wrapper {
    width: 100%;

    @include mq(medium) {
      padding: 5px;
      width: 220px;
    }
  }

  .palette-element__wrapper + .palette-element__wrapper {
     @include mqDown(medium) {
       margin-top: 20px;
    }
  }

  .palette-element {
    display: flex;
    height: 100px;

    @include mq(medium) {
      flex-flow: column;
      height: 220px;
    }
  }

  .palette-element__picker {
    border: 1px solid color(shape);
    border-right: 0;
    border-radius: $borderRadius 0 0 $borderRadius;
    height: 100px;
    overflow: hidden;
    position: relative;
    width: 100px;

    @include mq(medium) {
      border: 1px solid color(shape);
      border-bottom: 0;
      border-radius: $borderRadius $borderRadius 0 0;
      height: 60%;
      width: 100%;
    }

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
    border-left: none;
    border-radius: 0 $borderRadius $borderRadius 0;
    display: flex;
    flex: 1;
    flex-flow: column;
    height: 100px;
    justify-content: space-evenly;
    padding: 15px 20px;

    @include mq(medium) {
      border: 1px solid color(shape);
      border-top: none;
      border-radius: 0 0 $borderRadius $borderRadius;
      height: 50%;
    }
  }

  .variant-name {
    color: color(text, dark);
    font-family: font(heavy);
    font-size: size(base);
  }

  .variant-hex,
  .variant-rgba {
    color: color(text);
    font-family: monospace;
    font-size: 11px;
    margin-top: 5px;
    user-select: all;
  }
</style>
