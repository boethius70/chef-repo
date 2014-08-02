#!/bin/sh
if [ "$1" != "" ];
then
	knife digital_ocean droplet create --server-name $1.startchurch.com --image 562354 --location 1 --size 66  --ssh-keys 123339,212918,36446 --bootstrap --run-list "role[startchurch-web-server]"
else
	echo "Enter a hostname option first; e.g.,  					"
	echo "./createvm.sh hostname 							"
fi
