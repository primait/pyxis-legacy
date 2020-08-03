require('./scss/app.scss')

import { Elm } from './elm/Pyxis.elm'

Elm.Pyxis.init({
  node: document.getElementById('app'),
  flags: {
    currentPath: window.location.pathname
  }
})

