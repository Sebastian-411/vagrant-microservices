#!/bin/bash

# Actualizar el sistema
echo "Actualizando el sistema..."
sudo apt-get update -y

# Instalar dependencias
echo "Instalando dependencias necesarias..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Añadir el repositorio oficial de Docker
echo "Añadiendo el repositorio de Docker..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Instalar Docker
echo "Instalando Docker..."
sudo apt-get update -y
sudo apt-get install -y docker-ce

# Añadir el usuario vagrant al grupo docker para que no necesite sudo
echo "Añadiendo usuario 'vagrant' al grupo docker..."
sudo usermod -aG docker vagrant

# Verificar que Docker esté funcionando
echo "Verificando que Docker esté funcionando..."
sudo systemctl start docker
sudo systemctl enable docker
docker --version


echo "Instalación de Docker y dependencias completada."
