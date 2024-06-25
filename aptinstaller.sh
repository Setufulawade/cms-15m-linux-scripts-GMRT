#version 1.1 date-25-6-2024, Setu Fulwade/JPK $

##This script will donwload docker and load the docker image for apt package manager.

#!/bin/bash

echo "Installing Docker"

# Update the apt package index
sudo apt-get update
if [ $? -ne 0 ]; then
    echo "Installation failed at apt-get update."
    exit 1
fi

# Install required packages for Docker installation
sudo apt-get install -y ca-certificates curl
if [ $? -ne 0 ]; then
    echo "Installation failed at installing ca-certificates and curl."
    exit 1
fi

# Create the directory for apt keyrings
sudo install -m 0755 -d /etc/apt/keyrings
if [ $? -ne 0 ]; then
    echo "Installation failed at creating /etc/apt/keyrings directory."
    exit 1
fi

# Download Docker's official GPG key
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
if [ $? -ne 0 ]; then
    echo "Installation failed at downloading Docker's GPG key."
    exit 1
fi

# Set the appropriate permissions for the GPG key
sudo chmod a+r /etc/apt/keyrings/docker.asc
if [ $? -ne 0 ]; then
    echo "Installation failed at setting permissions for Docker's GPG key."
    exit 1
fi

# Add Docker repository to apt sources
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
if [ $? -ne 0 ]; then
    echo "Installation failed at adding Docker repository to apt sources."
    exit 1
fi

# Update the apt package index again
sudo apt-get update
if [ $? -ne 0 ]; then
    echo "Installation failed at apt-get update after adding Docker repository."
    exit 1
fi

# Install Docker Engine, containerd, and Docker Compose
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
if [ $? -ne 0 ]; then
    echo "Installation failed at installing Docker."
    exit 1
fi

echo "Docker installed successfully."

# Redirect to docker_status.sh
./runfirefoxdocker.sh
if [ $? -ne 0 ]; then
    echo "Failed to execute runfirefoxdocker.sh"
    exit 1
fi