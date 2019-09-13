#!/bin/bash

# recibir 3 parametros -> nombre-proyecto, js, media

proyecto=$1
js=$2
media=$3

echo "El nombre del proyecto es : $proyecto"

# crear carpeta nombre-proyecto

[ -d $proyecto ] || mkdir $proyecto 

# crear nombre-proyecto/index.html y nombre-proyecto/main.css

touch ./$proyecto/index.html ./$proyecto/main.css

# si hemos indicado en el tercer parametro que vamos a usar 'media', se crea una carpeta con este nombre dentro del directorio del proyecto

if [ "$media" == "media" ]; then
	[ -d ./$proyecto/media ] || mkdir ./$proyecto/media
fi

# escribir plantilla en index.html

echo "<!DOCTYPE html>
<html lang="es">
  <head>
    <title>$proyecto</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- CSS -->
    <link rel="stylesheet" href="main.css">
  </head>
  <body>" >> ./$proyecto/index.html

  # si hemos indicado js en el segundo parametro, se crea un archivo app.js y se anade al template generado en el archivo .html
  if [ "$js" == "js" ]; then
    touch ./$proyecto/app.js
    echo "
    <!-- JS script -->
    <script src=\"app.js\">" >> ./$proyecto/index.html
  fi

  echo "
  </body>
</html>" >> ./$proyecto/index.html


# abrir vim nombre-proyecto/index.html

vim ./$proyecto/index.html
