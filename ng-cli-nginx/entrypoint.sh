#!/bin/bash

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

# install all typings
typings install

: ${DEBUG_HOST:=0.0.0.0}

# if in debug mode, start the serve command for auto reload.
if [ "$APP_DEBUG" == true ] ; then
	# make sure everything is installed for the project.
	npm install

	echo "running ng-cli" 
	if [ "$AOT" == true ] ; then
		echo "AOT enabled, using AOT"
		ng serve --host=$DEBUG_HOST --aot
	else
		ng serve --host=$DEBUG_HOST
	fi
else
	echo "building with ng-cli"
	# make sure everything is installed for the project.
	npm install --only=production
	ng build -prod

	echo "running nginx"
	nginx
fi