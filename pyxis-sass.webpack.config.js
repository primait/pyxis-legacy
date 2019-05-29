const path = require('path')
const CleanWebpackPlugin = require('clean-webpack-plugin')
const UglifyJsPlugin = require('uglifyjs-webpack-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')

const config = {

  context: path.resolve(__dirname, 'pyxis-sass'),

  /* `primaGuarantees` viene chiamato per primo così da
  poter essere sovrascritto da `prima` */

  entry: {
    primaGuarantees: './primaGuarantees.js',
    prima: './prima.js'
  },

  output: {
    path: path.resolve(__dirname, 'dist/pyxis-css'),
    filename: '[name].bundle.[hash].js'
  },

  module: {
    rules: [
      {
        test: /\.scss$/,
        include: [path.resolve(__dirname, 'pyxis-sass', 'scss')],
        use: [
          { loader: MiniCssExtractPlugin.loader },
          { loader: 'css-loader' },
          { loader: 'postcss-loader', options: { reduceIdents: false } },
          {
            loader: 'sass-loader',
            options: {
              implementation: require('sass'),
              sourceMap: false,
              indentedSyntax: false
            }
          }
        ]
      },
      {
        test: /\.html$/,
        use: ['html-loader']
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
      }
    ],

    noParse: /\.elm$/
  },

  devtool: 'inline-source-map',

  plugins: [
    new CleanWebpackPlugin(),
    new MiniCssExtractPlugin({ filename: '[name].css' }),
    new UglifyJsPlugin({ test: /\.js($|\?)/i }),
    new CopyWebpackPlugin([{ from: 'assets/media/**/**', to: '' }])
  ]
}

module.exports = config
