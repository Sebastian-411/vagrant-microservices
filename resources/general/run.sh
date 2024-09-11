#!/bin/bash

# Obtener la ruta absoluta del directorio donde se encuentra este script
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Ruta absoluta del archivo .env en la carpeta del servicio
ENV_FILE="$(realpath "$DIR/../resources/.env")"
echo $ENV_FILE

# Verificar que el archivo .env existe
if [ ! -f "$ENV_FILE" ]; then
  echo "Error: El archivo .env no existe en la carpeta del servicio ($ENV_FILE)."
  exit 1
fi

source $ENV_FILE

# Extraer la URL del repositorio desde el .env
URL_REPO=$DOCKER_URL_REPO

echo $URL_REPO

if [ -z "$URL_REPO" ]; then
  echo "Error: No se encontró la variable DOCKER_URL_REPO en el archivo .env."
  exit 1
fi

if [ -z "$PORT_EXPOSE_IN" ]; then
  echo "Error: No se encontró la variable PORT_EXPOSE_IN en el archivo .env."
  exit 1
fi

if [ -z "$PORT_EXPOSE_OUT" ]; then
  echo "Error: No se encontró la variable PORT_EXPOSE_OUT en el archivo .env."
  exit 1
fi


# Ruta del script general
GENERAL_SCRIPT="$(realpath "$DIR/download_image.sh")"

echo $GENERAL_SCRIPT
echo $PORT_EXPOSE_IN
echo $PORT_EXPOSE_OUT

# Verificar que el script general existe
if [ ! -f "$GENERAL_SCRIPT" ]; then
  echo "Error: El script download_image.sh no existe en la carpeta general."
  exit 1
fi

# Ejecutar el script general
bash $GENERAL_SCRIPT "$URL_REPO" "$ENV_FILE"

echo "Ejecución del contenedor exitosa."
