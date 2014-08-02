#!/bin/sh
if [ "$1" != "" ];
then
	knife node delete $1.startchurch.com -y
	knife client delete $1.startchurch.com -y
	DROPLET=`knife digital_ocean droplet list | grep -i $1.startchurch.com | grep -v grep |  awk '{ print $1 }'`
	knife digital_ocean droplet destroy -S $DROPLET
else
	echo "Enter a hostname option first; e.g.,                                      "
        echo "./cleanup.sh hostname                                                    "
fi
