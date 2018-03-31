#!/bin/bash

port=$1
tcpdump -i any -l -w - port $port | tcpflow -C -r -
