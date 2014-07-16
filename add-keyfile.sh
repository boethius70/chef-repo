#!/bin/sh

# add keyfile for use with the LUKS encrypted partition
dd if=/dev/random of=/etc/ecra-file-server.keyfile bs=1 count=256
cryptsetup luksAddKey /dev/xvdb1 /etc/ecra-file-server.keyfile
cryptsetup luksOpen /dev/xvdb1 data --key-file /etc/ecra-file-server.keyfile
