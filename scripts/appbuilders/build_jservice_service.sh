#!/bin/bash

mvn -f $PWD"/services/jservice" clean > /dev/null 2>&1
mvn -f $PWD"/services/jservice" package > /dev/null 2>&1
