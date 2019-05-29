<template>
    <div class="inspector">
        <simple-svg
            :filepath="codeIcon"
            :fill="'#fff'"
            :width="'32px'"
            :height="'32px'"
            />
        <h3>{{ title }}</h3>
    </div>
</template>

<script>
import codeIcon from '@/assets/icons/code.svg'

export default {
  name: 'CodeInspector',
  props: {
    title: {
      type: String,
      required: true
    },
    component: {
      required: true
    }
  },
  data: function () {
    return {
      codeIcon: codeIcon
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style lang="scss" scoped>

</style>
