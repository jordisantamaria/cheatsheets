# Rest Api

1. Create a Realtime database.
2. It returns a url, use this url with POST/PUT/DELETE and ending with name.json to manipulate data.

- POST: Save data with a random id

```
curl -X POST -d '{
  "author": "alanisawesome",
  "title": "The Turing Machine"
}' 'https://docs-examples.firebaseio.com/fireblog/posts.json'
```

- PUT: Save data.

```
curl -X PUT -d '{
  "alanisawesome": {
    "name": "Alan Turing",
    "birthday": "June 23, 1912"
  }
}' 'https://docs-examples.firebaseio.com/fireblog/users.json'

```

- DELETE:

```
curl -X DELETE \
  'https://docs-examples.firebaseio.com/fireblog/users/alanisawesome.json'
```

- PATCH: edit data

```
curl -X PATCH -d '{
  "nickname": "Alan The Machine"
}' \
  'https://docs-examples.firebaseio.com/fireblog/users/alanisawesome.json'
```

- GET

```
curl 'https://docs-examples.firebaseio.com/fireblog/posts.json?print=pretty'
```
