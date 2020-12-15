# La regla del Boy Scout

Dejar el codigo mas limpio que como lo encontraste.
Si el codigo esta sucio y se puede mejorar en cosa de 15 minutos, mejor limpiarlo.

# Nombres

Cambiar los nombres de las variables cuando se encuentren unos mejores

El nombre de una variable, función o clase debe responder una serie de cuestiones
básicas.
1. Debe indicar por qué existe
2. qué hace
3. cómo se usa

Usar siempre variables constantes para valores constantes que expresen su intencion

## Evitar la desinformación

Los programadores deben evitar dejar pistas falsas que dificulten el significado del
código

No haga referencia a un grupo de cuentas como accountList a menos que realmente
sea una lista (List).
Por tanto, resulta más adecuado usar accountGroup, bunchOfAccounts o simplemente accounts

## Usar nombres que se puedan pronunciar

## Usar nombres que se puedan buscar

 La longitud de un nombre debe corresponderse
al tamaño de su ámbito

## Interfaces e Implementaciones

Las interfaces tienen su nombre sin poner prefijos como IUser, sino User.
Si eso se pone sufijo en la implementacion, como, UserImp.

## Nombres de clases

Las clases y los objetos deben tener nombres o frases de nombre como Customer,
WikiPage, Account y AddressParser. Evite palabras como Manager, Processor, Data, o Info
en el nombre de una clase. El nombre de una clase no debe ser un verbo.

## Nombres de métodos

Los métodos deben tener nombres de verbo como postPayment, deletePage o save.
Los métodos de acceso, de modificación y los predicados deben tener como nombre su
valor y usar como prefijo get, set e is de acuerdo al estándar de javabean[9]

## Una palabra por concepto

Elija una palabra por cada concepto abstracto y manténgala. Por ejemplo, resulta
confuso usar fetch, retrieve y get como métodos equivalentes de clases distintas. 

## No haga juegos de palabras

Evite usar la misma palabra con dos fines distintos. 

Por ejemplo, usar add para suma y para inclussion en array.

## Usar nombres de dominios de soluciones

use términos informáticos, algoritmos, nombres de patrones, términos matemáticos y demás

El nombre AccountVisitor tiene mucho significado para un programador
familiarizado con el patrón VISITOR

## Añadir contexto con sentido

Agrupar variables del mismo contexto en una clase como Address o usar prefijos tipo  addrFirstName, addrLastName, addrState

# Funciones

## Tamaño reducido

Deberian ser como maximo de unas 20 linias y ser lo maximo reducidas possibles.

## Bloques y sangrado

Los if else while deberian tener 1 sola linia con llamada a una funcion

El nivel de sangrado de una función no debe ser mayor de uno o dos.

## Hacer una cosa

LAS FUNCIONES SÓLO DEBEN HACER UNA COSA. DEBEN HACERLO
BIEN Y DEBE SER LO ÚNICO QUE HAGAN

Si una función sólo realiza los pasos situados un nivel por debajo del nombre de la
función, entonces hace una cosa

## Evitar Secciones en funciones

 Verá que la función generatePrimes se divide en secciones
como declaraciones, inicializaciones y filtros
Es un síntoma evidente de que hace más de
una cosa. Las funciones que hacen una sola cosa no se pueden dividir en secciones

## Un nivel de abstracción por función

El Listado 3-1 incumple esta regla.
Incluye conceptos a un elevado nivel de abstracción, como getHtml(); otros se encuentran
en un nivel intermedio, como StringpagePathName = PathParser.render(pagePath) y hay
otros en un nivel especialmente bajo, como .append(“\n”)

## Leer código de arriba a abajo: la regla descendente

El objetivo es que el código se lea como un texto de arriba a abajo[14]. Queremos que
tras todas las funciones aparezcan las del siguiente nivel de abstracción para poder leer el
programa, descendiendo un nivel de abstracción por vez mientras leemos la lista de
funciones. Es lo que denomino la regla descendente

## Instrucciones Switch

Una intruccion switch significa que la funcion hace multiples cosas. Por tanto hay que 
tratar de evitarlas.

Mi regla general para las instrucciones switch es que se pueden tolerar si sólo
aparecen una vez, se usan para crear objetos polimórficos y se ocultan tras una relación de
herencia para que el resto del sistema no las pueda ver [G23].
