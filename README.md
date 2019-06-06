# Pyxis Design System


[Costellazione della bussola](https://it.wikipedia.org/wiki/Bussola_(costellazione))



### Rules:

- Css rules sorted by **alphabetic** order
- *@include*(s) and *@extend*(s) after pure rules
- No more than two nesting levels
- No implicit rules
- No vendor prefixes
- Atoms must be **predictable** and **independent**
- Atoms must have only internal spacing
- Atoms must have active modifiers *(i.e. is-active, is-selected )*
- Stay **DRY**
- Think **mobile-first**


### Startup

- Install packages: `yarn install`
- Install Elm packages: `elm-package install`
- Run local devServer (via Webpack Dev Server): `yarn dev`
- Build for production: `yarn build:prod`


## Deploy del css
Per utilizzare il css su altri progetti, come fosse una dipendenza:
```
deploy/deploy new-tag
```

Aggiornare l'url sui progetti che utilizzano il css:
`https://d3be8952cnveif.cloudfront.net/css/pyxis-x.x.x.css`

dalla versione 1.7.5 in poi
```
https://d3be8952cnveif.cloudfront.net/pyxis/x.x.x/prima.css
https://d3be8952cnveif.cloudfront.net/pyxis/x.x.x/primaGuarantees.css
```

## Prerender PLUGIN
See the doc for more information on prerendering

https://github.com/chrisvfritz/prerender-spa-plugin
