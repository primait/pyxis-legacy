const path = require('path')
const { CleanWebpackPlugin } = require('clean-webpack-plugin')
const UglifyJsPlugin = require('uglifyjs-webpack-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')

const pyxisRootFolder = path.resolve(__dirname, 'pyxis-themes')

const config = {
  context: pyxisRootFolder,
  entry: {
    /**
     * Transpile pyxis for fonts deploy
     */
    pyxis: path.resolve(pyxisRootFolder, 'Pyxis', 'pyxis.js'),
    prima: path.resolve(pyxisRootFolder, 'PrimaTheme', 'prima.js'),
    primaGuarantees: path.resolve(pyxisRootFolder, 'PrimaGuaranteesTheme', 'primaGuarantees.js')
    // primaPayment: path.resolve(pyxisRootFolder, 'PrimaPaymentTheme', 'primaPayment.js'),
    // primaReservedArea: path.resolve(pyxisRootFolder, 'PrimaReservedAreaTheme', 'primaReservedArea.js'),
    // primaThankYou: path.resolve(pyxisRootFolder, 'PrimaThankYouTheme', 'primaThankYou.js')
  },

  output: {
    path: path.resolve(__dirname, 'dist/pyxis-css'),
    filename: '[name].bundle.[hash].js'
  },
  resolve: {
    alias: {
      'pyxis-assets': path.resolve(__dirname, 'node_modules', '@prima-assicurazioni', 'pyxis-npm', 'src', 'assets'),
      'pyxis-sources': path.resolve(__dirname, 'node_modules', '@prima-assicurazioni', 'pyxis-npm', 'src', 'scss')
    }
  },

  module: {
    rules: [
      {
        test: /\.(sa|sc|c)ss$/,
        include: [path.resolve(pyxisRootFolder)],
        use: [
          { loader: MiniCssExtractPlugin.loader },
          { loader: 'css-loader' },
          { loader: 'postcss-loader', options: { reduceIdents: false } },
          {
            loader: 'sass-loader',
            options: {
              implementation: require('node-sass'),
              sourceMap: false,
              sassOptions: {
                indentedSyntax: false
              }
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
        exclude: /assets\/media/,
        options: { name: '[name].[ext]', outputPath: 'assets/fonts/' }
      },
      {
        test: /\.(jpg|svg|png|gif)(\?v=[0-9]\.[0-9]\.[0-9])?$/,
        loader: 'file-loader',
        exclude: /assets\/fonts/,
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
