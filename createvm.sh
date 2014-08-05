#!/bin/sh

error_msg() {
	echo "Enter a hostname option first then the role type; e.g.,                   "
        echo "./createvm.sh hostname sql|app                                            "
        echo ""
        echo "... where sql = Percona XtraDB Cluster Server                             "
        echo "... and app = Startchurch Nginx+PHP web app server                        "
}

if [ "$1" != "" ];
then
	if [ "$2" != "" ];
	then
		case "$2" in
			app)
			ROLE="startchurch-web-server"
			;;
			sql)
			ROLE="startchurch-percona"
			;;	
		esac
		knife digital_ocean droplet create --server-name $1.startchurch.com --image 562354 --location 1 --size 63  --ssh-keys 123339,212918,36446 --bootstrap --run-list "role[$ROLE]"
	else 
		error_msg
	fi
else
 	error_msg
fi
