#!/bin/bash

docker network rm envoymesh > /dev/null 2>&1

docker network create -d bridge envoymesh > /dev/null 2>&1
echo -e -n "\e[32mOK!\n"
