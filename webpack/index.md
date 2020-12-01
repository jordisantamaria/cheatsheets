# Install webpack

yarn add webpack webpack-cli -D

Run by command line: npx webpack 

Run by package.json: webpack --config webpack.config.js

By default, webpack include Ecmascript import modules.

# Basics

```javascript
module.exports = {
  entry: './index.js',
  mode: 'development',
  output: {
    path: path.resolve(__dirname),
    filename: 'bundle.js'
  }
}
```
## Entry

Los ficheros de entrada desde el que se generara el bundle.js

## Output

Los ficheros de salida que se generaran en dist

## Mode

Se puede configurar modo development / production

En production comprime el fichero en 1 sola linia, en dev lo hace mas leible y
se suele crear un servidor de desarrollo con hot reloading.

# With config file

webpack.config.js

# Importing assets (img, css, fonts, etc..)

Para permitir la sintaxi de import, incluimos loaders.

```javascript
import './style.css';
import './style.xml';
import './style.png';
```

```javascript
module: {
      rules: [
        {
          test: /\.css$/,
          use: [
            'style-loader',
            'css-loader'
          ],
        },
       {
         test: /\.(png|svg|jpg|gif)$/,
         use: [
           'file-loader',
         ],
       },
      ],
    },
```

Cuando url-loader carga el fichero inline en binario en formato base64, si sobrepasa
el limite, cargara el fichero a parte, usando file-loader.

En postCss el formato css se comparte entre los 2 loaders, por lo que hay
que marcar un orden de prioridad para que no colapsen los loaders.

```javascript
{
        test: /\.css|postcss$/,
          {
            loader: 'css-loader',
            options: {
              importLoaders: 1
            }
          },
          'postcss-loader',
        ]
      },
```

# Plugins

## Separar el css del bundle y pasarlo a fichero css en dist

MiniCssExtractPlugin

## Generating html output

Para generar el html resultado, importando el bundle.js resultante usamos html-webpack-plugin

```javascript
const path = require('path');
 const HtmlWebpackPlugin = require('html-webpack-plugin');

  module.exports = {
    entry: {
      app: './src/index.js',
      print: './src/print.js',
    },
   plugins: [
     new HtmlWebpackPlugin({
       title: 'Output Management',
     }),
   ],
    output: {
      filename: '[name].bundle.js',
      path: path.resolve(__dirname, 'dist'),
    },
  };
```

# Cleaning dist folder

Para mantener el dist, solo los ficheros generados por webpack,
usamos clean-webpack-plugin

```javascript
plugins: [
     new CleanWebpackPlugin(),
    ]
```

# Source Maps

Para poder encontrar el trazo de en que fichero se genero el error,
una vez que se ejecuta el codigo en el bundle, donde esta todo junto.
Source map => map your compiled code back to your original source code
```
devtool: 'inline-source-map',
```

# Dev server

Para que se abra un servidor local con hot reloading

```
yarn add -D webpack-dev-server

devServer: {
 contentBase: './dist',
},

script: webpack-dev-server --open
```

# Code Splitting

Hay 3 formas de aplicarlo

- Entry Points: Manually split code using entry configuration.
- Prevent Duplication: Use the SplitChunksPlugin to dedupe and split chunks.
- Dynamic Imports: Split code via inline function calls within modules.

## Entry points:

The problem is shared code is being duplicated in both entrys
```
entry: {
    index: './src/index.js',
    another: './src/another-module.js',
},
output: {
    path: path.resolve(__dirname, 'dist', 'js'),
    filename: 'bundle-[name].js'
  }
```

### Prevent Duplication

```
optimization: {
 splitChunks: {
   chunks: 'all',
 },
},
```
