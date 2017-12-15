#!/bin/sh

#docker build -t loadbalancer-google . -f Dockerfile-loadbalancer-google
docker build -t loadbalancer-google -f ../../../../dockerfiles/Dockerfile-loadbalancer-google $PWD../../../../
docker run -d -p 8000:80 -p 9001:9001 --network=envoymesh --net-alias=load-balancer-google --name loadbalancer-google loadbalancer-google
echo -e "\e[32mOK!"
