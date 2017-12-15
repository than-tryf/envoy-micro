#!/bin/sh

docker stop $(docker ps -a -q) >/dev/null 2>&1
docker network rm envoymesh >/dev/null 2>&1
docker rm $(docker ps -a -q) && docker rmi $(docker images -q) -f >/dev/null 2>&1
echo -e "\e[32mOK!"
#docker rmi $(docker images -q) -f
# docker rm $(docker ps -a -q)
