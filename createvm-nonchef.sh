#!/bin/sh
knife digital_ocean droplet create --server-name test1.startchurch.com  \
                                      --image 3101045 \
                                      --location 4 \
                                      --size 66 \
                                      --ssh-keys 123339 \
				      --identity-file "/home/jantoniou/.ssh/id_rsa"
