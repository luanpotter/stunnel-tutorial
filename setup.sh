#!/bin/bash

./kill.sh
docker network create -d bridge st-bridge
docker build st-docker --tag st-docker
