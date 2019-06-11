# Pyxis Site


- [Costellazione della bussola](https://it.wikipedia.org/wiki/Bussola_(costellazione)

- [Repository Pyxis NPM](https://github.com/primait/pyxis-npm)

Il progetto di Pyxis viene ora mantenuto sul repo di pyxis NPM. Questo progetto attualmente mantiene il sito pubblico e il deploy dei "temi" di pyxis su ECDN remota

## Startup

- Install packages: `yarn`

### Develop Pyxis-site locally
- Run local  `yarn serve`
- Build for production (pyxis site only): `yarn build:site`
- Build for production (pyxis themes only): `yarn build:css` 


## Deploy del css

Per utilizzare il css su altri progetti come dipendenza servita da ECDN:

- Aggiornare l'ultima versione di pyxis-npm desiderata dal file package.json (usare la versione **esatta**)
- Lanciare yarn e buildare il css in locale per assicurarsi che tutto funzioni correttamente
```bash
yarn
yarn build:css
```
- Taggare il repo con la versione desiderata (possibilmente mantenere la stessa versione di pyxis npm fino a quando i due non divergeranno)
```bash
git tag x.x.x
git push --tags
```
- Verificare su [drone](https://drone.prima.it/primait/pyxis) l'avvio della build e il completamento del deploy su ECDN
- Aggiornare il link dell'ECDN sull'applicazione

> Dalle versioni prima della 1.7.5 pyxis viene servito a questo link:
> - https://d3be8952cnveif.cloudfront.net/css/pyxis-x.x.x.css

> Dalla versione 1.7.5 in poi:
> - https://d3be8952cnveif.cloudfront.net/pyxis/x.x.x/prima.css
> - https://d3be8952cnveif.cloudfront.net/pyxis/x.x.x/primaGuarantees.css
