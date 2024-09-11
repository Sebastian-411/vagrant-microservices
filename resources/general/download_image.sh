#!/bin/bash

# Check if the Docker image name has been provided
if [ -z "$1" ]; then
  echo "Error: Docker image name not provided."
  echo "Usage: $0 <docker_image_name> <env_file_path>"
  exit 1
fi

DOCKER_IMAGE_NAME="$1"

# Check if the .env file path has been provided
if [ -z "$2" ]; then
  echo "Error: .env file path not provided."
  echo "Usage: $0 <docker_image_name> <env_file_path>"
  exit 1
fi

ENV_FILE="$2"

source $ENV_FILE

# Check if the .env file exists
if [ ! -f "$ENV_FILE" ]; then
  echo "Error: .env file does not exist at the provided path: $ENV_FILE"
  exit 1
fi

# Check if the Docker image already exists locally
echo "Checking Docker image: $DOCKER_IMAGE_NAME..."
IMAGE_EXIST=$(docker images -q "$DOCKER_IMAGE_NAME")

if [ -n "$IMAGE_EXIST" ]; then
  echo "The image $DOCKER_IMAGE_NAME is already downloaded."
else
  echo "Downloading the image $DOCKER_IMAGE_NAME..."
  docker pull "$DOCKER_IMAGE_NAME"

  if [ $? -ne 0 ]; then
    echo "Error: Could not download the image $DOCKER_IMAGE_NAME."
    exit 1
  fi
fi

# Check if a container from the image is already running
echo "Checking if the container is already running..."
CONTAINER_RUNNING=$(docker ps --filter ancestor="$DOCKER_IMAGE_NAME" --format "{{.ID}}")

if [ -n "$CONTAINER_RUNNING" ]; then
  echo "A container from the image $DOCKER_IMAGE_NAME is already running."
else
  echo "Starting a new container for the image $DOCKER_IMAGE_NAME..."
  echo $PORT_EXPOSE_IN
  echo $PORT_EXPOSE_OUT

  docker run -d \
    --env-file "$ENV_FILE" \
    -p "$PORT_EXPOSE_OUT:$PORT_EXPOSE_IN" \
    "$DOCKER_IMAGE_NAME"

  if [ $? -ne 0 ]; then
    echo "Error: Could not start the container for the image $DOCKER_IMAGE_NAME."
    exit 1
  fi

  echo "The container for the image $DOCKER_IMAGE_NAME has been started."
fi