const template    = require('./index.html')
const pyxisStyle  = require('./scss/app.scss')
const primaStyle  = require('./scss/prima.scss')
const Elm         = require('./App.elm');
const route       = window.location.pathname

const app = Elm.App.embed(document.getElementById('app'), {
  route: route
})

app.ports.inspectHtml.subscribe(selector => {
  const htmlSource = [].slice.call(document.querySelectorAll(selector)).map(item => (item.innerHTML).replace(/\<\/label>/g, '</label>\n\n'))
  app.ports.htmlSnippet.send(htmlSource.join(""))
})

app.ports.copyToClipboard.subscribe(selector => {
  const colorHex  = window.getComputedStyle(document.querySelector(selector), null).getPropertyValue('background-color')
  const hexBits   = colorHex.split(',').map((item) => parseInt(item.trim().replace('rgb(','').replace(')','')) )
  const r = hexBits[0]
  const g = hexBits[1]
  const b = hexBits[2]

  copyToClipboard(rgbToHex(r, g, b))
})

const copyToClipboard = str => {
  const el = document.createElement('textarea');

  el.value = str;
  el.setAttribute('readonly', '');
  el.style.position = 'absolute';
  el.style.left = '-9999px';
  document.body.appendChild(el);
  el.select();
  document.execCommand('copy');
  document.body.removeChild(el);
}

const rgbToHex = (r, g, b) => "#" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1)
