# Get started

https://docs.mongodb.com/manual/tutorial/getting-started/

```
db                           # show current database
use example                  # change to example database
db.movies.insertMany([])     # To insert an array of jsons
db.movies.find( { } )
db.movies.find( { "directors": "Christopher Nolan" } );
db.movies.find( { "released": { $lt: ISODate("2000-01-01") } } );
db.movies.find( { "awards.wins": { $gt: 100 } } );
db.movies.find( { "languages": { $in: [ "Japanese", "Mandarin" ] } } )
db.movies.find( { }, { "title": 1, "directors": 1, "year": 1 } );    # To specify what to return, 1 is return, 0 is no return.

```


# Mongojs

## Connection

```
const mongojs = require('mongojs')
const db = mongojs(connectionString, [collections])
const db = mongojs('mydb', ['mycollection'])
```
