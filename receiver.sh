#!/bin/bash

docker rm st-receiver || true
rm -rf logs || true
mkdir logs

docker run -td --net st-bridge --name st-receiver -v $(pwd)/logs:/root/logs st-docker
docker exec -it st-receiver ip addr | grep eth0 | sed -n 2p | perl -pe 's/.*inet ([\d\.]*).*/$1/'
