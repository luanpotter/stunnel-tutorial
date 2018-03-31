#!/bin/bash

port=7890

./setup.sh

rec_ip=`./receiver.sh 2> /dev/null | sed '$!d'`
send_ip=`./sender.sh 2> /dev/null | sed '$!d'`

echo "rec_ip: $rec_ip"
echo "send_ip: $send_ip"

docker exec -d st-receiver bash -c "/root/secure_receive.sh $port"
docker exec -d st-sender bash -c "/root/secure_send.sh $rec_ip $port"

# tail -f logs/results
