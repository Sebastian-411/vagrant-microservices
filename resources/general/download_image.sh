#!/bin/bash

# Verificar si se ha proporcionado la URL de la imagen Docker
if [ -z "$1" ]; then
  echo "Error: No se ha proporcionado el nombre de la imagen Docker."
  echo "Uso: $0 <docker_image_name> <ruta_env>"
  exit 1
fi



DOCKER_IMAGE_NAME="$1"

# Verificar si se ha proporcionado la ruta del archivo .env
if [ -z "$2" ]; then
  echo "Error: No se ha proporcionado la ruta del archivo .env."
  echo "Uso: $0 <docker_image_name> <ruta_env>"
  exit 1
fi

ENV_FILE="$2"

source $ENV_FILE

# Verificar si el archivo .env existe
if [ ! -f "$ENV_FILE" ]; then
  echo "Error: El archivo .env no existe en la ruta proporcionada: $ENV_FILE"
  exit 1
fi

# Verificar si la imagen ya existe localmente
echo "Verificando la imagen Docker: $DOCKER_IMAGE_NAME..."
IMAGE_EXIST=$(docker images -q "$DOCKER_IMAGE_NAME")

if [ -n "$IMAGE_EXIST" ]; then
  echo "La imagen $DOCKER_IMAGE_NAME ya está descargada."
else
  echo "Descargando la imagen $DOCKER_IMAGE_NAME..."
  docker pull "$DOCKER_IMAGE_NAME"

  if [ $? -ne 0 ]; then
    echo "Error: No se pudo descargar la imagen $DOCKER_IMAGE_NAME."
    exit 1
  fi
fi

# Verificar si un contenedor de la imagen ya está corriendo
echo "Verificando si el contenedor ya está en ejecución..."
CONTAINER_RUNNING=$(docker ps --filter ancestor="$DOCKER_IMAGE_NAME" --format "{{.ID}}")

if [ -n "$CONTAINER_RUNNING" ]; then
  echo "El contenedor de la imagen $DOCKER_IMAGE_NAME ya está corriendo."
else
  echo "Iniciando un nuevo contenedor para la imagen $DOCKER_IMAGE_NAME..."
  echo $PORT_EXPOSE_IN
  echo $PORT_EXPOSE_OUT

  docker run -d \
    --env-file "$ENV_FILE" \
    -p "$PORT_EXPOSE_OUT:$PORT_EXPOSE_IN" \
    "$DOCKER_IMAGE_NAME"

  if [ $? -ne 0 ]; then
    echo "Error: No se pudo iniciar el contenedor de la imagen $DOCKER_IMAGE_NAME."
    exit 1
  fi

  echo "El contenedor de la imagen $DOCKER_IMAGE_NAME ha sido iniciado."
fi
