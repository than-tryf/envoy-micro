#!/bin/bash

sudo rm $PWD/services/goservice/bin/* -f  > /dev/null 2>&1

go build -o $PWD/services/goservice/bin/goservice $PWD/services/goservice/goservice.go > /dev/null 2>&1
echo -e -n "\e[32mOK!\n"
