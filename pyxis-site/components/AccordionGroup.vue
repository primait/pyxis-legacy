<template>
        <div class="vue-accordion" id="syntaxWrapper" ref="accordionGroupWrapper">
          <div class="m-accordionGroup" ref="accordionGroup">
            <div v-for="accordion in accordionGroup" :key="accordion.ref" :ref="accordion.ref" :class="getAccordionClass(accordion.ref)">
              <span class="a-accordion__toggle fs-xsmall fw-heavy a-link--alt" v-on:click="accordionClicked(accordion.ref)">I am a light accordion<i
                class="a-icon a-icon-info"></i></span>
              <div class="a-accordion__content fs-small">Lorem ipsum dolor sit amet consectetur adipisicing elit.
                Consequuntur in rerum amet modi nobis maxime autem? Et, iure tempora libero dolorem soluta ipsum, quas
                vero veritatis ea debitis aut ut.
              </div>
            </div>
          </div>
        </div>
</template>

<script>

export default {
  name: 'AccordionGroup',
  components: {

  },
  data: function () {
    return {
      accordionGroup: [{ ref: 'accordion-1', open: false }, { ref: 'accordion-2', open: false }, { ref: 'accordion-3', open: false }]
    }
  },
  methods: {

    accordionClicked (ref) {
      this.accordionGroup = this.accordionGroup.map((accordion) => {
        if (accordion.ref === ref) {
          accordion.open = !accordion.open
        } else {
          accordion.open = false
        }
        return accordion
      })
    },
    getAccordionClass (ref) {
      let filtered = this.accordionGroup.filter((accordion) => accordion.ref === ref)[0]
      if (typeof filtered !== 'undefined' && filtered.open) {
        return 'a-accordion a-accordion--light is-open'
      } else {
        return 'a-accordion a-accordion--light'
      }
    }
  }

}
</script>

<style lang="scss" scoped>
  .vue-accordion {
    @import "../elm-components/pyxis.scss";
  }
</style>
