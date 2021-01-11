const path = require("path")
const webpack = require("webpack")
const MiniCssExtractPlugin = require("mini-css-extract-plugin")
const HtmlWebpackPlugin = require("html-webpack-plugin")
const CopyWebpackPlugin = require("copy-webpack-plugin")

module.exports = (env, options, mode) => {
  return {
    context: path.resolve(__dirname, 'src'),
    entry:
      {
        index: "./public/index.js"
      }
    ,
    output: {
      path: path.resolve(__dirname, 'dist'),
      publicPath: '/',
      filename: '[name].js',
      chunkFilename: '[name].[contenthash].js',
    },
    devServer: {
      contentBase: path.join(__dirname, 'dist'),
      publicPath: "/",
      compress: true,
      port: 8080,
    },
    module: {
      rules: [{
        test: /\.elm$/,
        exclude: [/elm-stuff/, /node_modules/],
        use: {
          loader: 'elm-webpack-loader',
          options: {
            pathToElm: path.resolve(__dirname, 'node_modules/.bin/elm'),
            optimize: mode === 'production',
            verbose: mode === 'development',
            debug: mode === 'development',
            runtimeOptions: ['-A128M', '-H128M', '-n8m']
          }
        }
      },
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: ['babel-loader?cacheDirectory=true']
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader?url=false']
      },
      {
        test: /\.scss$/,
        include: [/scss\/.*/],
        use: [
          {
            loader: MiniCssExtractPlugin.loader
          },
          {
            loader: 'css-loader',
            options: { sourceMap: mode === 'production', url: false }
          },
          {
            loader: 'postcss-loader'
          },
          {
            loader: 'sass-loader',
            options: { sourceMap: mode === 'production' }
          }]
      },
      {
        test: /\.(jpe?g|html|svg|png|gif|webp|otf|ttf|eot|woff(2)?)(\?[a-z0-9=&.]+)?$/,
        loader: 'file-loader',
        options: { name: '[name].[ext]', outputPath: '/' }
      },
      ]
    },
    plugins: [
      new MiniCssExtractPlugin({
        filename: '[name].css',
        chunkFilename: '[id].css',
      }),
      new HtmlWebpackPlugin({
        inject: true
      }),
      new CopyWebpackPlugin({ patterns: [
        {
          from: './public/fonts',
          to: './fonts/[path][name].[ext]'
        }
      ]}),
    ],
    watchOptions: {
      ignored: /node_modules/,
      poll: 300,
    },
    stats: 'minimal',
    devtool: mode === 'production' ? 'source-map' : 'eval',
    bail: true,
    cache: true,
    parallelism: 100,
  }
}
