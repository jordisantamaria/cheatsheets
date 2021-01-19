def greeting(name: str) -> str:
    return 'Hello ' + name

def g() -> None:
    1 + 'x'  # Type check error (statically typed)

#print(greeting("jordi"))
g()
