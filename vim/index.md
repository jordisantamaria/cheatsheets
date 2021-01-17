Esc: Modo comandos
i: Modo editar
vimrc: /usr/share/vim/

# Saliendo:

:q
:w
:q! = salir sin guardar cambios
:h ayuda
:s "substitute": reemplaza un texto por otro
Sustituye foo por bar:
```
s/foo/bar/g
```

# Abriendo

Puedes usar (+ o -c) para añadir comandos justo al abrir
```
vim -c %s/foo/bar/g hola.txt
```

Se pueden concatenar
```
vim +%s/foo/bar/g +%s/bar/baz/g +%s/baz/donut/g hola.txt
```

Abrir multiple ventanas:

o = horizontal, O = vertical

```
vim -o2 hola1.txt hola2.txt
```

Abrir en misma ventana y diferents buffers
```
vim hola1.txt hola2.txt
```

Con multiples tabs:

```
vim -p archivo1.js archivo2.js archivo3.js
```

# Suspender

Ctrl-Z: suspender session
fg: retomar session

# Buffers

Por cada fichero que abres, vim crea un buffer.
- Ver buffers activos=> `:ls`
- Moverse entre buffers: `:b buffername`
- Next buffer: `:bn`
- Remove buffer: `bdelete bufername`
- Salir de todos los buffers: `:qall` `:wqall`

# Ventanas

- Crear nueva ventana: `:split file2.js` `vsplit file2.js`
- Ctrl-w h: Left window
- Ctrl-w j: Down window
- Ctrl-w j: Top window
- Ctrl-w j: Right window 
- Ctrl-W v:     Abre una nueva división vertical
- Ctrl-W s:     Abre una nueva división horizontal
- Ctrl-W c:     Cierra una ventana
- Ctrl-W o:     Hace que la ventana actual sea la única en la pantalla y cierra las demás ventanas

# tabs

- `:tabnew archivo.txt`    Abre archivo.txt en una nueva pestaña
- `:tabclose`              Cierra la pestaña actual
- `:tabnext` or `gt`            Ir a la próxima pestaña
- `:tabprevious`        Ir a la pestaña previa
- `:tablast`            Ir a la última pestaña
- `:tabfirst`           Ir a la primera pestaña
- `gt3` Ir a la pestaña 3

# Abrir y buscar archivos

## Edit

- `:edit archivot.xt` : Abrir archivo
Se puede usar comodines para buscar un archivo. Al ir dandole tab te va mostrando los diferentes de esa expression.
```
:edit *.yml<tab>
```
Para buscar de forma recursiva en todas las carpetas.
```
:edit **/*.md<tab>
```
Se puede usar + para dar comando de ir a x linia al abrir el fichero.
```
:edit +5 /test/unit/helper.spec.js
:edit +/const /test/unit/helper.spec.js
```

## Find

Funciona igual que edit, pero se puede actualizar la path para busquedas mas eficientes.
```
# vim folder to path, so can find directly files of this folder
:set path+=vim/
```

**Be able to find all files of root folder**
```
:set path+=$PWD/**
```

# Grammar

Sustantivo + verbo. Ejemplo:

Eliminar palabra
```
dw
```
Se puede usar numeros para hacerlo x veces.
```
# Eliminar 5 palabras
d5w
```
Para operaciones de linia completa, usar el verbo 2 veces
```
# Remove line
dd
```

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

```
# Ejemplo, al situar el cursor dentro de (text)
di(
da{
diw #eliminar palabra
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
- `c` "cambiar", eliminar un texto y guardarlo en registro y comenzar en modo insertar
- `gu` cambiar a minusculas
- `gU` cambiar a majusculas

# Editando config vimrc
```
~/.vim/vimrc
```
Para ver la distancia de linias a saltar con **jk**
```
set relativenumber number
```
