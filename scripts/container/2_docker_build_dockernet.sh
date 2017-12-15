#!/bin/sh

docker network rm envoymesh >/dev/null 2>&1

# Build docker envoy network mesh
docker network create -d bridge envoymesh >/dev/null 2>&1
echo -e "\e[32mOK!"
