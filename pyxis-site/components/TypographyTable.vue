<template>
  <div class="typography__table">
    <div class="typography__heading">
      <div> Category</div>
      <div> Size <span>XLarge / Large / Medium / Small</span></div>
      <div> Typeface</div>
      <div> Letterspacing</div>
      <div> Case</div>
    </div>
    <div>
      <div v-for="prop in typographyProps" :key="prop" class="typography__row" :data="prop.category">
        <div v-for="(value, name) in prop" :key="value" :class="'typography__item typography__item--' + name">
          <span v-html="value"></span>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'TypographyTable',

  computed: {
    typographyProps () {
      return [
        {
          category: 'h1',
          label: '<h1>Title</h1>',
          size: '36px / 32px / 25px / 22px',
          typeface: 'Avenir Medium',
          letterspacing: '0px',
          case: 'Sentence'
        },
        {
          category: 'h2',
          label: '<h2>Title</h2>',
          size: '28px / 25px / 22px / 16px',
          typeface: 'Avenir Medium',
          letterspacing: '0px',
          case: 'Sentence'
        },
        {
          category: 'h3',
          label: '<h3>Title</h3>',
          size: '24px / 22px / 18px / 16px',
          typeface: 'Avenir Medium',
          letterspacing: '0px',
          case: 'Sentence'
        },
        {
          category: 'h4',
          label: '<h4>Title</h4>',
          size: '18px / 16px / 16px / 14px',
          typeface: 'Avenir Medium',
          letterspacing: '0px',
          case: 'Sentence'
        },
        {
          category: 'p',
          label: '<p>Paragraph</p>',
          size: '18px / 16px / 14px / 14px',
          typeface: 'Avenir Book',
          letterspacing: '0px',
          case: 'Sentence'
        },
        {
          category: 'btn',
          label: '<strong class="strong">Click here</strong>',
          size: '14px',
          typeface: 'Avenir Heavy',
          letterspacing: '0.8px',
          case: 'Uppercase'
        }
      ]
    }
  }
}
</script>

<style lang="scss" scoped>

@import '@/assets/sass/helpers.scss';

  .typography__table {
    padding-top: 50px;
  }

  .typography__heading,
  .typography__row {
    display: flex;

    div {
      flex-wrap: nowrap;
    }
  }

  .typography__row {
    align-items: center;
    border-bottom: 1px solid color(shape, base);
    height: 90px;
  }

  .typography__heading {
    color: color(text, base);
    font-family: font(heavy);
    font-size: 11px;
    letter-spacing: 1px;
    text-transform: uppercase;
    padding-bottom: 20px;

    span {
      background-color: color(pyxisBrand, light);
      border-radius: 5px;
      font-family: font(light);
      font-size: 10px;
      letter-spacing: 0.5px;
      margin-left: 10px;
      text-transform: initial;
      padding: 5px 10px;;
    }

    div {
      flex: 1;
    }
  }

  .typography__item {
    flex: 1;

    &:not(.typography__item--category):not(.typography__item--label) {
      color: color(text, base);
      font-family: monospace;
      font-size: 14px;
    }
  }

  .typography__item--category {
    flex: 0 0 50px;
  }

  .typography__item--size {
    flex: 1.5;
  }

  .typography__item--category {
    color: color(pyxisBrand, base);
    font-family: font(heavy);
    font-size: 12px;
    flex: 0 0 70px;
    letter-spacing: 0.5px;
    padding-top: 3px;
    text-transform: uppercase;
  }

  .typography__item--label {
    color: color(text, dark);
  }

</style>
