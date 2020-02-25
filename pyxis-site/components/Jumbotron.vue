<template>
  <div class="o-jumbotron">
    <div class="a-container o-jumbotron__container">
      <div class="o-jumbotron__wrapper">
        <h1 class="o-jumbotron__title">
          {{ title }}
        </h1>
        <h2 class="o-jumbotron__subtitle">
          {{ subtitle }}
        </h2>
        <slot name="content"></slot>
      </div>
      <div
        v-if="canRenderPictureSource() || imageSrc"
        class="o-jumbotron__wrapper--picture">
        <template v-if="imageSrc !== null">
          <img
            :src="imageSrc"
            alt="alt-placeholder"
            class="o-jumbotron__picture">
        </template>
        <template v-else>
          <picture class="o-jumbotron__wrapper--picture">
            <slot name="picture-sources" />
            <img
              :src="pictureFallback"
              class="o-jumbotron__picture"
              alt="alt-placeholder">
          </picture>
        </template>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  name: 'Jumbotron',
  props: {
    title: {
      required: true,
      type: String
    },
    subtitle: {
      required: true,
      type: String
    },
    imageSrc: {
      required: false,
      type: String,
      default: null
    },
    pictureFallback: {
      required: false,
      type: String,
      default: null
    }
  },
  methods: {
    hasPSTemplate () {
      return (typeof this.$slots['picture-sources'] !== 'undefined')
    },
    canRenderPictureSource () {
      if (this.hasPSTemplate()) {
        return this.pictureFallback != null
      } else {
        return false
      }
    }
  },
  mounted () {
    if (!this.canRenderPictureSource() && this.pictureFallback == null) {
      console.warn('you can\'t use slot picture without defining a pictureFallback')
    }
    if (this.hasPSTemplate() && this.imageSrc !== null) {
      console.warn('you can\'t render both a picture element and image, default fallback is image')
    }
  }
}
</script>

<style lang="scss" scoped>
  @import '@/assets/sass/helpers.scss';
  @import '@pyxis-src/scss/04_organisms/_jumbotron.scss';
</style>
