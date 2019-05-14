const appStyle      = require('./scss/app.scss')
const helpers       = require('./helpers.js')
const templates     = require('./templates.js')
const entryPoint    = require('./index.html')

const isIE          = helpers.detectIE() >= 10 && helpers.detectIE() < 12
const isEdge        = helpers.detectIE() >= 12
const isMobileDevice = window.innerWidth <= 769

import { Elm } from './App.elm'

const flags = {
  host:       window.location.host,
  protocol:   window.location.protocol,
  path:       window.location.href,
}

if(isIE) {
  document.body.className += ' is-IE'
}

if(isEdge) {
  document.body.className += ' is-Edge'
}

if((!!('ontouchstart' in window) && isMobileDevice) || (!!('msmaxtouchpoints' in window.navigator) && isMobileDevice)) {
  document.body.className += ' isTouchDevice'
}

const app = Elm.App.init({ flags: flags })

app.ports.inspectHtml.subscribe(selector => {
  const htmlSource = [].slice.call(document.querySelectorAll(selector)).map(item => helpers.beautifyHtml(item.innerHTML))
  app.ports.htmlSnippet.send(htmlSource.join(''))
})

app.ports.copyToClipboard.subscribe(selector => {
  const colorHex = window.getComputedStyle(document.querySelector(selector), null).getPropertyValue('background-color')
  const hexBits = colorHex.split(',').map((item) => parseInt(item.trim().replace('rgb(','').replace(')','')) )
  const r = hexBits[0]
  const g = hexBits[1]
  const b = hexBits[2]
  helpers.copyToClipboard(helpers.rgbToHex(r, g, b))
  app.ports.copied.send(true)
})

document.addEventListener('click', event => {
  if(event.target.className) {
    const isInput = ~event.target.className.indexOf('a-form__field__')
    const isLabel = ~event.target.className.indexOf('a-form__field__label')
    const isDatePicker = ~event.target.className.indexOf('a-datepicker')
    const isIconCalendar = event.target.classList.contains('a-icon-calendar')

    if((!isIconCalendar && !isInput && !isDatePicker) || isLabel) {
      app.ports.clickedOutside.send(true)
    }
  }
  else {
    app.ports.clickedOutside.send(true)
  }
}, false)
