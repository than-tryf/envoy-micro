#!/bin/bash

nohup java -jar /home/envoymonagent.jar 2000 1>/dev/null 2>/dev/null &
/usr/local/bin/envoy -c /etc/envoy.json
