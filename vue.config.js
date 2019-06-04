const sassExtract = require('sass-extract')
const path = require('path')

const buildDestination = path.resolve(__dirname, 'dist/pyxis-site')
const sourcesRoot = path.resolve(__dirname, 'pyxis-site')
const pyxisSassRoot = path.resolve(__dirname, 'pyxis-sass')

const pyxisVars = sassExtract.renderSync({
  file: path.resolve(pyxisSassRoot, 'scss', '01_base', '_variables.scss')
})

module.exports = {
  outputDir: buildDestination,
  publicPath: '/',
  chainWebpack: config => {
    const buildMode = config.store.get('mode')
    const isDevelopment = buildMode === 'development'
    config
      .resolve.alias
      .set('@', sourcesRoot)
      .set('pyxis-sass', pyxisSassRoot)
    // Interact with entry points
    config
      .entry('app')
      .clear()
      .add(sourcesRoot + '/main.js')
      .end()
    // Modify output settings
    /* .output
    .path('dist/pyxis-site')
    .filename('[name].bundle.js') */
    config.module
      .rule('elm')
      .test(/\.elm$/)
      .use('elm-webpack-loader')
      .loader('elm-webpack-loader')
      .options({
        output: buildDestination,
        optimize: !isDevelopment,
        verbose: !isDevelopment,
        debug: isDevelopment,
        forceWatch: true
      })
      .end()
    config
      .plugin('copy')
      .tap(args => {
        args[0][0].to = buildDestination
        return args
      })
    config.plugin('define').tap((definitions) => {
      definitions[0]['process.env'] = Object.assign(definitions[0]['process.env'], {
        PYXIS_COLORS: JSON.stringify(pyxisVars.vars.global.$colors)
      })
      return definitions
    })
  }
}
