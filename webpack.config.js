const { CleanWebpackPlugin } = require('clean-webpack-plugin')
const HtmlWebpackPlugin = require('html-webpack-plugin')
const MiniCssExtractPlugin = require('mini-css-extract-plugin')
const CopyWebpackPlugin = require('copy-webpack-plugin')
const StylelintPlugin = require('stylelint-webpack-plugin');
const path = require('path')

module.exports = env => {

    const isProduction = env.NODE_ENV === "production";

    return {
        mode: isProduction ? "production" : "development",
        entry: './src/index.js',
        output: {
            path: path.resolve(__dirname, 'dist'),
            publicPath: '/',
            filename: '[name].bundle.js',
        },
        module: {
            rules: [
                {
                    test: /\.elm$/,
                    exclude: [/elm-stuff/, /node_modules/],
                    loader: 'elm-webpack-loader',
                    options: {
                        pathToElm: path.resolve(__dirname, 'node_modules/.bin/elm'),
                        debug: !isProduction,
                        optimize: isProduction,
                        forceWatch: true,
                        runtimeOptions: ['-A128M', '-H128M', '-n8m']
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
                    use: [
                        {
                            loader: isProduction ? MiniCssExtractPlugin.loader : 'style-loader'
                        },
                        {
                            loader: 'css-loader',
                        },
                        {
                            loader: 'sass-loader',
                            options: {
                                sourceMap: !isProduction
                            }
                        }
                    ]
                },
                {
                    test: /\.(txt|ya?ml)$/i,
                    use: 'raw-loader',
                },
                {
                    test: /i18n\/.+\.ya?ml$/i,
                    loader: 'file-loader',
                    // this is excluded because we embed the fallback translations in the bundle
                    exclude: /it\.yaml/,
                    options: { name: '[name].yaml', outputPath: 'i18n' }
                },
                {
                    test: /\.(jpe?g|svg|png|gif|webp|otf|ttf|eot|woff(2)?)(\?[a-z0-9=&.]+)?$/,
                    loader: 'file-loader',
                    options: { name: '[name].[ext]', outputPath: 'assets' }
                },
            ]
        },
        plugins: [
            new StylelintPlugin({
                context: "src",
                configFile: '.stylelintrc',
                emitError: true,
                emitWarning: true,
                failOnWarning: true,
                ignoreDisables: false,
                syntax: 'scss',
                files: "**/*.scss"
            }),
            new CleanWebpackPlugin(),
            new CopyWebpackPlugin({
                patterns: [
                    { from: 'public', to: 'public' }
                ]
            }),
            new HtmlWebpackPlugin({
                template: 'src/index.html'
            }),
            new MiniCssExtractPlugin()
        ],
        devServer: {
            compress: true,
            port: 3000,
            hot: true,
            publicPath: '/',
            historyApiFallback: {
                index: "/"
            },
            overlay: true,
        }
    }
}
