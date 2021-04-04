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

# Pipenv

Activar pipenv en el proyecto.

Ademas incluye las variables de .env como var de entorno.

```
pipenv shell
```

Las variables de entorno se pueden usar en el Pipenv file.

```
[[source]]
url = "https://$USERNAME:${PASSWORD}@mypypi.example.com/simple"
verify_ssl = true
name = "pypi"
```

## Run scripts by pipenv

It's possible to define bash scripts in Pipfile

```
[scripts]
printspam = "python -c \"print('I am a silly example, no one would need to do this')\""
```

Then in terminal use `pipenv run printspam`

It also accepts params, same as npm.

```
[scripts]
echospam = "echo I am really a very silly example"
```

```
$ pipenv run echospam "indeed"
I am really a very silly example indeed
```

Available scripts: `pipenv scripts`

## Install development librarys

Install both prod and dev librarsy

```
pipenv install --dev
```

## Install new librarys

Incluye la libreria en Pipfile y Pipfile.lock

```
pipenv install flask==0.12.1
```

### Dev librarys

[dev-packages]: --dev

```
pipenv install pytest --dev
```

## Generar el Pipenv.lock

```
pipenv lock
```

### Instalar librerias desde Pipenv.lock

```
pipenv install --ignore-pipfile
```

# chardet

Detectar extension de fichero

```
import chardet
encoding = chardet.detect(file_name_byte).get("encoding")
```

# jsonpointer

Para poder acceder a los datos de un json via url path

```
>>> obj = {"foo": {"anArray": [ {"prop": 44}], "another prop": {"baz": "A string" }}}

>>> resolve_pointer(obj, '') == obj
True

>>> resolve_pointer(obj, '/foo') == obj['foo']
True

>>> resolve_pointer(obj, '/foo/another%20prop') == obj['foo']['another prop']
True

>>> resolve_pointer(obj, '/foo/another%20prop/baz') == obj['foo']['another prop']['baz']
True

>>> resolve_pointer(obj, '/foo/anArray/0') == obj['foo']['anArray'][0]
True

>>> resolve_pointer(obj, '/some/path', None) == None
True
```

# Regexp

## search

Returns true/false

## sub

Replace string
