const path                  = require('path');
const webpack               = require('webpack');
const CleanWebpackPlugin    = require('clean-webpack-plugin');
const HtmlWebpackPlugin     = require('html-webpack-plugin');
const UglifyJsPlugin        = require('uglifyjs-webpack-plugin')
const CopyWebpackPlugin     = require('copy-webpack-plugin')
const MiniCssExtractPlugin  = require('mini-css-extract-plugin');

const config = {

  context: path.resolve(__dirname, 'src'),

  /* `primaGuarantees` viene chiamato per primo così da
  poter essere sovrascritto da `prima` */

  entry: {
    primaGuarantees:  './primaGuarantees.js',
    app:    './app.js',
    prima:  './prima.js',
  },

  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].bundle.[hash].js'
  },

  module: {
    rules: [
      {
        test: /\.scss$/,
        include: [ path.resolve(__dirname, 'src', 'scss') ],
        use: [
          { loader: MiniCssExtractPlugin.loader },
          { loader: 'css-loader' },
          { loader: 'postcss-loader', options: { reduceIdents: false } },
          { loader: 'sass-loader' },
        ]
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
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      },
      {
        test: /\.(ttf|eot|svg|woff(2)?|otf)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'file-loader',
        exclude: /src\/assets\/media/,
        options: { name: '[name].[ext]', outputPath: 'assets/fonts/' }
      },
      {
        test: /\.(jpg|svg|png|gif)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'file-loader',
        exclude: /src\/assets\/fonts/,
        options: { name: '[name].[ext]', outputPath: 'assets/media/' }
      },
      {
        test: /\.txt$/,
        loader: 'file-loader',
        include: [ path.resolve(__dirname, 'src', 'static') ],
        options: { name: '[name].[ext]', outputPath: 'static/' }
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
    new MiniCssExtractPlugin({ filename: '[name].css' }),
    new HtmlWebpackPlugin({ template: 'index.html' }),
    new UglifyJsPlugin({ test: /\.js($|\?)/i }),
    new CopyWebpackPlugin([{ from: 'assets/media/**/**', to: '' }]),
  ],
}

module.exports = config
