# Grammar

**Sustantivo + verbo.**

- Eliminar palabra: `dw`

- Se puede usar numeros para hacerlo x veces: `d5w`

- Para operaciones de linia completa, usar el verbo 2 veces: `dd`


## Sustantivos (movimientos)

- `h` izquierda
- `j` abajo
- `k` arriba
- `l` derecha
- `w` siguiente palabra
- `e` end of word
- `b` back to last word
- `ge` go to end of last word
- `}` Siguiente parrafo
- `$` Final de linia
- `0` Inicio de linia
- `f + letra` Ir a la primera ocurrencia de la letra. Ir a siguiente ocurrencia `;`, anterior `,`
- `(` Frase previa. Frase termina en `. ! ?
- `)` frase siguiente`
- `{` parrafo previo. Separado por una linia en blanco.
- `}` parrafo siguiente
- `%` El otro lado de la pareja (), [], {}
- `gg` Inicio de fichero
- `G` Final de fichero
- `nG` Linia n del fichero.
- `n%` Linia en el % del fichero

### Ventana

- `H` Superior de la ventana
- `M` Media de la ventana
- `L` Inferior ventana
- `nH` n linias desde superior
- `nL` n linias desde inferior

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

# Haciendo scroll

```javascript
Ctrl-e    Desplaza el texto hacia arriba una línea
Ctrl-d    Desplaza media pantalla hacia arriba
Ctrl-f    Desplaza una pantalla completa hacia arriba el texto
Ctrl-y    Desplaza el texto hacia abajo una línea
Ctrl-u    Desplaza media pantalla hacia abajo
Ctrl-b    Desplaza una pantalla completa hacia abajo el texto
```

## Scroll hacia donde esta el cursor

```javascript
zt    LLeva la línea actual donde está el cursor cerca de la parte superior de la pantalla
zz    LLeva la línea actual donde está el cursor a la parte media de la pantalla
zb    LLeva la línea actual donde está el cursor cerca de la parte inferior de la pantalla
```

# Navegación por busqueda

```javascript
/    Busca hacia adelante una coincidencia
?    Busca hacia atrás una coincidencia
n    Repite la última búsqueda en la misma dirección que la búsqueda previa 
N    Repite la última búsqueda en la dirección opuesta que la búsqueda previa
```

```
:set hlsearch => para resaltar busquedas
:noh or :nohlsearch => para quitar el resaltado
```

## Busquedas que coincidan con la palabra del cursor

```
*     Busca la palabra completa bajo el cursor hacia adelante
#     Busca la palabra completa bajo el cursor hacia atrás
g*    Busca la palabra bajo el cursor hacia adelante
g#    Busca la palabra bajo el cursor hacia atrás
```

# Marcando posicion

```
ma    Marca una posición local, estableciendo la marca "a" en la posición actual del cursor
mA    Marca una posición global
'a    Salta a la línea donde se encuentra "a"
:marks Lista de marcas creadas
```

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

# Comando del punto

Repite el último comando de cambio

- Borra repetidamente texto hasta **,** : `df,` ...
- Repite el texto escrito en modo editar en la direccion segun el comando que se uso para entrar en modo editar: `hola mundo` ...