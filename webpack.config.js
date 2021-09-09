const path = require('path');

module.exports = {
  mode: 'development',
  entry: './entry.js',
  output: {
    filename: 'index.js',
    path: path.resolve(__dirname, 'public'),
  },
  devServer: {
    static: './public',
    open:true,
  }
};