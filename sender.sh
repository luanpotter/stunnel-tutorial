#!/bin/bash

docker rm st-sender || true

docker run -td --net st-bridge --name st-sender st-docker
docker exec -it st-sender ip addr | grep eth0 | sed -n 2p | perl -pe 's/.*inet ([\d\.]*).*/$1/'
