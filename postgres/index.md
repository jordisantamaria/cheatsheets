# Add column

```
ALTER TABLE customers
ADD COLUMN contact_name VARCHAR;
```

# Insert
```
INSERT into USERS(name, email, password) VALUES
    ('jordi', 'jordi@gmail.com', 'password'),
    ('kuroneko', 'kuroneko@gmail.com', 'password'),
```

# Drop Column

```
ALTER TABLE USERS DROP COLUMN name;
```
