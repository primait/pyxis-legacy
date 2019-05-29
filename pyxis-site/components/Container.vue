<template>
  <main class="main">
    <div class="a-container directionColumn">
      <slot></slot>
    </div>
  </main>
</template>

<script>
export default {
  name: 'Container'
}
</script>

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
