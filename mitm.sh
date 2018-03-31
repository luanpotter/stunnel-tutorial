#!/bin/bash

cid=$(docker ps | grep st-sender | awk '{ print $1 }')
port=7890

docker build mitm-docker --tag mitm-docker
docker run --rm --name mitm-docker -it --net=container:$cid mitm-docker ./listen.sh $port
