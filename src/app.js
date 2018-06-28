require('./index.html')
require('./scss/app.scss')
require('./scss/prima.scss')

const Elm = require('./App.elm');
const app = Elm.App.embed(document.getElementById('app'))
