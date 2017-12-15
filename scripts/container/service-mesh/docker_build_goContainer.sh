#!/bin/sh


docker build -t goservice -f ../../../../dockerfiles/Dockerfile-goservice $PWD../../../../ 
docker run -d --network=envoymesh --net-alias=goservice --name goservice goservice
echo -e "\e[32mOK!"
