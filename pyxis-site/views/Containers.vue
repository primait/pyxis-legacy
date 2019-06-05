<template>
    <container>
        <text-block>
            <h3>Containers</h3>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
        </text-block>

        <code-inspector :title="size | capitalize" :key="size" v-for="size in sizes">
            <div id="syntaxWrapper" class="shape">
                <div :class="getClass(size)">
                    <p class="fs-small">Lorem ipsum dolor sit amet consectetur adipisicing elit. Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas vero veritatis ea debitis aut ut.</p>
                </div>
            </div>
        </code-inspector>

    </container>
</template>

<script>
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'
import CodeInspector from '@/components/CodeInspector.vue'

export default {
  name: 'Containers',
  components: {
    CodeInspector,
    Container,
    TextBlock
  },
  data: function () {
    return {
      sizes: ['default', 'xsmall', 'small', 'fluid']
    }
  },
  methods: {
    getClass (size) {
      const defaultClass = 'a-container'
      return size === 'default' ? defaultClass : `${defaultClass} ${defaultClass}--${size}`
    }
  }
}
</script>

<style lang="scss">
    @import '@/assets/sass/helpers.scss';

    .shape > .a-container {
        background: color(pyxisBrand, light);
        border: 1px dashed color(pyxisBrand);
        padding: 15px;
        margin: 30px auto;
    }
</style>
