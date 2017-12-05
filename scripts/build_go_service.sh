#!/bin/sh

cd ../services/goservice/

go build -o bin/goservice

cd bin
./goservice
