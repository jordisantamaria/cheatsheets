https://docs.pytest.org/en/stable/getting-started.html#getstarted

# Install

```
pipenv install pytest
```

# Run test

pytest ejecuta ficheros del formato `test_*.py` o `*_test.py`

-q (quiet) mode

```
pytest -q
```

# Assert exceptions

Con **raises**

```
# content of test_sysexit.py
import pytest


def f():
    raise SystemExit(1)


def test_mytest():
    with pytest.raises(SystemExit):
        f()
```

# Group multiple tests in a class

Las funciones tienen que tener el formato **test_something** o seran ignoradas.

```
class TestClass:
    def test_one(self):
        x = "this"
        assert "h" in x

    def test_two(self):
        x = "hello"
        assert hasattr(x, "check")
```
