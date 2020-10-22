# Query builder

To create costum querys

## How to create

With manager
```javascript
const user = await getManager()
    .createQueryBuilder(User, "user")
    .where("user.id = :id", { id: 1 })
    .getOne();
```
With repository
```javascript
const user = await getRepository(User)
    .createQueryBuilder("user")
    .where("user.id = :id", { id: 1 })
    .getOne();
```

4 different types, default select:

1. createQueryBuilder().select("user")
2. createQueryBuilder().insert("user")
3. createQueryBuilder().update("user")
4. createQueryBuilder().delete("user")

## Getting values

1. getOne()
2. getMany()
3. getRawOne()
4. getRawMany()
.getSql()

## Select custom fields
```javascript
.select([
        "user.id",
        "user.name"
    ])
```
    
## From table as alias

Abreviado: .createQueryBuilder(User, "user")

= createQueryBuilder()
      .select("user")
      .from(User, "user")

## where:

### Usamos parametros para evitar sql injection.

.where("user.name = :name", { name: "Timber" })

### Con parametro array

.where("user.name IN (:...names)", { names: [ "Timber", "Cristal", "Lina" ] })

### And / Or

.andWhere("user.lastName = :lastName", { lastName: "Saw" });

.orWhere("user.lastName = :lastName", { lastName: "Saw" });

### Complex wheres

```javascript
createQueryBuilder("user")
    .where("user.registered = :registered", { registered: true })
    .andWhere(new Brackets(qb => {
        qb.where("user.firstName = :firstName", { firstName: "Timber" })
          .orWhere("user.lastName = :lastName", { lastName: "Saw" })
    }))
```
Result:  
```
SELECT ... FROM users user WHERE user.registered = true AND (user.firstName = 'Timber' OR user.lastName = 'Saw')
```

## Having

TODO what is having

## Order by with multiple criteria

```javascript
.orderBy("user.name", "ASC")
.addOrderBy("user.id", "DESC");
```

## DISTINCT ON expression (Postgres only)

TODO que es distinct

## GROUP BY

TODO

## LIMIT

.limit(10)

## Joins

```javascript
const user = await createQueryBuilder("user")
    .leftJoinAndSelect("user.photos", "photo", "photo.isRemoved = :isRemoved", { isRemoved: false })
    .where("user.name = :name", { name: "Timber" })
    .getOne();
```
Output:
```
SELECT user.*, photo.* FROM users user
    LEFT JOIN photos photo ON photo.user = user.id AND photo.isRemoved = FALSE
    WHERE user.name = 'Timber'
```

### Joins functions

1. leftJoinAndSelect
2. innerJoinAndSelect
3. innerJoin
4. leftJoin
