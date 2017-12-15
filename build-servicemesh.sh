#!/bin/sh

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

###############################################################
#           Phase 2 - Build Services                          #
###############################################################
echo -e -n "\e[91m[Phase 2] > Build Services"
echo -e -n "\e[91m--------------------------"

# TODO Needs to be automated to automatically build all scripts under folder scripts/appbuilders

# Go Service build
echo -e -n "\e[32mBuild Go! Service.............................................."
./scripts/appbuilders/build_go_service.sh

###############################################################
#           Phase 3 - Build & Run Containers                  #
###############################################################
echo -e -n "\e[91m[Phase 3] > Build - Run Containers"
echo -e -n "\e[91m----------------------------------"

# TODO Needs to be automated to automatically build all scripts under folder scripts/container/service-mesh/

# Build docker container for google lb
echo -e -n "\e[32mBuild Google L/B Service Docker................................"
./scripts/container/service-mesh/docker_build_lbGoogle.sh

# Build docker container for go service
echo -e -n "\e[32mBuild Go! Service Docker......................................."
./scripts/container/service-mesh/docker_build_goContainer.sh

# Confirmation
docker ps
