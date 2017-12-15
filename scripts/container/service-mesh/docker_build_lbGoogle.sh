#!/bin/bash

docker build -t loadbalancer-google -f $PWD/dockerfiles/Dockerfile-loadbalancer-google $PWD > /dev/null 2>&1
docker run -d -p 8000:80 -p 9001:9001 --network=envoymesh --net-alias=load-balancer-google --name loadbalancer-google loadbalancer-google > /dev/null 2>&1
echo -e -n "\e[32mOK!\n"
