#!/bin/sh

sudo rm ../../services/goservice/bin/ -rf >/dev/null 2>&1

cd ../../services/goservice
go build -o bin/goservice >/dev/null 2>&1
echo -e "\e[32mOK!"
