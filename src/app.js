const template      = require('./index.html')
const pyxisStyle    = require('./scss/app.scss')
const primaStyle    = require('./scss/prima.scss')
const introImg      = require('./assets/intro.jpg')
const Elm           = require('./App.elm')
const route         = window.location.pathname

const app = Elm.App.embed(document.getElementById('app'), {
  route: route
})

app.ports.inspectHtml.subscribe(selector => {
  const htmlSource = [].slice.call(document.querySelectorAll(selector)).map(item => beautifyHtml(item.innerHTML))
  app.ports.htmlSnippet.send(htmlSource.join(''))
})

app.ports.copyToClipboard.subscribe(selector => {
  const colorHex = window.getComputedStyle(document.querySelector(selector), null).getPropertyValue('background-color')
  const hexBits = colorHex.split(',').map((item) => parseInt(item.trim().replace('rgb(','').replace(')','')) )
  const r = hexBits[0]
  const g = hexBits[1]
  const b = hexBits[2]
  copyToClipboard(rgbToHex(r, g, b))
  app.ports.copied.send(true)
})

document.addEventListener('click', event => {
  if(event.target.className) {
    const isInput = ~event.target.className.indexOf('a-form__field__');
    const isLabel = ~event.target.className.indexOf('a-form__field__label');
    (isInput && !isLabel) ? null : app.ports.clickedOutside.send(true)
  }
  else {
    app.ports.clickedOutside.send(true)
  }
}, false)

const copyToClipboard = str => { const el = document.createElement('textarea'); el.value = str; el.setAttribute('readonly', ''); el.style.position = 'absolute'; el.style.left = '-9999px'; document.body.appendChild(el); el.select(); document.execCommand('copy'); document.body.removeChild(el); }

const rgbToHex = (r, g, b) => '#' + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1)

const beautifyHtml = str => { const div = document.createElement('div'); div.innerHTML = str.trim(); return formatHtml(div, 0).innerHTML; }

const formatHtml = (node, level) => { let indentBefore = new Array(level++ + 1).join('  '); let indentAfter  = new Array(level - 1).join('  '); let textNode; for(let i = 0; i < node.children.length; i++) { textNode = document.createTextNode('\n' + indentBefore); node.insertBefore(textNode, node.children[i]); formatHtml(node.children[i], level); if (node.lastElementChild == node.children[i]) { textNode = document.createTextNode('\n' + indentAfter); node.appendChild(textNode); } } return node; }
