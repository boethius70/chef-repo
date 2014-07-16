#!/bin/sh
knife digital_ocean droplet create --server-name test1.startchurch.com --image 562354 --location 1 --size 66 --ssh-keys 123339 --bootstrap --run-list "role[startchurch-web-server]" --ssh-port 22 --identity-file "/home/jantoniou/.ssh/id_rsa"
