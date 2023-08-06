# Fundamentals

https://www.mongodb.com/docs/manual/introduction/

Mongodb store documents in collections. Collections are similar to database tables.
If collection doesn't exist, MongoDB creates the collection when you first store data for that collection.

Documents are saved as BSON, which means a BINARY representation of  JSON

To facilitat access to a group of data from colections, it can be used a VIEW, which is like a table same as a colection but read-only.

## VIEW

2 types:
- Standard View: Computed when read
- On demand: Saved on disk so it becomes faster to query them.

Use cases:
- Return data from a colection without some fields, for example to hide sensible information.
- Return colection with computed fields
- Join 2 colection fields


## BSON

BSON are JSON objects including types.
The object requires to have a _id field, if it doesn't exist it's created automatically as an ObjectId, an id of 12 bytes similar to uuid

Arrays are indexed by dot notation, example users.2 for indexing user[2]

Data types:

- ObjectID
- Date
- Strings
- Timestaps

# Crud Operations





# Get started

https://docs.mongodb.com/manual/tutorial/getting-started/


```
db                           # show current database
use example                  # change or create if not exist to example database
db.movies.insertMany([])     # To insert an array of jsons
db.movies.find( { } )
db.movies.find( { "directors": "Christopher Nolan" } );
db.movies.find( { "released": { $lt: ISODate("2000-01-01") } } );
db.movies.find( { "awards.wins": { $gt: 100 } } );
db.movies.find( { "languages": { $in: [ "Japanese", "Mandarin" ] } } )
db.movies.find( { }, { "title": 1, "directors": 1, "year": 1 } );    # To specify what to return, 1 is return, 0 is no return.
db.movies.deleteOne({{'title': 'Titanic'}})

```


# Mongojs

## Connection

```
const mongojs = require('mongojs')
const db = mongojs(connectionString, [collections])
const db = mongojs('mydb', ['mycollection'])
```

# CLI

Connect to mongodb shell `mongosh`


# TODO

CLI
Queries
Relacions
Migracions
Seeding
Export
Esquemas
