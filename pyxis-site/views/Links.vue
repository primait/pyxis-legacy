<template>
  <container :fluid="true">
    <container>
      <text-block>
        <h3>Links</h3>
        <p>Scroll down to see code</p>
      </text-block>
    </container>
    <container>
      <code-inspector title="Regular link" class="dashed">
        <div id="syntaxWrapper">
          <a href="#" class="a-link">
            Text
          </a>
        </div>
      </code-inspector>
      <code-inspector title="Standalone link" class="dashed">
        <div id="syntaxWrapper">
          <a href="#" class="a-link a-link--standalone">
            Text
          </a>
        </div>
      </code-inspector>
    </container>
  </container>
</template>

<script>
import Container from '@/components/Container.vue'
import TextBlock from '@/components/TextBlock.vue'
import CodeInspector from '@/components/CodeInspector.vue'

export default {
  name: 'Links',
  components: {
    CodeInspector,
    Container,
    TextBlock
  }
}
</script>
