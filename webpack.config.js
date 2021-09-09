const path = require('path');

module.exports = {
  mode: 'development',
  entry: './entry.js',
  output: {
    filename: 'index.js',
    path: path.resolve(__dirname, 'public'),
  },
  watchOptions: {
    ignored: ['./src/*']
  },
  devServer: {
    watchFiles: ['output/**/*'],
    static: './public',
    open:true,
  }
};