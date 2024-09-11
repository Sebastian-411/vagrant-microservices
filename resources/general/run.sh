#!/bin/bash

# Get the absolute path of the directory where this script is located
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Absolute path of the .env file in the service folder
ENV_FILE="$(realpath "$DIR/../resources/.env")"
echo $ENV_FILE

# Check if the .env file exists
if [ ! -f "$ENV_FILE" ]; then
  echo "Error: The .env file does not exist in the service folder ($ENV_FILE)."
  exit 1
fi

source $ENV_FILE

# Extract the repository URL from the .env file
URL_REPO=$DOCKER_URL_REPO

echo $URL_REPO

if [ -z "$URL_REPO" ]; then
  echo "Error: DOCKER_URL_REPO variable not found in the .env file."
  exit 1
fi

if [ -z "$PORT_EXPOSE_IN" ]; then
  echo "Error: PORT_EXPOSE_IN variable not found in the .env file."
  exit 1
fi

if [ -z "$PORT_EXPOSE_OUT" ]; then
  echo "Error: PORT_EXPOSE_OUT variable not found in the .env file."
  exit 1
fi

# Path to the general script
GENERAL_SCRIPT="$(realpath "$DIR/download_image.sh")"

echo $GENERAL_SCRIPT
echo $PORT_EXPOSE_IN
echo $PORT_EXPOSE_OUT

# Check if the general script exists
if [ ! -f "$GENERAL_SCRIPT" ]; then
  echo "Error: download_image.sh script does not exist in the general folder."
  exit 1
fi

# Execute the general script
bash $GENERAL_SCRIPT "$URL_REPO" "$ENV_FILE"

echo "Container execution successful."
