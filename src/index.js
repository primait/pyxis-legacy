require('./scss/app.scss')

import YAML from "yaml";
import { flatten } from "./utils"

import ymlItText from './i18n/it.yaml';

const itText = YAML.parse(ymlItText); // TODO: add error handling

import { Elm } from './elm/Pyxis.elm'

Elm.Pyxis.init({
  node: document.getElementById('app'),
  flags: {
    currentPath: window.location.pathname,
    translations: Object.entries(flatten(itText))
  }
})

