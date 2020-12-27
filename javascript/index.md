# Introducción

Javascript es un lenguage caracterizado por:

1. Ser orientado a objetos, no existen clases.
2. Programación funciona, uso de callbacks.
3. Single-thread, solo ejecuta una parte cada vez
4. Los ; son opcionales, solo son necesarios cuando hay multiples instrucciones en 1 sola linia.

# Variables

## Tipo de variables segun scope

Es una muy buena practica mantener el estado de una aplicacion lo maximo inmutable possible,
dado que tenemos mayor control sobre el valor actual de la variable, por tanto se usa const
lo máximo possible.

### const

Variable inmutable, no cambia su valor.
```javascript
const variable = 1
```

### let

Variable con scope local.

### var

Variable con scope global, hay que evitarse lo maximo possible, en una web
es accessible desde el inspector por window.nombreVariable

## Tipo de variable segun su valor

Las variables tienen tipo segun su valor actual, si se les assigna un valor de un nuevo tipo,
la variable cambia a otro tipo de valor.

Aunque como buena práctica, una variable nunca se le deberia assignar un nuevo valor de un
tipo distinto.

Las variables sin valor assignado, tienen valor "undefined".

Cualquier valor en javascript se le puede assignar una variable.

Tipos de variable:
- undefined
- null
- boolean
- number
- string
- array
- object
- function

### Como checkear el tipo de variable

Con typeof podemos ver que tipo de valor tiene la variable.
```javascript
typeof variable
```
Lo que nos devuelve un string con el tipo. Ejemplo:
```javascript
typeof "hello world";
// "string"
typeof 5
// "number"
```

### Cambiar el valor de la variable de tipo

int => string
```javascript
const x = 5;
x.toString(); // '5'
```
string => int | float
```javascript
parseInt("5"); // 5
parseFloat("5.5") // 5.5
```

## Condicionales

En javascript tenemos como en otros lenguajes el "if, else, else if, switch".

### Operador ===
En javascript es recomendado usar === en vez de ==, o !== en vez de !=, la razón es que con 
=== estamos comparando el valor y el tipo de variable al mismo tiempo.

### Operador ternario ? :

condition ? exprIfTrue : exprIfFalse

### Check if null && undefined

Podemos comprobar null y undefined al mismo tiempo comprobando por null, no hace falta
comprobar tambien undefined.

```javascript
let a;
if (a == null) {console.log("no value")}
```

### Check if(variable)

Comprobamos si la variable no es null, no es undefined,
es true en caso de boolean y no es valor 0 en caso de number

# Programación funcional

En javascript una función es considerada una variable, por tanto puede recibirse una
funcion como parametro de otra funcion, lo cual nos permite usarla, por ejemplo:

```javascript
function callback() {
  console.log('callback called');
}
function sample(callback) {
  callback()
}
```

## Callback

Usar funciones como parametro es algo muy utilitzado en javascript y hay una forma de usarlo
que se llama la función de callback.

Se trata de pasarle una funcion como parametro a una funcion, esa función se llama al finalizar
la primera función, con possibles parametros de valores generados en la otra función.

Ese patrón se usa principalmente debido a que como javascript solo se ejecuta en un solo thread,
partes del código que puedan tomar mucho tiempo, debido a leer a un fichero, hacer un http request,
o cualquier otra razón, es buena practica hacerlo de forma asyncrona para no bloquear el hilo
de ejecución del código, ya que sino por ejemplo, nos encontrariamos con una web donde nose puede
interactuar con el javascript de la pagina, dado a que el hilo esta bloqueado por una tarea lenta.

Por tanto, para asegurarnos que en una función asyncrona, otra función sea ejecutada justo despues
de ella, hay 2 opciones, pasarle una función de callback o usar promesas.

Como ejemplo de función asyncrona tenemos el setTimeOut, que ejecuta una función al pasar x milisecs.

```javascript
function callback(){ console.log("Hello"); }
setTimeout(callback, 3000);
```

## Arrow function

Para crear una función hay también la opción de usar una arrow function, que basicamente
es una sintaxis mas abreviada que nos evita problemas con el this.
```javascript
const callback = (param1, param2) => {
  console.log(param)
}
```

## Pure function
TODO

## Parametros de funcion opcionales

Los parametros de las funciones son opcionales y pueden tener valores por defecto.

```javascript
const fun = (x = 1, y = 2) => {
  console.log(param)
};
fun()
```

# Arrays

Con array podemos asignar valor de distintos tipos, aunque es muy mala practica.

```javascript
const array = [1,true,"1"]
```

Es comun iterar los arrays con array iterator functions.

## Funciones de array

Todas las funciones de array para iterar son con la misma sintaxis, reciben parametro un
arrow function con parametros (value, index, array)

```javascript
.iteratorFunction((value, index, array) => {
// do something
})
```

Algunas de las funciones mas usadas son:

### forEach

Para hacer algo por cada valor de un array.
```javascript
[10,20,30].forEach((value, index, array) => console.log(value))
```

### map

Nos devuelve un nuevo array con el mismo numero de elementos en el que podemos modificar cada valor.
```javascript
[10,20,30].map((value, index, array) => value * 10)
// [100, 200, 300]
```

### filter

Nos devuelve un nuevo array con los elementos que cumplen la condicion.
```javascript
[10,20,30].filter((value, index, array) => value > 10)
// [20,30]
```

### find

Nos devuelve el primer elemento que cumple con la condicion
```javascript
[10,20,30].find((value, index, array) => value > 10)
// 20
```

### findIndex

Nos devuelve el primer in dex elemento que cumple con la condicion
```javascript
[10,20,30].findIndex((value, index, array) => value > 10)
// 1
```

# Objetos

```javascript
const obj = {
  x: 5,
  y: 10,
  setCoord(x,y) {
    this.x = x;
    this.y = y;
  }
};
const coordX = obj.x;
const coordY = obj.y;
obj.setCoord(0,0)
```

# Clases

```javascript
const Coord = function(x,y) {
  this.x = x;
  this.y = y;
  this.setCoord = function (x,y) {
    this.x = x;
    this.y = y;
  }
};
const coord = new Coord(4,5);
```

## prototype
TODO

## This

this en javascript apunta siempre al objeto mas interior,
de modo que en un for each x ejemplo, el this apunta a cada objeto en vez de a las variables de clase,
para evitar este problema, hay varias soluciones, bind, call y apply.

### Bind

Bind nos devuelve una nueva funcion, en la cual le podemos indicar el this y los valores por defecto.

Dar un valor por defecto con bind es util por ejemplo cuando usas la funcion como parametro a otra funcion,
entonces es la unica forma de assignarle un valor en esa situacion al parametro.

```javascript
function print(msg) {
  console.log(msg);
}
const printHello = print.bind(this, "Hello world");
printHello() // "Hello world"
```


# Promise "promesas"

Para lidiar con una ejecucion asyncrona, tal como vimos se podia hacer con callbacks,
pero las Promise son la mejor forma de hacerlo.

Ademas todas las apis devuelven siempre una Promise.

## Crear promesa

La sintaxis seria del tipo
```javascript
new Promise((resolve, reject) => resolve(returnValue))
```
Ejemplo, nos devuelve hello world al pasar 5 segons:
```javascript
function getGreet() {
  return new Promise((resolve, reject) => {
    try {
      setTimeout(resolve("Hello world"), 5000)
    } catch (e) {
      reject(e)
    }
  })
}
```

## Usar la promesa

En then() nos devuelve el valor, en catch() nos devuelve el error.

```javascript
getGreed
.then((value) => {
  console.log(value);
})
.catch((error) => {
  console.log(error);
})
```

## Problema, callback hell!!!
El problema de esta sintaxis es que forzamos a que todo el hilo de ejecucion de la funcion siga
en then, ya que sino al ser asyncrono, el codigo despues de la promesa se ejecutara antes de
resolverse la promesa, en este caso 5 segundos.
Por tanto es muy facil que sucedan codigos del estilo:

```javascript
fetch(apiEndpoint).then(value) {
  fetch(secondEndpoint).then(value) {
    fetch(anotherEndpoint).then(value) {
      // y podriamos seguir
    }    
  }
}
```

# Solucion, async await

Para solucionar el callbackhell, el cual sucede usando callbacks usemos promesas o no,
se usa async await, gracias a esa sintaxis, todo el codigo actual ya se trata de evitar
usar callbacks en la mayoria de lo possible y se ha pasado a promesas con async await.

La sintaxis se basa en marcar la funcion como async, lo cual nos permite llamar a metodos que
devuelven una promesa con await, el await se espera a que se resuelva la promesa y nos
devuelve el valor en la variable que le assignemos.

```javascript
async function fetchData() {
  try {
    const value = await fetch(apiEndpoint);
    const value2 = await fetch(secondEndpoint);
    const value3 = await fetch(anotherEndpoint)
  } catch (error) {
    console.log(error);
  }
}
```

# Ecmascript6

## Rest parameter
```javascript
function hello(x, ...args) {
  
}
```
## Spread operator
```javascript
const obj = {
  x: 2,
  y: 4
}
const {x, y} = obj
```
## Template literals
## Object properties shorthand
## Destructuring assignment
```javascript
const obj = {
  x: 2,
  y: 4,
  width: 200
}
const {x, ...others} = obj
```
## Classes
```javascript
class Coord {
  private x = 4;
  public y = 5;
  constructor(x, y) {
    this.x = x;
    this.y = y;
  }
}
```

# NPM

## Comandas

### Create project
`npm run init`

### Run code

```bash
npm run nameScript
```

### Install librarys

`npm install`

### Install new library

Opcional -D: Libreria de desarollo

`npm install library-name`

# Node vs javascript navegador

En el javascript de navegador tenemos ya muchas funciones y variables globales disponibles,
las principales son:

- fetch()
- document
- window

En node no tenemos nada por defecto y hay que importarlo todo en general.

Fetch en node:
```javascript
const fetch = require('node-fetch');
```

# Ejecutar fichero
```javascript
node fitxer.js
```
