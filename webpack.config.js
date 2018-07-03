const path                = require('path');
const webpack             = require('webpack');
const CleanWebpackPlugin  = require('clean-webpack-plugin');
const HtmlWebpackPlugin   = require('html-webpack-plugin');
const UglifyJsPlugin      = require('uglifyjs-webpack-plugin')


const config = {

  context: path.resolve(__dirname, 'src'),

  entry: {
    app: './app.js'
  },

  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].bundle.js'
  },

  module: {
    rules: [
      {
        test: /\.scss$/,
        include: [ path.resolve(__dirname, 'src', 'scss') ],
        use: ['style-loader', 'css-loader', 'postcss-loader', 'sass-loader']
      },
      { test: /\.html$/,
        use: ['html-loader']
      },
      {
        test:    /\.elm$/,
        exclude: [ /elm-stuff/, /node_modules/ ],
        loader:  'elm-webpack-loader?verbose=true&warn=true&debug=true',
      },
      {
        test: /\.(ttf|eot|svg|woff(2)?|otf)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'file-loader',
        options: { name: '[name].[ext]', outputPath: 'assets/fonts/'}
      },
    ],

    noParse: /\.elm$/,
  },

  devServer: {
    contentBase: path.resolve(__dirname, "./dist/assets"),
    compress: true,
    port: 8080,
    stats: 'errors-only',
    open: true,
    historyApiFallback: true
  },

  devtool: 'inline-source-map',

  plugins: [
    new CleanWebpackPlugin([ 'dist' ]),
    new HtmlWebpackPlugin({ template: 'index.html' }),
  ],

  optimization: {
    minimizer: [
      new UglifyJsPlugin({
        test: /\.js($|\?)/i
      })
    ]
  }

}

module.exports = config
