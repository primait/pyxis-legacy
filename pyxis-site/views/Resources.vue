<template>
  <container>
    <text-block>
      <h3>Resources</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <div
      v-for="resource in resources"
      :key="resource.category"
      class="resource">
      <text-block>
        <h4>{{ resource.category }}</h4>
      </text-block>

      <div class="resource__wrapper">
        <asset-element
          v-for="item in resource.items"
          :key="item.label"
          :type="item.type"
          :label="item.label"
          :download-path="item.downloadPath" />
      </div>
    </div>
  </container>
</template>

<script>
import Container from '@/components/Container'
import TextBlock from '@/components/TextBlock'
import AssetElement from '@/components/AssetElement'

export default {
  name: 'Resources',
  components: {
    Container,
    TextBlock,
    AssetElement
  },
  computed: {
    resources () {
      return [
        {
          category: 'User Interface',
          items: [
            {
              label: 'Prima Design System',
              type: 'Adobe XD',
              downloadPath: '/downloads/prima_design_system.zip' // Static resource located in `public/downloads`
            },
            {
              label: 'Multicolor Icons',
              type: 'SVG',
              downloadPath: '/downloads/multicolor_icons.zip' // Static resource located in `public/downloads`
            }
          ]
        },
        {
          category: 'Brand',
          items: [
            {
              label: 'Logo Prima.it',
              type: 'SVG / PNG',
              downloadPath: '/downloads/logo_prima.zip' // Static resource located in `public/downloads`
            }
          ]
        }
      ]
    }
  }
}
</script>

<style lang="scss" scoped>
@import "@/assets/sass/helpers.scss";

.resource__wrapper {
  display: grid;
  grid-template-columns: repeat(1, 1fr);
  grid-gap: 15px;

  @include mq(small) {
      grid-template-columns: repeat(3, 1fr);
  }
}

.resource {
  margin-top: 50px;

  & + & {
    border-top: 2px solid color(shape, light);
    padding-top: 30px;
  }
}

</style>
