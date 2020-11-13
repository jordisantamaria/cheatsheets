# Fetch in node

```
http.get('http://www.fullstack.io/', function (res) { ... })
```

# Basic server 

Con createServer, le enviamos un callback que es llamado
cada vez que se hace una peticion a nuestro server.

```
const http = require('http')

const port = process.env.PORT || 1337

const server = http.createServer(function (req, res) {
  res.end('hi')
})

server.listen(port)
console.log(`Server listening on port ${port}`)
```

## Serving Json

```
const server = http.createServer(function (req, res) {
  res.setHeader('Content-Type', 'application/json')
  res.end(JSON.stringify({ text: 'hi', numbers: [1, 2, 3] }))
})
```

## Routing with req

```
const server = http.createServer(function (req, res) {
  if (req.url === '/') return respondText(req, res)
  if (req.url === '/json') return respondJson(req, res)

  respondNotFound(req, res)
})
```

## Sending 404

```
function respondNotFound (req, res) {
  res.writeHead(404, { 'Content-Type': 'text/plain' })
  res.end('Not Found')
}
```

## File Serving

```
function respondStatic (req, res) {
  const filename = `${__dirname}/public${req.url.split('/static')[1]}`
  fs.createReadStream(filename)
    .on('error', () => respondNotFound(req, res))
    .pipe(res)
}
```

# Express

Libreria para hacer el routing del api mas facil.

```
const fs = require('fs')
const express = require('express')

const port = process.env.PORT || 1337

const app = express()

app.get('/', respondText)
app.get('/json', respondJson)
app.get('/echo', respondEcho)
app.get('/static/*', respondStatic)

app.listen(port, () => console.log(`Server listening on port ${port}`))
```


# Async

FileSystem promises:

```
const fs = require('fs').promises

const filename = '07-read-file-promises.js'

fs.readFile(filename)
  .then(data => console.log(`${filename}: ${data.length}`))
  .catch(err => console.error(err))
```

# Multiple async concurrently

Esperar a que todas las promesas se resuelvan antes
de seguir la ejecucion.

```
Promise.all(
      fileList.map(file => fs.readFile(file).then(data => [file, data.length]))
    )
.then(results => {
    results.forEach(([file, length]) => console.log(`${file}: ${length}`))
    console.log('done!')
  })
```

Async / await no funciona dentro de funciones tipo forEach / map / filter, etc..

# Event emitter

Cada vez que sucede un evento, se ejecuta la funcion

Proporcionan el on() para reaccionar al evento.

```
const http = require('http')
const readline = require('readline')
const querystring = require('querystring')

const rl = readline.createInterface({ input: process.stdin })

rl.on('line', line =>
  http.get(
    `http://localhost:1337/chat?${querystring.stringify({ message: line })}`
  )
)
```

## Streams

Son unos event emitters que devuelven 3 eventos:
'data', 'error' y 'end'

La idea es que pueden saltar multiples veces indefinidas
el event 'data', hasta que termina de processar todos los datos
y entonces salta al evento 'end'

```
const fs = require('fs')
const https = require('https')

const fileUrl =
  'https://www.newline.co/fullstack-react/assets/images/fullstack-react-hero-book.png'

https.get(fileUrl, res => {
  const chunks = []

  res.on('data', data => chunks.push(data)).on('end', () =>
    fs.writeFile('book.png', Buffer.concat(chunks), err => {
      if (err) console.error(err)
      console.log('file saved!')
    })
  )
})
```

Una ventaja de los streams es por ejemplo en el codigo anterior,
estamos cargando los datos que van llegando en memoria y nos
podriamos quedar sin memoria.

Asi que podemos usar un stream de escritura para ir
guardando los datos segun va llegando y cerrar el stream
cuando haya terminado.

```
const fs = require('fs')
const https = require('https')

const fileUrl =
  'https://www.newline.co/fullstack-react/assets/images/fullstack-react-hero-book.png'

https.get(fileUrl, res => {
  const fileStream = fs.createWriteStream('book.png')
  res.on('data', data => fileStream.write(data)).on('end', () => {
    fileStream.end()
    console.log('file saved!')
  })
})
```

En vez de escuchar al evento y escribir los datos,
streams te permite usar pipes para simplificarlo

```
const fs = require('fs')
const https = require('https')

const fileUrl =
  'https://www.newline.co/fullstack-react/assets/images/fullstack-react-hero-book.png'

https.get(fileUrl, res => {
  res
    .pipe(fs.createWriteStream('book.png'))
    .on('finish', () => console.log('file saved!'))
})
```

## Transform custom stream

A part de llegir i escriure amb streams les dades,
podem fer transformacions.

```
const fs = require('fs')
const { Transform } = require('stream')

fs.createReadStream('23-streams-shout.js')
  .pipe(shout())
  .pipe(fs.createWriteStream('loud-code.txt'))

function shout () {
  return new Transform({
    transform (chunk, encoding, callback) {
      callback(null, chunk.toString().toUpperCase())
    }
  })
}
```

## CSV parser with transform streams

Amb csv-parser, les dades del csv pasan a format json
al seguent pipe "clean()".
En clean() fem transformacions manipulant jsons.

```
const csv = require('csv-parser')

fs.createReadStream('people.csv')
  .pipe(csv())
  .pipe(clean())
  .on('data', row => console.log(JSON.stringify(row)))
```

Pero streams nomes treballa amb buffer i strings, 
per arreglar aixo fem servir mode = objectMode: 

```
function clean() {
    return new Transform({
      objectMode: true,
      transform (row, encoding, callback) { ... }
    })
}
```
