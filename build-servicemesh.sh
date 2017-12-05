#!/bin/sh

cd scripts
chmod +x *.sh
./docker_clean_envoy.sh
./build_envoy_dockernet.sh
cd ..

cp envoy-config/load-balancer-google.json dockerfiles/load-balancer-google.json
cp scripts/build_lb_container_google.sh dockerfiles/build_lb_container_google.sh

cd dockerfiles
chmod +x *.sh
./build_lb_container_google.sh

rm *.json && rm *.sh
cd ..

docker ps
