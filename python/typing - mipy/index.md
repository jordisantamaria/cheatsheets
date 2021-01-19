# Install

```
python3 -m pip install mypy
```

# Run code:

```
mypy program.py
```

# Typing

Las funciones se tiene que typear el valor de retorno en todas, aunque sea None,
ya que sino no chekea los tipos dentro de la funcion.

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

# dataclasses

Automaticamente genera un init asignando los parametros en constructor.

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

dataclass añade el siguiente codigo

```
def __init__(self, name: str, unit_price: float, quantity_on_hand: int=0):
    self.name = name
    self.unit_price = unit_price
    self.quantity_on_hand = quantity_on_hand
```

## Cast types to tupla and dict

dataclass -> tuple
```
p = Point(10, 20)
assert astuple(p) == (10, 20)
```
dataclass -> dict
```
p = Point(10, 20)
assert asdict(p) == {'x': 10, 'y': 20}
```

## Constructor, post_init

Se llama automaticamente despues de que init assigna los valores.

```
@dataclass
class C:
    a: float
    b: float
    c: float = field(init=False)

    def __post_init__(self):
        self.c = self.a + self.b
```
