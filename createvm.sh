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
			SIZE="66"
			;;
			sql)
			ROLE="startchurch-percona"
			SIZE="63"
			;;	
			basic)
			ROLE="startchurch-basic"
			SIZE="66"
		esac
		knife digital_ocean droplet create --server-name $1.startchurch.com --image 562354 --location 1 --size $SIZE  --ssh-keys 123339,212918,36446 --bootstrap --run-list "role[$ROLE]"
	else 
		error_msg
	fi
else
 	error_msg
fi
