<template>
  <div class="heading__search__wrapper">
    <input v-model="myInput" v-on:input='onInput' type="text" class="heading__search" :placeholder="placeholder" >
  </div>
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
  created: function () {
    this.myInput = this.inputValue
  },
  watch: {
    inputValue: function (val) {
      this.myInput = val
    }
  },
  methods: {
    onInput: function (evt) {
      this.$emit('input', { text: this.myInput, lastDigit: evt.data })
    }
  }
}
</script>

<style lang="scss">

@import
'@/assets/sass/_variables.scss',
'@/assets/sass/_helpers.scss',
'@/assets/sass/_breakpoints.scss';

$iconSize: 15px;

.heading__search__wrapper {
  display: none;
  align-items: center;
  position: relative;

  &:before {
    content: url('../../assets/icons/search.svg');
    height: $iconSize;
    left: $iconSize + 5px;
    line-height: $iconSize;
    position: absolute;
    width: $iconSize;
  }

  @include mq(small) {
    display: flex;
  }
}

.heading__search {
  border: none;
  border-radius: 100px;
  background-color: rgba(255,255,255,0.1);
  color: color(textAlt, light);
  height: 40px;
  padding: 0 20px 0 (20px + $iconSize * 2);
  width: 250px;

  &::placeholder {
    color: color(textAlt, light);
    opacity: 0.5;
  }
}
</style>
