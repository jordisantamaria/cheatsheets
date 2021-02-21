# Ventana

- `H` Superior de la ventana
- `M` Media de la ventana
- `L` Inferior ventana
- `nH` n linias desde superior
- `nL` n linias desde inferior

# Marcando posicion

```
ma    Marca una posición local, estableciendo la marca "a" en la posición actual del cursor
mA    Marca una posición global
'a    Salta a la línea donde se encuentra "a"
:marks Lista de marcas creadas
```

# Haciendo scroll

```javascript
Ctrl-e    Hacia adelante 1 linia
Ctrl-d    Hacia adelante 50%
Ctrl-f    Hacia adelante 100%
Ctrl-y    Hacia atras 1 linia
Ctrl-u    Hacia atras 50%
Ctrl-b    Hacia atras 100%
```

# Scroll hacia donde esta el cursor

```javascript
zt    Parte superior pantalla
zz    Centro pantalla
zb    Parte inferior pantalla
```

# Navegación por busqueda

```javascript
/    Busca hacia adelante una coincidencia
?    Busca hacia atrás una coincidencia
n    Siguiente coincidencia 
N    Siguiente coincidencia hacia atras
:history /   Historial de busquedas
```

- Strict solo minusculas: \C
- Repetir busqueda: //
- Multiple busquedas a la vez: /\vhello|hola

```
:set hlsearch => para resaltar busquedas
:noh or :nohlsearch => para quitar el resaltado
```

`Ctrl o`: Volver a la posicion anterior del cursor

## Navegar con regexp

Ejemplos:
```
/[0-9]
/^hello
/hello$
/[0-9]\{2\}
/[0-9]*
```

### Rangos predefinidos

```
\d    Dígitos [0-9]
\D    No digitos [^0-9]
\s    Caracter de espacio en blanco (espacio y tabulador)
\S    Caracter que no sea espacio en blanco (todo excepto un espacio o tabulador)
\w    Caracter de palabra [0-9A-Za-z_]
\l    Letras minúsculas [a-z]
\u    Letras mayúsculas [A-Z]
```

Ejemplo: `%s/\v(\w+) (\w+)/\1 \U\2/`


## Replace

- :s/bueno/increíble/
- Repetir ultimo: `:s` o `&`
- Sustituis ultimo texto buscado: `:s//increible/
- En archivo entero: `:%s`
- Usar patron encontrado al sustituir: :s/\d/"&"/
- Usando `( )` podemos agrupar para usar con \1\2\3...: `:%s/\(\w\+\) \(\w\+\)/\2 \1/`

### Opciones de sustitucion:

```
&    Reutiliza las opciones del comando previo de sustitución. Debe pasarse como primera opción. Must be passed as the first flag.
g    Reemplaza todas las ocurrencias encontradas en la línea actual.
c    Pregunta una confirmación en cada sustitución.
e    Evita que se muestre un mensaje de error cuando falla una sustitución.
i    Realiza una sustitución sin tener en cuenta mayúsculas y minúsculas.
I    Realiza una sustitución teniendo en cuenta mayúsculas y minúsculas.
```


## Include search

`:?regexp?t.`: Copiar linia de regexp y pegar donde estabas.
`ij`: Para buscar en ficheros del proyecto.
`dj`: Per a buscar definicio de funcions
`Ctrl w Ctrl i`: Abrir nueva ventana buscando la ocurrencia sobre el cursor en otro fichero

### Fallback of include search, tags

Configurar tags file
`tj`: para buscar en ficheros del proyectos

## Busquedas que coincidan con la palabra del cursor

```
*     Hacia adelante
#     Hacia atras
```

