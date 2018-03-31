#!/bin/bash

./kill.sh
cp ./keys/stunnel.pem st-docker/
docker network create -d bridge st-bridge
docker build st-docker --tag st-docker
rm st-docker/stunnel.pem
