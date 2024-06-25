#version 1.1 date-25-6-2024, Setu Fulwade/JPK $

#This script will donwload docker and load the docker image for yum package manager.

#!/bin/bash

echo "Docker is not installed. Installing Docker..."

# Update the yum packages
sudo yum update -y
if [ $? -ne 0 ]; then
    echo "Installation failed at yum update."
    exit 1
fi

# Set up the repository for Docker
sudo yum install -y yum-utils
if [ $? -ne 0 ]; then
    echo "Installation failed at installing yum-utils."
    exit 1
fi

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
if [ $? -ne 0 ]; then
    echo "Installation failed at adding Docker repo."
    exit 1
fi

# Install Docker Engine, containerd, and Docker Compose
sudo yum install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
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
