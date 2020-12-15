# ts-node

Per a executar ts files sense fer build

# type aliases

Per a crear un nou tipus de variable simple.
Ex:

```
type Week = 1 | 2 | 3 | 4 | 5 | 6 | 7;

const w: Week = 5

type Callback = (err: Error, data: any) => void;
```
Si te un valor diferenet dona error.
if you can’t express some shape with an interface and you need to use a union or tuple type,
type aliases are usually the way to go.

# Null check with ??

Si es null devuelve "default", sino devuelve el valor.
```
stringOrNull ?? "default"
```

# Force not null with !

Si sabemos que nunca deberia dar null, podemos forzarlo con !,
pero si es null dara error.

# Map keys of object

Amb <> creem les variables dinamiques que farem servir com a interficie
en els parametres.
```
function pluck<T, K extends keyof T>(o: T, propertyNames: K[], a?: any): T[K][] {
    return propertyNames.map((n) => o[n]);
}

function getProperty<T, K extends keyof T>(o: T, propertyName: K): T[K] {
  return o[propertyName]; // o[propertyName] is of type T[K]
}
```

T = tipus generic
keyof T = array amb els keys values del objecte t

```
let taxi: Car = {
  manufacturer: "Toyota",
  model: "Camry",
  year: 2014,
};
let carProps: keyof Car;
// let carProps: "manufacturer" | "model" | "year"
```

# Tuples

```
type RGB = [number, number, number];
```
With optional param
```
type RGBA = [number, number, number, number?];
```

# Ecmascript

## Shorthand method names

No hace falta hacer ``add: () =>```
```
const calculator = {
  add(num1, num2) {
    return num1 + num2;
  },

  multiply(num1, num2) {
    return num1 * num2;
  },
}
```
# Destructuring arrays

```
const yellow = [255, 255, 0];
const [red, green, blue] = yellow;
const [,, green] = yellow;
const [red, ...blueAndGreen] = yellow;
const [red, blue, gree, alpha = 1] = yellow;
```

# Types from object

```
import numbers from './numbers.ts';
import strings from './strings.json';

type Numbers = typeof numbers;
type StringsJSON = typeof strings;
```
