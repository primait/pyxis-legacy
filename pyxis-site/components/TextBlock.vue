<template>
  <div class="text-block">
    <slot></slot>
  </div>
</template>

<script>
export default {
  name: 'TextBlock'
}
</script>

<style lang="scss" scoped>
@import '@/assets/sass/helpers.scss';

.text-block {
  display: flex;
  flex-direction: column;

  h3 {
    color:color(text, dark);
    font-family: font(heavy);
    font-size: size(xxlarge);
    margin-bottom: 20px;
  }

  h4 {
    color:color(text, dark);
    font-size: size(large);
    margin: 20px 0;
  }

  p {
    color: color(text, base);
    margin: 10px 0;
  }

  hr {
    background-color: color(shape, light);
    height: 2px;
  }
}

</style>
