#!/bin/bash

port=7890

./setup.sh

rec_ip=`./receiver.sh 2> /dev/null | sed '$!d'`
send_ip=`./sender.sh 2> /dev/null | sed '$!d'`

docker exec -d st-receiver bash -c "/root/receive.sh $port"
docker exec -d st-sender bash -c "/root/send.sh $rec_ip $port"

tail -f logs/results
