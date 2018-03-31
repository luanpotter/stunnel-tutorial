#!/bin/bash

rm -rf keys
mkdir -p keys

openssl req -new -x509 -days 365 -nodes -subj '/CN=www.mydom.com/O=My Company Name LTD./C=US' -out keys/stunnel.pem -keyout keys/stunnel.pem