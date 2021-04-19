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
str.format()                         # "user={} password={}".format(user, pwd)
str.strip()                          # Return a string with leading characters removed

str.capitalize()                     # First letter uppercase
str.lower()
str.upper()

str.find(x)                          # Find x value in string and return It's index
str.replace(old, new)
str.splitlines()                     # Split \n or \r into array
'MiscTests'.removesuffix('Tests')    # 'Misc'
'TestHook'.removeprefix('Test')      # 'Hook'

list = str.split(sep, maxsplit)      # Split by sep in max indexes of maxsplit
",".join(list)

```


Type casting
===============================================================================

```
str(variable)      # Cast anything to string
int(variable)      # Cast anything to int, If not possible, ValueError
float(variable)    # Cast anything to float, If not possible, ValueError
```


Conditionals
===============================================================================

```
if
elif
else

"true" if val == True else "false"        # Ternary operator

<
>
==
is                                        # variable is True  (use is to check True/False instead of ==)
in                                        # 1 in [1,2,3] => True
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

## Iteration

```
for item in ["a", "b", "c"]:
for i in range(4):                       # 0 to 3
for i in range(4, 8):                    # 4 to 7
for i in range(1, 9, 2):                 # 1, 3, 5, 7
for key, val in dict.items():
for index, item in enumerate(list):
```

## Iterables

```
range(0,4)                         # iterable to use in loops => [0,1,2,3]
[1,2,3,4]                          # List
"strings"                          # String
{'jack': 4098, 'sape': 4139}       # Dict
(1,2,3)                            # Tuple: Inmutable array
{1,2,3}                            # Set: Unique values

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

[x, y] = [10, 20]                 # Destructuring
[x, *rest] = [1,2,3,4]            # x = 1, rest = [2,3,4]
[x, *_, last] = [1,2,3,4]         # with *_ we ignore values, x = 1, last = 4
```

## List

- Operations

```
list.sort()           # Sort list, void method
```

- List comprehensions

```
[fn(i) for i in list]                  # .map
map(fn, list)                          # .map, returns iterator
                                       
filter(fn, list)                       # .filter, returns iterator
[fn(i) for i in list if i > 0]         # .filter.map
```

- Lambda expressions

```
func = lambda [args] : [return value]

function = lambda x: x.split()
function('  hello   ')               # 'hello'

```

## Dict

```
dict.keys()
dict.values()
"key" in dict                 # let's say this returns False, then...
dict["key"]                   # ...this raises KeyError
dict.get("key")               # ...this returns None
```

- Destructuring

```
numbers = {"one": 1, "two": 2, "three": 3}
letters = {"a": "A", "b": "B", "c": "C"}
combination = {**numbers, **letters}
# {'one': 1, 'two': 2, 'three': 3, 'a': 'A', 'b': 'B', 'c': 'C'}
```


File manipulation
===============================================================================

## Read

- Open with `with` to auto close file and avoid need to use try catch

```
with open('filename') as file:
  data = file.read()                  # Return string with all text
  data = file.readLine()              # Read one line
  data = file.readlines()             # Return array of lines
```

## Write

- Overwrite

```
with open("hello.txt", "w") as file:
file.write("Hello World") 

text_lines = ["First line", "Second line", "Last line"]
file.writelines(text_lines)
```

- Append

```
with open("Hello.txt", "a")               # open in append mode
  file.write("Hello World again")
```

POO
===============================================================================

## Class

```
class ClassName:
  def __init__()
```

## Private variables

Starts with `__` or `_` for convention.

```
def __update(self):
```

## Inheritance

```
class MyClass(BaseClass):
  def __init__():
    super().__init__()
```

## Abstract class

```
from abc import ABC, abstractmethod

class MyClass(ABC):
  @abstractmethod
  def method_name(self):
      pass
```

Standard Library
===============================================================================

Check Documentation of library

```
import os
help(os)
```

## OS

```
import os

os.getcwd()                # Get current working directory
os.chdir()                 # Change current working directory
os.system('mkdir foo')     # Execute system commands
os.getenv('ENV')           # Get environment variable
os.makedirs('path')        # Generate all not existing dirs of given path
```

## Shutil

```
import shutil

shutil.move(old_dir, new_dir)     # Move dir/file to new dir/file
shutil.rmtree(dir)                # Remove directory
```

## Sys

For run python with arguments

```
python demo.py one two three

import sys
print(sys.argv)        # ['demo.py', 'one', 'two', 'three']
```

## Chardet

Detects file encoding, It requires bytes array, so open file in read bytes mode `rb`.

```
import chardet

with open(utf8_path, "rb") as f:
    byte_array = f.read()
    encoding = chardet.detect(byte_array)["encoding"]
    assert encoding == "UTF-8-SIG"
```

## Jsonpointer

Access json data in url path format.

```
from jsonpointer import resolve_pointer

obj = {
    "foo": {
        "anArray": [
            {"prop": 44}
        ],
        "another prop": {
            "baz": "A string"
        }
    }
}

resolve_pointer(obj, '') == obj

resolve_pointer(obj, '/foo') == obj['foo']

resolve_pointer(obj, '/foo/another%20prop') == obj['foo']['another prop']

resolve_pointer(obj, '/foo/another%20prop/baz') == obj['foo']['another prop']['baz']

resolve_pointer(obj, '/foo/anArray/0') == obj['foo']['anArray'][0]

resolve_pointer(obj, '/some/path', None) == None
```

## Re (Regular expressions)

- Find all
```
import re
str = '[ 1/130 ]'
re.findall(r"\d+", str)              # ['1', '130']
```

- Search for check If find regex, get value with group.

```
import re
str = '[ 1/130 ]'
bool(re.search(r"\d+", str))                 # True

re.search(r"(\/)(\d+)", str).group(2)        # 130

```

- Match is same as search, but have to find regex from start of string.

```
import re
bool(re.match(r".*.csv$", file)):

str = '[ 1/130 ]'
int(re.match(r"(\[\s\d+/)(\d+)", str).group(2))          # 130

```




Types
===============================================================================

```
int
str
float
Any

list[str]
tuple[int, str]
dict[str, str]

Union[int, str]       # int or str, multiple types
Optional[str]         # str or None
Iterable[str]

Callable[[int, str], int]         # Function type
```

## Variable

Declare type like this `x: int`

## Function

Declare return value with `->`

```
def funct() -> int:
```

## Class

```
ClassVar[str]                   # Variable value can't be set in instance of the class

@abstractmethod
def eat(self) -> None: pass

@dataclass                      # To automatically create constructor with class variables
```


DataClass
===============================================================================

Automatically pass class variables to the constructor.

```
from dataclasses import dataclass

@dataclass
class InventoryItem:
    """Class for keeping track of an item in inventory."""
    name: str
    unit_price: float
    quantity_on_hand: int = 0

    def total_cost(self) -> float:
        return self.unit_price * self.quantity_on_hand
```

In this sample, dataclass adds this automatically.

```
def __init__(self, name: str, unit_price: float, quantity_on_hand: int=0):
    self.name = name
    self.unit_price = unit_price
    self.quantity_on_hand = quantity_on_hand
```

## Casting dataclass

- dataclass to tuple

```
p = Point(10, 20)
assert astuple(p) == (10, 20)
```
- dataclass to dict

```
p = Point(10, 20)
assert asdict(p) == {'x': 10, 'y': 20}
```

- dict to dataclass

```
dict = {'x': 10, 'y': 20}
p = Point(**dict)
```

## Constructor, post_init

To do initialization after dataclass constructor, so variables are already defined.

```
@dataclass
class C:
    a: float
    b: float
    c: float = field(init=False)

    def __post_init__(self):
        self.c = self.a + self.b
```


Pipenv
===============================================================================

```
pipenv shell                  # Activate python env with .env variables
exit                          # Exit pipenv
pipenv install                # Install library in pipenv
pipenv install --dev          # Install as dev dependency
pipenv lock                   # Create pipenv lock file
pipenv run [script]           # Run scripts defined in pipenv file
```

## Env variables can be used in Pipenv file

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


Testing with pytest
===============================================================================

https://docs.pytest.org/en/stable/getting-started.html#getstarted

## Install

```
pipenv install pytest
```

## Run test

pytest execute files of format `test_*.py` or `*_test.py`

```
pytest -q            # Test in quiet mode, so less output
pytest -s            # Test with logging
```

## Modules tests

pytest don't recognize root paths for modules, so have to run It different:

```
cd src/module
python -m pytest
```

## Group multiple tests in a class

Functions have to follow naming convention for run the test as **test_function_name** or will be ignored.

```
class TestClass:
    def test_one(self):
        x = "this"
        assert "h" in x

    def test_two(self):
        x = "hello"
        assert hasattr(x, "check")
```

