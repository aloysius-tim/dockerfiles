#!/bin/bash

if [ ! -d /var/log/nginx ]; then
	mkdir /var/log/nginx;
fi
if [ ! -f /var/log/nginx/access.log ]; then
    touch /var/log/nginx/access.log
fi
if [ ! -f /var/log/nginx/error.log ]; then
    touch /var/log/nginx/error.log
fi

# cd to the project
cd /project || exit

echo "Debug state"
echo "$APP_DEBUG"

# To include hidden files
shopt -s nullglob dotglob 
files=(/project/*)
# check if it's empty
if [ ! -f ./angular-cli.json ]; then
	echo "No angular-cli project found, creating one."
	ng init
fi

: ${DEBUG_HOST:=0.0.0.0}

# if in debug mode, start the serve command for auto reload.
if [ "$APP_DEBUG" == true ] ; then
	npm install
	# make sure everything is installed for the project.

	echo "running ng-cli" 
	if [ "$AOT" == true ] ; then
		echo "AOT enabled, using AOT"
		ng serve --host=$DEBUG_HOST --aot --env=dev
	else
		ng serve --host=$DEBUG_HOST --env=dev
	fi
else
	echo "building using /buildscript.sh"
	
	build

	echo "running nginx"
	nginx
fi