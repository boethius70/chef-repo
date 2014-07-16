#!/bin/sh
# Script to automate as much as possible the install and setup of
# dmcrypt+LUKS for filesystem encryption:
# by Jim Antoniou (jantoniou@gmail.com)
ENCRYPTEDPART=/dev/xvdb1

apt-get -y install cryptsetup
/sbin/badblocks -c 10240 -s -w -t random -v $ENCRYPTEDPART
dd if=/dev/urandom of=$ENCRYPTEDPART
cryptsetup --verify-passphrase --hash=sha256 --cipher=aes-cbc-essiv:sha256 --key-size=256 luksFormat $ENCRYPTEDPART
cryptsetup luksOpen $ENCRYPTEDPART www
sudo mke2fs -j -O dir_index,filetype,sparse_super /dev/mapper/www
