#!/bin/sh
knife digital_ocean droplet create --server-name testjim.startchurch.com --image 562354 --location 1 --size 66  --ssh-keys 123339,212918,36446 --bootstrap --run-list "role[startchurch-web-server]" --ssh-port 22 --identity-file "/home/jantoniou/.ssh/id_rsa"
