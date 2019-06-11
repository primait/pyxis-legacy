<template>
  <container>
    <text-block>
      <h3>Jumbotrons</h3>
      <p>Scroll down to see the code</p>
    </text-block>
    <code-inspector title="Jumbotron without img">
        <div id="syntaxWrapper">
          <jumbotron title="Title" subtitle="Subtitle" class="dashed"></jumbotron>
        </div>
    </code-inspector>

    <code-inspector title="Jumbotron with img" class="dashed">
        <div id="syntaxWrapper">
          <jumbotron
            :title="'Title'"
            :subtitle="'Subtitle'"
            :imageSrc="imgSrc">
          </jumbotron>
        </div>
    </code-inspector>

    <code-inspector title="Jumbotron with img and content">
        <div id="syntaxWrapper">
          <jumbotron
            :title="'Title'"
            :subtitle="'Subtitle'"
            :imageSrc="imgSrc"
             class="dashed">
              <template v-slot:content>
                <div id="custom-content">
                  <p>Content</p>
                </div>
              </template>
          </jumbotron>
        </div>
    </code-inspector>

    <code-inspector title="Jumbotron with picture and content">
        <div id="syntaxWrapper">
          <jumbotron
            :title="'Title'"
            :subtitle="'Subtitle'"
            :picture-fallback="pictureFallback"
             class="dashed">
              <template v-slot:content>
                <div id="custom-content">
                  <p>Content</p>
                </div>
              </template>
              <template v-slot:picture-sources>
                <source :srcset="imgSrc"
                  media="(min-width: 800px)">
              </template>
          </jumbotron>
        </div>
    </code-inspector>
  </container>
</template>

<script>
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'
import Jumbotron from '@/components/Jumbotron.vue'
import CodeInspector from '@/components/CodeInspector.vue'

export default {
  name: 'Jumbotrons',
  components: {
    Container,
    TextBlock,
    Jumbotron,
    CodeInspector
  },
  methods: {
  },
  computed: {
    imgSrc: function () {
      return require('@/assets/images/jumbotron-img.png')
    },
    pictureFallback: function () {
      return require('@/assets/images/jumbotron-fallback.png')
    }
  }
}
</script>

<style lang="scss" scoped>
    @import '@/assets/sass/helpers.scss';

    .dashed {
      border: 2px dashed rgba(color(pyxisBrand), 0.3);
      padding: 20px;
    }
</style>
