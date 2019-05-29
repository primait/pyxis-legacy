<template>
  <main class="main">
    <div class="a-container directionColumn">
      <h3>{{ title }}</h3>
      <p>{{ excerpt }}</p>
      <component :is="component"></component>
    </div>
  </main>
</template>

<script>
export default {
  name: 'Container',
  props: {
    title: {
      type: String,
      required: true
    },
    excerpt: {
      type: String,
      required: true
    },
    component: {
      required: true
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss" scoped>

.main {
  display: flex;
  flex: 1 0 auto;
  padding: 80px;
}

.a-container {
  display: flex;
  margin: 0 auto;
  width: 90%;
}

.sidebar {
  border-right: 1px solid color(shape);
  display: flex;
  flex: 1 0 auto;
  padding: 80px 0;
  width: 388px;
}
</style>
