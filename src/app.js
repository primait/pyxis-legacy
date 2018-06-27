require('./index.html')
require('./scss/app.scss')

const Elm = require('./App.elm');
const app = Elm.App.embed(document.getElementById('app'))
