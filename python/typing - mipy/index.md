# Install

```
python3 -m pip install mypy
```

# Run code:

```
mypy program.py
```

# Typing

Functions return type should be defined, or mipy will not check typing on the function

## Function

```
def g() -> None:
    1 + 'x'
```

With default values

```
def greeting(name: str, excited: bool = False) -> str:
    message = 'Hello, {}'.format(name)
    if excited:
        message += '!!!'
    return message
```

## Advanced types

- **List[type]** : For arrays

```

def greet_all(names: List[str]) -> None:
    for name in names:
        print('Hello ' + name)

names = ["Alice", "Bob", "Charlie"]
ages = [10, 20, 30]

greet_all(names)   # Ok!
greet_all(ages)    # Error due to incompatible types
```

- **Iterable**: For arrays, tuple, set or any iterable.

```
from typing import Iterable

def greet_all(names: Iterable[str]) -> None:
    for name in names:
        print('Hello ' + name)
```

- **Union**: For multiple possible types in variable.

```
from typing import Union

def normalize_id(user_id: Union[int, str]) -> str:
    if isinstance(user_id, int):
        return 'user-{}'.format(100000 + user_id)
    else:
        return user_id
```

- **Optional**: For accept x type or None.

```
from typing import Optional

def greeting(name: Optional[str] = None) -> str:
    # Optional[str] means the same thing as Union[str, None]
    if name is None:
        name = 'stranger'
    return 'Hello, ' + name
```

