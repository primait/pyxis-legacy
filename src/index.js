require('./scss/app.scss')

import itText from "./i18n/it.json"; // TODO: add i18n loader

import { Elm } from './elm/Pyxis.elm'

Elm.Pyxis.init({
  node: document.getElementById('app'),
  flags: {
    currentPath: window.location.pathname,
    translations: Object
      .entries(itText)
      .map(([k, v]) => [String(k), String(v)])
  }
})

