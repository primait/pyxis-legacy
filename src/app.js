const template    = require('./index.html')
const pyxisStyle  = require('./scss/app.scss')
const primaStyle  = require('./scss/prima.scss')
const Elm         = require('./App.elm');
const route       = window.location.pathname


const app = Elm.App.embed(document.getElementById('app'), {
  route: route
})
