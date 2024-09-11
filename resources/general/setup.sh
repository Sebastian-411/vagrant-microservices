#!/bin/bash

# Update the system
echo "Updating the system..."
sudo apt-get update -y

# Install necessary dependencies
echo "Installing required dependencies..."
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

# Add the official Docker repository
echo "Adding the Docker repository..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install Docker
echo "Installing Docker..."
sudo apt-get update -y
sudo apt-get install -y docker-ce

# Add the 'vagrant' user to the Docker group so it doesn't require sudo
echo "Adding 'vagrant' user to the Docker group..."
sudo usermod -aG docker vagrant

# Check if Docker is working
echo "Verifying Docker is working..."
sudo systemctl start docker
sudo systemctl enable docker
docker --version

echo "Docker and dependencies installation completed."
