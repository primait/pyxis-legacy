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

app.ports.askInnerHTML.subscribe(target => {
  console.log(`asked for ${target}'s innerHTML`);

  const targetDOMNode = document.getElementById(target);
  const innerHTML = targetDOMNode?.innerHTML || ""

  console.log(`${target}'s innerHTML: ${innerHTML}`);

  app.ports.receivedInnerHTML.send({ target, innerHTML });
})

console.log("Veramente stocazzo") // TODO: remove :(

