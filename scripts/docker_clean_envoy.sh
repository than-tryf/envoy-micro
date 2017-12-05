#!/bin/sh

docker stop $(docker ps -a -q)
docker network rm envoymesh
#docker rm $(docker ps -a -q) && docker rmi $(docker images -q) -f
docker rmi $(docker images -q) -f
