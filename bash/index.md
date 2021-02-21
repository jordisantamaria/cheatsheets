# Basics

`man comando`: documentacion comando
`~`: Alt+ñ root dir
`pwd` print working directory   /Users/kuroneko/Desktop/


# Mover/copiar/renombrar


`mv fichero carpetaDestino` mover a mi ruta: mv fichero .
`cp fichero carpetaDestino`
`mv nombreFichero nombreFicheroNuevo`: renombrar
copiar directorios incluidos: cp -r

Borrar ficheros

rm NombreDelArchivo: Elimina el archivo indicado después de rm
rm NombreDelDirectorio/* : Elimina todos los archivos que se encuentren dentro del directorio mencionado.
rm -r NombreDelDirectorio: Elimina el directorio mencionado, junto todos los archivos y más directorios que se encontrarán dentro de él.
Abrir / verContenido fichero   
open nombreFichero
open -a NombreDelPrograma NombreDelArchivo
more NombreDelArchivo muestra el contenido del principio del fichero, con intro sigue hasta el final, en terminal
tail “ultimas 10 linias”  tail -20 fichero
head 20 fichero
cat nombreArchivo   -> ver todo el contenido en terminal
wc nombreArchivo	-> contador de líneas | palabras | caracteres en ese archivo
wc -l nombreArchivo    -> contador de líneas de un archivo
wc -c nombreArchivo   -> contador de caracteres de un archivo
 
Standard input / standard output
STDIN = 0 <  “para pedir una tecla del usuario”
STDOUT = 1 >
STDERR = 2
echo hola > hola.txt   “enviar el output al fichero”
echo mundo >> hola.txt  “añadir contenido nuevo sin borrar el contenido actual”
“| pipe” = Manda el STDOUT o el resultado a otro comando 
Enviar resultado de STDOUT y Errores en ficheros distintos: echo 4 | php script.php 2> errores 1> resultado
Filtrar texto grep

cat * | grep hola     -> devuelve las linias que tienen el contenido hola

Cambiar todas las ocurrencias de un caracter por otro tr

cat emails.txt | tr ‘\n’ ‘,’

Formatear texto con separadores awk

Eliminar linias repetidos de un fichero uniq

cat anki.txt | sort | uniq > import.txt
