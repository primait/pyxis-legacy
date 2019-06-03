<template>
  <container>

    <text-block>
      <h3>Typography</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
    </text-block>

    <typography-table></typography-table>

  </container>
</template>

<script>
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'
import TypographyTable from '@/components/TypographyTable.vue'

export default {
  name: 'Typography',
  components: {
    Container,
    TextBlock,
    TypographyTable
  }
}
</script>
