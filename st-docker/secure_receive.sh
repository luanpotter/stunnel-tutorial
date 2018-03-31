#!/bin/bash

network_port=$1
local_port=8080

rm -rf logs/results
touch logs/results

function receive {
  while true; do
    nc -l $local_port >> logs/results
  done
}

receive &
echo "accept = $network_port" >> stunnel-server.conf
stunnel stunnel-server.conf
