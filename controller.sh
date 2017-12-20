#!/bin/bash

find scripts/ -type f -iname "*.sh" -exec chmod +x {} \;

./scripts/appbuilders/build_jservice_service.sh
