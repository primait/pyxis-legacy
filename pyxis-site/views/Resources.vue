<template>
  <container>
    <text-block>
      <h3>Resources</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <div class="resource" v-for="resource in resources" :key="resource">
      <text-block>
        <h4>{{resource.category}}</h4>
      </text-block>

      <div class="resource__wrapper">
        <asset-element
        v-for="item in resource.items"
        :key="item"
        :type="item.type"
        :label="item.label"
        :downloadPath="item.downloadPath"
      ></asset-element>
      </div>
    </div>
  </container>
</template>

<script>
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'
import AssetElement from '@/components/AssetElement.vue'

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
              downloadPath: ''
            },
            {
              label: 'Multicolor Icons',
              type: 'SVG',
              downloadPath: ''
            }
          ]
        },
        {
          category: 'Brand',
          items: [
            {
              label: 'Logo Prima.it',
              type: 'SVG / PNG',
              downloadPath: ''
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
    border-top: 1px solid color(shape, base);
    padding-top: 30px;
  }
}

</style>
