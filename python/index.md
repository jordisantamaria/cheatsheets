Strings
===============================================================================


## Writing strings

- Formated with variables

```
year = 2016
event = 'Referendum'
f'Results of the {year} {event}'
```

- Multi line string

```
text = (
	'Put several strings within parentheses '
  'to have them joined together.'
)
```

- Raw string, (without formating especial characters)

```
text = r'C:\some\name'     # 'C:\some\name'
```


## Operations with strings

```
3 * 'un' + 'ium'                     # 'unununium'
str.split(sep, maxsplit)             # Split by sep in max indexes of maxsplit
str.capitalize()                     # First letter uppercase
str.lower()
str.upper()
str.find(x)                          # Find x value in string and return It's index
str.format()                         # "user={} password={}".format(user, pwd)
str.strip()                          # Return a string with leading characters removed
str.replace(old, new)
str.splitlines()                     # Split \n or \r into array
'MiscTests'.removesuffix('Tests')    # 'Misc'
'TestHook'.removeprefix('Test')      # 'Hook'
```

Type casting
===============================================================================

```
str(variable)      # Cast anything to string
int(variable)      # Cast anything to int, If not possible, ValueError
```

Conditionals
===============================================================================

```
if
elif
else

<
>
==
is              # variable is True  (use is to check True/False instead of ==)
in              # 1 in [1,2,3] => True
not

and
or
```

Arrays
===============================================================================

## Indexing

```
word = 'Python'
word[1]              # 'y'
word[-1]             # 'n'
word[:3]             # 'Pyt'
word[3:]             # 'hon'
word[3:3]            # ''
word[::2]            # Pto, step = 2
```

## Iterables


```
range(0,4)                         # inmutable array [0,1,2,3]
[1,2,3,4]                          # List
"strings"                          # String
{'jack': 4098, 'sape': 4139}       # Dict
(1,2,3)                            # Tuple
{1,2,3}                            # Set

list([Iterable])                   # Syntax [1,2,3]
set([Iterable])                    # Unique values, Syntax {1,2,3}
tuple([Iterable])                  # Syntax (1,)
dict([Iterable])                   # Syntax {'jack': 4098, 'sape': 4139}
map([function],[Iterable])         # It's like js arr.map, but returns Iterable instead of list

```



## Common operations

```
x in array                        # True If found x
x not in array                    # True If NOT found x
                               
array[i:j] = []                   # Remove indices from array
del array[i]                      # Remove index from array
                               
array1 + array2                   # Concatenate arrays
[*array1, *array2]                # Concatenate arrays
                               
array2 = array[:]                 # Copy array to array2
                               
array.append(x)                   # Add x to end of array
array.insert(i,x)                 # Add x to i index
array.pop(i)                      # Return and remove index i from array
array.remove(x)                   # Remove first value x of array
                               
len(array)                        # Length | size of array
min(array)                        # Minium value of array
max(array)                        # Maximum value of array
                               
array.index(x)                    # Index of first ocurrence of x
array.count(x)                    # Total number of ocurrences of x
```

## List

```
list.sort()           # Sort list, void method
```

### List comprensions

```
[x*2 for x in [1,2,3]]
```


Pipenv
===============================================================================


Activar pipenv en el proyecto.

Ademas incluye las variables de .env como var de entorno.

```
pipenv shell
```

Las variables de entorno se pueden usar en el Pipenv file.

```
[[source]]
url = "https://$USERNAME:${PASSWORD}@mypypi.example.com/simple"
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

## Generate Pipenv.lock

```
pipenv lock
```

### Install libraries from Pipenv.loc

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

import re

## search

Returns true/false

## sub

Replace string
