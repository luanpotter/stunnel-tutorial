#!/bin/bash

ip=$1
ext_port=$2
local_port=8080

function send {
  while true; do
    curl -s https://loripsum.net/api | perl -pe 's/\<p\>(.*)\<\/p\>[.\n]*/$1/' | nc 127.0.0.1 $local_port
  done
}

echo "connect = $ip:$ext_port" >> stunnel-client.conf
stunnel stunnel-client.conf
send &
