export default function (elm) {
  return {
    props: {
      ports: {
        type: Function,
        required: false
      },
      flags: {
        type: Object,
        required: false
      }
    },
    render: function (createElement, _context) {
      return createElement('div', null, [
        createElement('div', {
          ref: 'elmNode'
        }, null)
      ])
    },
    mounted: function () {
      let node = this.$refs.elmNode
      let app = elm.init({ node: node, flags: this.$props.flags })

      if (this.$props.ports) {
        this.$props.ports(app.ports)
      }
    }
  }
}
