#version 1.0 date-21-6-2024

#This script is used to run the firefox browser from the docker image.

#!bin/bash

#Allow Docker Containers to Access X Server:
xhost +local:docker

#terminate pervoious containers.
docker stop $(docker ps -a | grep 'csm15m/v_1.0:v1.0' | awk '{print $1}')

#Runs the docker container in display enivronment
sudo docker run -it     --env="DISPLAY"     --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw"     csm15m/v_1.0:v1.0 firefox