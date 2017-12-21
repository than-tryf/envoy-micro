#!/bin/bash

#TODO create the bash script that builds the docker container
docker build -t jservice -f $PWD/dockerfiles/Dockerfile-jservice $PWD >/dev/null 2>&1
docker run -d --network=envoymesh --net-alias=jservice --name jservice jservice >/dev/null 2>&1
echo -e "\e[32mOK!"
