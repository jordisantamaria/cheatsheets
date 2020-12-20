# Strings

## Formated strings

```
year = 2016
event = 'Referendum'
f'Results of the {year} {event}'
```

## Multiline string

```
text = ('Put several strings within parentheses '
       'to have them joined together.')
```

## Operaciones aritmeticas con strings

```
3 * 'un' + 'ium'
# 'unununium'
```

## Indexando

```
word = 'Python'
word[1] #y
word[-1] # n

```

## Slicing

```
# characters from position 2 (included) to 5 (excluded)
word[2:5]  
# 'tho'
```
Slicing indexs tienen defaults, delante a 0 y detras a la ultima pos

```
word[:2] + word[2:]
```

## Tamaño

```
len(word)
```

# Print strings

## Raw string, sin formatear characteres especiales

```
>>> print(r'C:\some\name')
```

## Multiple linia, manteniendo formato

Para que no genere el salto de linia extra, se usa \

```
print("""\
   Usage: thingy [OPTIONS]
        -h                        Display this usage message
        -H hostname               Hostname to connect to\
""")
```

# Conversiones de tipo

Cast to string: str(text)
Cast to int: int(text)
to json: json.dumps([1, 'simple', 'list'])
