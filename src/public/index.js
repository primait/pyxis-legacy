import { Elm } from "../Pyxis.elm"
import style from "./scss/app.scss"

let app = Elm.Pyxis.init({});

app.ports.copyToClipboard.subscribe(color => {
  console.log(`copying ${color} to clipboard`);
  navigator.clipboard.writeText(color);
  // navigator.clipboard.readText().then(text => {
  //   console.log(`copied ${text} to clipboard`);
  // })
  app.ports.copyAcknowledgement.send(null);
})

console.log("Veramente stocazzo")

