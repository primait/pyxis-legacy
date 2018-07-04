const template    = require('./index.html')
const pyxisStyle  = require('./scss/app.scss')
const primaStyle  = require('./scss/prima.scss')
const Elm         = require('./App.elm');
const route       = window.location.pathname


const app = Elm.App.embed(document.getElementById('app'), {
  route: route
})

app.ports.copyToClipboard.subscribe(selector => {

  const colorItem = document.querySelector(selector)
  const colorHex = window.getComputedStyle(colorItem, null).getPropertyValue('background-color')
  const splittedHex =
    colorHex
      .split(',')
      .map((item) => parseInt(item.trim().replace('rgb(','').replace(')','')) )

  copyToClipboard(rgbToHex(splittedHex[0], splittedHex[1], splittedHex[2]))

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
