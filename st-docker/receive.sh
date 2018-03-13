#!/bin/bash

port=$1

rm -rf logs/results
touch logs/results

function receive {
  while true; do
    nc -l $port >> logs/results
  done
}

receive &
