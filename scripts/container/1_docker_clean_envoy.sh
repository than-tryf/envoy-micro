#!/bin/bash

docker stop $(docker ps -a -q ) > /dev/null 2>&1
docker network rm envoymesh > /dev/null 2>&1
docker rm $(docker ps -a -q ) > /dev/null 2>&1 && docker rmi $(docker images -q) -f > /dev/null 2>&1
echo -e -n "\e[32mOK!\n"
