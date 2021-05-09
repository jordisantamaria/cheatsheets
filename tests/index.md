## Test types

- Unit test

- Integration test: Test that access to infraestructure (bd)

- Acceptance test: Simular lo que haria el usuario con la aplicacion.


Los tests deberian ser independientes, por tanto si queremos testear
buscar en bd, en el mismo test, primero creamos y luego lo buscamos, no lo creamos en otro test.



## Acceptance test

Simular lo que haria el usuario con la aplicacion

Reflejar la infraestructura de produccion.

Usarlo en un entorno de test, no directamente al entorno de produccion.

Testear la api con llamada a fetch y los datos devueltos solamente, con un api de testing.


## Unit test

Solo deberian cambiar, cuando cambia la logica de negocio.

No tiene porque ser 1 test por cada clase o metodo, se testea aquello necessario
para que podamos dipositar nuestra confianza de que todo funciona en el test.

Testean 2 cosas:

- Entrada y salida de los datos, argumentos y return
- Colaboracion con las dependencias que injectamos.

### Mother objects

Para evitar tener que construir el objeto input por cada metodo de test, mejor crear
un Stub que se encarga de construirlo con valores random predefinidos, de modo que
evitamos repetir codigo.

Test Double
===============================================================================

## Stubs

Implementacion con valores por defecto.

## Fake

Implementacion falsa de algo de verdad. Por ejemplo, usar un repositorio in memory en
vez de base de datos.

Nos hace desarrollar mas codigo, ya que hay que escribir la implementacion.

## Mock

Nos permite verificaciones sobre la colaboracion.

## Dummy

Clase vacia, un mock pero sin verificaciones.


AntiPatterns
===============================================================================

## Test que fallan aleatoriamente

Un test deberia funcionar independiente del orden, tirar tests en paralelo y con orden
aleatorio para evitar entrar en este problema.
