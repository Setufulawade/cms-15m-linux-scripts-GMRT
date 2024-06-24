#version 1.0 date-21-6-2024, Setu Fulwade/JPK $

##This script will donwload docker and load the docker image for apt package manager.

#!/bin/bash

echo "installing docker"

#Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

#Install Docker Engine, containerd, and Docker Compose:
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin


#redirect to docker_status.sh
./runfirefoxdocker.sh






























# if command -v docker &> /dev/null
# then

#     echo "docker is already installed"
#     sudo systemctl restart docker
#     // docker -- image search message
#     // Load
#     // check load 
#     exit 0 

#     exit 1

# else

#     echo "docker is not installed installing docker"

    
#     # Add Docker's official GPG key:
#     sudo apt-get update
#     sudo apt-get install ca-certificates curl
#     sudo install -m 0755 -d /etc/apt/keyrings
#     sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
#     sudo chmod a+r /etc/apt/keyrings/docker.asc

#     # Add the repository to Apt sources:
#     echo \
#     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
#     $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#     sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
#     sudo apt-get update


#     #Install Docker Engine, containerd, and Docker Compose:
#     sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin



#     #runs the docker daemon
#     sudo systemctl start docker
#     # Enable Docker to start on boot
#     sudo systemctl enable docker

#     echo "installing docker image"
#     #sudo docker pull csm15m/fire:latest
#     // docker -- image search message
#     // Load
#     // check load 
#     exit 0
# fi

# sudo systemctl status docker
# if [ $? -eq 0 ]
# then
# 	echo "Docker is running "
#        #downloads the docker image which contains the firefox 52.7.3 version along with falsh player
# 	exit 0
# else 
# 	echo "Error : Docker is not Running "
# 	exit 1
# fi

