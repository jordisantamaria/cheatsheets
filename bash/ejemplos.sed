cat mashiro.txt | grep 'hola [^k]'
cat mashiro.txt | grep 'hola [k]'
cat mashiro.txt | grep 'hola.k'

cat mashiro.txt | grep '^h'
cat mashiro.txt | grep 'hola*.k' #holaaaa kuro

cat mashiro.txt | grep 'o$'  #termina con o


sed 's/<[/a-z]*>/<kuro>/g' index.html  #substituye todos los tags x <kuro>

echo "Mac OS X es un UNIX" | grep 'Linux\|UNIX'

sed -n '/88/s/14/ 255/p' resultado.txt
sed -n '/<body/,/<\/body>/s/meta//pg' index.html

sed -n '/<body/,/<\/body> /s/meta//pg; s/creand/hola/p' index.html

#n multilinea con { }
sed -n '/<body/,/<\/body>/ {
	s/meta//pg
	s/creand/hola/p
}' index.html

#sed '[addr]s/[patron]/[substitucion]/[flags]'

sed '/NAME: */ {
	s//.SH NAME\
	/
	s/ - / \/- "/
	s/$/"/
}' close.txt

#procedimiento = para numero de linia
sed -n '/.*::.*(.*).*{/{
	=
	p
}' DummyDriver.cpp

#uso de w

sed '/, MA/w direcciones_ma.txt
	 /, VA/w direcciones_va.txt
	 /, SE/w direcciones_se.txt' direcciones.txt

#uso de r

sed '/<copyright>/ {
	s///
	r copyright.html
	}' index.html

#eliminar repetidos
cat anki.txt | sort | uniq > import.txt
cat import.txt > anki.txt


#n para modificar fichero kanjis para anki
sed '
	/^$/d
	s/;/,/g
	/(/{
		s//;&/
		s/:/<div>/
		s/$/<\/div>/
	}' anki.txt > import.txt



cat anki.txt | tr '(;):' ';, \n'

sed 'a\
Hello world' anki.txt

#mostrar 10 primeras lineas
sed '10q' anki.txt

# function n salta a next line, y las funciones antes de ella no se ejecutan en las siguientes linias
sed '#n
	 /--*/ {
	 		n
	 		s/.*/| &/
	 		p
	 		n

	 }
	 p' titulo.txt

sed '/Enero del$/ {
	N
	s/Enero del\n2002/Febrero del\
	2001/
}' macpro.txt

sed '/^$/ {
	N
	/^\n$/D
}' lineas.txt

#substituir <b> por <i> si cumple el patron entre 2 lineas
sed '/<b>/{
	$!N
	s/<b>\([^<]*\)<\/b>/<i>\1<\/i>/g
	P
	D
}' macpro.html

#invertir entrada
sed '$! {
	G
	h
	d
}
p
g' macpro.html

#poner todo en mayus
sed '{
	y/abcdefghijklmnopqrstuvwyz/ABCDEFGHIJKLMNOPQRSTUVWYZ/
}' macpro.html

#poner en mayus la primera letra del nombre de las funciones
sed '/function / {
	h
	s/.*function *\(.\).*{/\1/
	y/abcdefghijklmnopqrstuvwyz/ABCDEFGHIJKLMNOPQRSTUVWYZ/
	G
	s/\(.*\)\n\(.*function *\).\(.*\)/\2\1\3/
}' functions.txt

#juntar bloques en parrafos <p>
sed '/^$/! {
	   H
	   d
}
/^$/ {
	x
	s/^\(.*\)$/<p>\1<\/p>/
}' parrafos.txt
