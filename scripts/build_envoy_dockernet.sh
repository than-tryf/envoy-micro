#!/bin/sh

docker network rm envoymesh

# Build docker envoy network mesh
docker network create -d bridge envoymesh
