const path = require('path')

const buildDestination = path.resolve(__dirname, 'dist/pyxis-site')
const sourcesRoot = path.resolve(__dirname, 'pyxis-site')

console.log(sourcesRoot)

module.exports = {
  outputDir: buildDestination,
  publicPath: '/pyxis-site',
  chainWebpack: config => {
    const buildMode = config.store.get('mode')
    const isDevelopment = buildMode === 'development'
    config
      .resolve.alias
      .set('@', sourcesRoot)
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
  }
}
