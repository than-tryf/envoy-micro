#!/bin/sh


# Initializations

cd scripts
chmod +x *.sh
./docker_clean_envoy.sh
./build_envoy_dockernet.sh
cp tests/start_monservices.sh ../dockerfiles/start_monservices.sh
cd ..

# Building

docker run -d --network=envoymesh --net-alias=my-rabbit --hostname my-rabbit --name some-rabbit -p 8080:15672 rabbitmq:3-management
# docker run -d -it --dns localhost -e CONSUL_HTTP_ADDR=localhost:8500 -e CONSUL_RPC_ADDR=localhost:8400 --hostname my-rabbit --name some-rabbit -p 8080:15672 rabbitmq:3-management

#The Google load balancer
cp envoy-config/load-balancer-google.json dockerfiles/load-balancer-google.json
cp scripts/build_lb_container_google.sh dockerfiles/build_lb_container_google.sh

cd dockerfiles
chmod +x *.sh
./build_lb_container_google.sh
cd ..

#The goservice
cd scripts
./build_go_service.sh
cd ..
cp services/goservice/bin/goservice dockerfiles/goservice
cp scripts/start_goservices_in_docker.sh dockerfiles/start_goservices_in_docker.sh
cp envoy-config/goservice-envoy.json dockerfiles/goservice-envoy.json
cp scripts/build_go_container.sh dockerfiles/build_go_container.sh

cd dockerfiles
chmod +x *.sh
./build_go_container.sh

# Cleanup
rm goservice
rm *.json && rm *.sh
cd ..


# Confirmation
docker ps
