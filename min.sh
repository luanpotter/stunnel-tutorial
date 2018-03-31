#!/bin/bash

cid=$1
port=7890

docker build min-docker --tag min-docker
docker run --name min-docker -it --net=container:$cid min-docker ./listen.sh $port
