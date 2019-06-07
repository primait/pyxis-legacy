<template>
  <a :href="downloadPath" download class="asset-element">
    <span class="asset-element__label">{{label}}</span>
    <div class="asset-element__footer">
      <div class="asset-element__type">{{type}}</div>
      <simple-svg :fill="'#fff'" :filepath="icon.downloadIcon" :height="'22px'" :width="'22px'"/>
    </div>
  </a>
</template>

<script>
import downloadIcon from '@/assets/icons/download.svg'

export default {
  name: 'AssetElement',
  props: {
    downloadPath: {
      type: String,
      required: true
    },
    label: {
      type: String,
      required: true
    },
    type: {
      type: String,
      required: true
    }
  },

  computed: {
    icon () {
      return {
        downloadIcon: downloadIcon
      }
    }
  }
}
</script>

<style lang="scss" scoped>
@import "@/assets/sass/helpers.scss";

.asset-element {
  background-color: color(pyxisBrand, base);
  border-radius: 8px;
  color: color(textAlt, light);
  cursor: pointer;
  display: flex;
  flex-wrap: wrap;
  height: 160px;
  overflow: hidden;
  padding: 30px;
  position: relative;
  text-decoration: none;
  transition: all 0.2s ease-in-out;

  .simple-svg-wrapper {
    transition: all 0.2s ease-in-out;
  }

  &:after {
    content: url("../assets/icons/kit.svg");
    opacity: 0.05;
    position: absolute;
    right: -20px;
    top: -20px;
    width: 110px;
  }

  &:hover {
    background-color: color(pyxisBrand, dark);
  }

  &:active {
    transform: scale(0.98);
  }
}

.asset-element__label {
  font-family: font(heavy);
  font-size: size(medium);
  flex: 1 0 100%;
}

.asset-element__footer {
  display: flex;
  flex: 1;
  justify-content: space-between;
  margin-top: auto;
}

.asset-element__type {
  background-color: rgba(255, 255, 255, 0.1);
  border-radius: 5px;
  font-family: monospace;
  font-size: size(xsmall);
  letter-spacing: 0.5px;
  padding: 6px 12px;
  font-weight: 500;
}
</style>
