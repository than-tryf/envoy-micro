#!/bin/sh
# Initializations
clear

###############################################################
#           Phase 1 - Initialization                          #
###############################################################
echo -e -n "\e[91m[Phase 1] > Initialization"
echo -e -n "\e[91m--------------------------"

find scripts/ -type f -iname "*.sh" -exec chmod +x {} \;

echo -e -n "\e[91mStopping Docker................................................"
./scripts/container/1_docker_clean_envoy.sh
echo -e -n "\e[94mCreating Underlying Docker Network............................."
./scripts/container/2_docker_build_dockernet.sh

# Building

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
