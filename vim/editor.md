# Saliendo:

```javascript
:q
:w
:q! = salir sin guardar cambios
:h ayuda
:s "substitute": reemplaza un texto por otro
```

Sustituye foo por bar:

```javascript
s/foo/bar/g
```

# Abriendo

Puedes usar (+ o -c) para añadir comandos justo al abrir

```javascript
vim -c %s/foo/bar/g hola.txt
```

Se pueden concatenar

```javascript
vim +%s/foo/bar/g +%s/bar/baz/g +%s/baz/donut/g hola.txt
```

Abrir multiple ventanas:

o = horizontal, O = vertical

```javascript
vim -o2 hola1.txt hola2.txt
```

Abrir en misma ventana y diferents buffers

```javascript
vim hola1.txt hola2.txt
```

Con multiples tabs:

```javascript
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

# Editando config vimrc

```
~/.vim/vimrc
```

```bash
# Para ver la distancia de linias a saltar con **jk**
set relativenumber number
# Para resaltar las busquedas que coinciden
set hlsearch
```