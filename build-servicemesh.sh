#!/bin/bash

clear

###############################################################
#           Phase 1 - Initialization                          #
###############################################################
echo -e -n "\e[91m (Phase 1) > Initialization\n"
echo -e -n "\e[91m --------------------------\n"

find scripts/ -type f -iname "*.sh" -exec chmod +x {} \;

echo -e -n "\e[94m Clearing Up Docker............................................."
./scripts/container/1_docker_clean_envoy.sh
echo -e -n "\e[94m Creating Underlying Docker Network............................."
./scripts/container/2_docker_build_dockernet.sh

###############################################################
#           Phase 2 - Build Services                          #
###############################################################
echo -e -n "\e[91m (Phase 2) > Build Services\n"
echo -e -n "\e[91m --------------------------\n"

# TODO Needs to be automated to automatically build all scripts under folder scripts/appbuilders

# Go Service build
echo -e -n "\e[94m Build Go! Service.............................................."
./scripts/appbuilders/build_go_service.sh

###############################################################
#           Phase 3 - Build & Run Containers                  #
###############################################################
echo -e -n "\e[91m (Phase 3) > Build - Run Containers\n"
echo -e -n "\e[91m ----------------------------------\n"

# TODO Needs to be automated to automatically build all scripts under folder scripts/container/service-mesh/

# Build docker container for google lb
echo -e -n "\e[94m Build Google L/B Service Docker................................"
./scripts/container/service-mesh/docker_build_lbGoogle.sh

# Build docker container for go service
echo -e -n "\e[94m Build Go! Service Docker......................................."
./scripts/container/service-mesh/docker_build_goContainer.sh

echo -e -n "\e[39m\n\n"
# Confirmation
docker ps
