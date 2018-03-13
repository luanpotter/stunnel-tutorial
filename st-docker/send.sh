#!/bin/bash

ip=$1
port=$2

function send {
  while true; do
    curl -s https://loripsum.net/api | perl -pe 's/\<p\>(.*)\<\/p\>[.\n]*/$1/' | nc $ip $port
  done
}

send &
