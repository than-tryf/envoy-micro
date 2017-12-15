#!/bin/bash

docker build -t goservice -f $PWD/dockerfiles/Dockerfile-goservice $PWD >/dev/null 2>&1
docker run -d --network=envoymesh --net-alias=goservice --name goservice goservice >/dev/null 2>&1
echo -e "\e[32mOK!"
