<template>
  <container>

    <text-block>
      <h3>Classes</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

  </container>
</template>

<script>
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'

const styles = require('@pyxis-src/scss/pyxis.scss')
console.log('styles', styles)

export default {
  name: 'Classes',
  components: {
    Container,
    TextBlock
  }
}
</script>
