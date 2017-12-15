#!/bin/sh

docker build -t goservice . -f Dockerfile-goservice
docker run -d --network=envoymesh --net-alias=goservice --name goservice goservice 
