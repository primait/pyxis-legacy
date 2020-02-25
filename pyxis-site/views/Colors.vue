<template>
  <container>
    <text-block>
      <h3>Colors</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem?</p>
      <div
        v-for="(variants, colorName) in pyxisColors"
        :key="colorName"
        class="palette__container">
        <h4>{{ colorName | capitalize }}</h4>
        <div class="palette__row">
          <palette-element
            v-for="(variant, variantName) in variants"
            :key="colorName+variantName"
            :variant="variantName"
            :hex="variant.hex"
            :rgba="variant.rgba" />
        </div>
        <hr />
      </div>
    </text-block>
  </container>
</template>

<script>
import Container from '@/components/Container'
import TextBlock from '@/components/TextBlock'
import PaletteElement from '@/components/PaletteElement'

export default {
  name: 'Colors',
  components: {
    PaletteElement,
    Container,
    TextBlock
  },
  computed: {
    pyxisColors () {
      let PYXYS_COLORS = process.env.PYXIS_COLORS.value
      return (() => {
        let labels = {}
        try {
          for (let label in PYXYS_COLORS) {
            if (PYXYS_COLORS.hasOwnProperty(label)) {
              let color = PYXYS_COLORS[label].value
              if (typeof color === 'undefined') { throw new Error('Undefined color') }
              labels[label] = (() => {
                let variants = {}
                for (let variantLabel in color) {
                  if (color.hasOwnProperty(variantLabel)) {
                    if (typeof color[variantLabel] === 'undefined') { throw new Error('Undefined variant') }
                    let a = typeof (color[variantLabel].value.a) === 'undefined' ? 1 : color[variantLabel].value.a
                    variants[variantLabel] = {
                      rgba: {
                        r: color[variantLabel].value.r,
                        g: color[variantLabel].value.g,
                        b: color[variantLabel].value.b,
                        a: a
                      },
                      hex: color[variantLabel].value.hex
                    }
                  }
                }
                return variants
              })()
            }
          }
        } catch (e) {
          console.debug('Error decoding bootstrap variables', e)
          labels = { error: { at_color_decode: { rgba: { r: 1, g: 1, b: 1, a: 1 }, hex: '#e74c3c' } } }
        }
        return labels
      })()
    }
  }
}
</script>

<style lang="scss" scoped>
  .palette__row {
    display: flex;
    flex-flow: row;
    flex-wrap: wrap;
  }
</style>
