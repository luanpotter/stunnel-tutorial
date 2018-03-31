#!/bin/bash

docker stop st-sender || true
docker stop st-receiver || true
docker stop mitm-docker || true
docker rm st-docker || true
docker network rm st-bridge || true
docker rm mitm-docker || true
