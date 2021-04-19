https://docs.pytest.org/en/stable/getting-started.html#getstarted

# Install

```
pipenv install pytest
```

# Run test

pytest execute files of format `test_*.py` or `*_test.py`

-q (quiet) mode

```
pytest -q
```


# Group multiple tests in a class

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
