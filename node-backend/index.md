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
