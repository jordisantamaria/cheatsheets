# Grammar
**verbo + (objeto de texto) + sustantivo.**

- Eliminar palabra: `dw`

- Se puede usar numeros para hacerlo x veces: `d5w`

- Para operaciones de linia completa, usar el verbo 2 veces: `dd`

## Sustantivos (movimientos)

### Movimientos basicos

- `h` izquierda
- `j` abajo
- `k` arriba
- `l` derecha

### Palabra / linia

- `w` siguiente palabra
- `e` end of word
- `b` back to last word
- `ge` go to end of last word
- `$` Final de linia
- `0` Inicio de linia

### Buscar

- `f + letra` Ir a la primera ocurrencia de la letra. Ir a siguiente ocurrencia `;`, anterior `,`
- `%` El otro lado de la pareja (), [], {}  

### Frase parrafo
- `(` Frase previa. Frase termina en `. ! ?
- `)` frase siguiente`
- `{` parrafo previo. Separado por una linia en blanco.
- `}` parrafo siguiente
  
### Fichero

- `gg` Inicio de fichero
- `G` Final de fichero
- `nG` Linia n del fichero.
- `n%` Linia en el % del fichero

## Objetos de texto

- `i + objeto` Dentro del objeto de texto
- `a + objeto` Fuera del objeto de texto

```javascript
// Ejemplo, al situar el cursor dentro de (text)
di(
da{
//eliminar palabra
diw 
```

Objetos de texo mas comunes:
- `w` palabra
- `p` parrafo
- `s` sentence "frase"
- `( o )` (texto)
- `{ o }` {texto}
- `[ o ]` [texto]
- `< o >` <texto>
- `t` xml tag
- `"` "texto"

## Verbos (operadores)

- `y` copiar un texto "yank"
- `d` eliminar un texto y guardarlo en registro
- `D` Eliminar hasta final de linia
- `c` "cambiar", eliminar un texto y guardarlo en registro y comenzar en modo insertar
- `gu` cambiar a minusculas
- `gU` cambiar a majusculas
- `p` pegar texto

## Comando del punto

Repite el último comando de cambio

- Borra repetidamente texto hasta **,** : `df,` ...
- Repite el texto escrito en modo editar en la direccion segun el comando que se uso para entrar en modo editar: `hola mundo` ...

# Modo insertar

Formas de cambiar al modo insertar

- `i`  Antes del cursor.
- `I`  A principio de linia.
- `a`  Después del cursor.
- `A`  Final de la linea.
- `o`  Crea una nueva línea debajo del cursor.
- `O`  Crea una nueva línea encima del cursor.
- `s`  Borra el carácter debajo del cursor.
- `S`  Borra la actual línea
- `gi` En la ultima posición donde se cambio al modo normal.  
- `gI` Al principio de una línea (columna 1)


## Formas de salir del modo insertar 

```
<esc>    Salir del modo insertar y volver al modo normal
Ctrl-c   Similar a Ctrl-[ y <esc>, pero no controla las abreviaciones
```

- Salir por solo 1 comando: `Ctrl-o`

## Borrar segmentos en el modo insertar

También sirven para linea de comandos y modo Ex.

```
Ctrl-h    Borrar un carácter
Ctrl-w    Borrar una palabra
Ctrl-u    Borrar una línea entera
```

# Registers

List registers-> :register

- copy: "0
- delete: "1-9
- small delete: "-
- named register: "a-z

## De lectura
- last inserted text: ".
- Las command executed: ":
- filename: "%
- last filename: "#
- last search: "/

## Calc

-From normal mode: "=1+1<Enter>p
-From edit mode: Ctrl-r =1+1
-To use named register values: "=@a

## Macros

- start macro: qa
- end macro: q
- ejecute macro: @a
- incluir macro a continuacion: qA
- Copiar macro a otro registro: :let @x = @a

Las macros se pueden ejecutar de forma recursiva "hasta que llegue a final de fichero", usando @a en medio de la macro.
Tambien se pueden ejecutar repetidas veces con n@a

### Modificar macro

1. Obtener macro: :put a
2. Modificar macro
3. Guardar macro con "ayy

# Deshacer cambios

- ultimo cambio: u
- Ultimos cambios en linia: U
- Rehacer: C-r
- :earlier 10{s,m,d,h}
- :later 10{s,m,d,h}

# Modo visual

- ayuda: :h visual-operators
- caracter: v
- linia: V
- bloque: Ctrl-v
- saltar al extremo de seleccion: o
- resaltar ultima zona marcada: gv
- reemplazar texto seleccionado: rx
- Eliminar caracter resaltado: x
- Tab lines: <>

## Editar en multiple linias

1. Entrar en modo visual Ctrl-v
2. Marca las linias a editar
3. Pulse A "delante" o I "detras" y escribe el nuevo texto
4. Sal de modo visual (ESC)




# Global command

Ejecuta el comando en las linias que cumplan el patron.

```
:g/patrón/comando
```

Negado:

```
:g!/{patrón}/{comando}
:v/{patrón}/{comando}
```

## Comando normal:

Con el comando normal, podemos incluir texto en el patron.

Ejemplo: incluir ; a final de linia
```
:g/./normal A;
```

Ejecutar macro:

```
:g/const/normal @a;
```

## Recursivo

```
:g/console/g/two/d
```

## Sin comando

Hace print de las linias que cumplen la regexp

## Multiples patrones

```
:g/patrón1/,/patrón2/comando
```

Ejemplo, borrar linias vacias:

```
:g/^$/,/./j
```

## Bang

- STDOUT

Copiar el resultado del comando al fichero actual.

```
:r !{cmd}
```

**:r archivo.txt** => copia el archivo

Ejemplo: `:r !ls`

- STDIN `:w !cmd`
Ejemplo: 
```
console.log("Hola Vim");
console.log("Vim es asombroso");
:w !node
```

Se le puede pasar el numero de linia: `:2w !node`

- ejecutar comando externo `:!cmd`

Ejemplo: `:!tree`


## Linia de comandos

- moverse una palabra derecha: shift ->
- moverse una palabra izquierda: shift <-
- Inicio linia: Ctrl-B
- Final linia: Ctrl-E
- Eliminar palabra: Ctrl-w
- Editar y ejecutar comando: Ctrl-f
- Pegar texto de registro: Ctrl-R a
- Autocompletar: tab o shifttab previa
- Historial comandos: `:his`


## Tags

- Create tagfile:
