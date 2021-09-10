const path = require('path');
var HardSourceWebpackPlugin = require('hard-source-webpack-plugin');

module.exports = {
  mode: 'development',
  entry: './entry.js',
  output: {
    filename: 'index.js',
    path: path.resolve(__dirname, 'public'),
  },
  watchOptions: {
    aggregateTimeout: 400,
    poll: 1000,
  },
  devServer: {
    static: './public',
    open: true,
    compress: false,
    host: "0.0.0.0",
    port: 8081,
  },
  plugins: [
  ]
};