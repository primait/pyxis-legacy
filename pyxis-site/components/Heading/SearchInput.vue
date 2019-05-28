<template>
  <input v-on:input='input' type="text" class="heading__search" :placeholder="placeholder" :value="inputValue">
</template>

<script>
export default {
  name: 'SearchInput',
  props: {
    placeholder: {
      type: String,
      default: 'placeholder',
      required: false
    },
    inputValue: {
      type: String,
      default: null,
      required: false
    }
  },
  data: function () {
    return {
      myInput: ''
    }
  },
  methods: {
    input: function (evt) {
      console.log(evt)
    }
  }
}
</script>

<style lang="scss">
@import "@/assets/sass/app.scss";

.heading__search {
  border: none;
  border-radius: 100px;
  background-color: rgba(255,255,255,0.1);
  color: color(textAlt, light);
  display: none;
  height: 40px;
  margin-left: auto;
  padding: 0 20px;
  width: 250px;

  @include mq(small) {
    display: block;
  }

  &::placeholder {
    color: color(textAlt, light);
    opacity: 0.5;
  }
}
</style>
