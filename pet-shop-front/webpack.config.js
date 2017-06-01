const webpack = require('webpack')
const ExtractTextPlugin = require('extract-text-webpack-plugin')

module.exports = {
  entry: './src/index.jsx',
  output: {
    path: __dirname + '/public',
    filename: './app.js'
  },
  devServer: {
    port: 4200,
    contentBase: './public',
    overlay: {
      errors: true,
      warnings: true
    }
  },
  resolve: {
    extensions: ['.js', '.jsx'],
    alias: {
      modules: __dirname + '/node_modules'
    }
  },
  module: {
    rules: [
      {
        test: /.js[x]?$/,
        exclude: /node_modules/,
        use: [
          {
            loader: 'babel-loader',
            options: {
              presets: [
                'es2015', 
                'react'
                ],
              plugins: [
                'transform-object-rest-spread'
                ]
              }
            }
          ],
        }, {
          test: /\.css$/,
          use: ExtractTextPlugin.extract({
            fallback: 'style-loader', 
            use: 'css-loader'
          })
        }, {
          test: /\.woff|.woff2|.ttf|.eot|.svg*.*$/,
          use: [ 
            {
              loader: 'file-loader'
            }
          ]
        }
      ]
    },
    plugins: [
      new ExtractTextPlugin('styles.css')
    ]
  }