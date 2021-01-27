const path = require('path');

const config = {
  entry: {
    index: path.resolve(__dirname, 'src', 'index.ts'),
  },
  module: {
    rules: [
      {
        test: /\.ts$/,
        use: [
          {
            loader: 'ts-loader',
            options: {
              configFile: 'tsconfig.build.json',
            },
          },
        ],
        exclude: /node_modules/,
      },
    ],
  },
  resolve: {
    extensions: ['.ts', '.js'],
  },
  // aws-sdk is already available in the Node.js Lambda environment
  //  so it should not be included in function bundles
  externals: ['aws-sdk'],
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: '[name].js',
    library: '[name]',
    libraryTarget: 'umd',
  },
  target: 'node',
};

module.exports = config;
