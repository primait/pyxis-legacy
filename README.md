# Pyxis Site

## Startup
- Install node dependencies with yarn
```bash
yarn
```
- Launch local server for development mode
````bash
yarn serve
````
The application is transpiled in dev mode with live reload and served on [http://localhost:8080]

## Build
For build the application for production
```bash
yarn build:site
```
The whole project is transpiled under ```dist/pyxis-site``` folder.

## Serve locally
Http-server is configured to serve prebuild pyxis site (**production**). Once you've built the site as shown in previous step you can launch
```bash
yarn serve:prod
```

## Pre-render PLUGIN
When you build in production mode puppeter and prerender-spa-plugin are used to pre-render several routes (look at vue.config to see which ones).
These static html pages are placed under ```dist/pyxis-site/<route_name>/index.html```
Read the doc for more information on prerendering plugin

[https://github.com/chrisvfritz/prerender-spa-plugin]
