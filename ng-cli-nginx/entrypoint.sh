#!/bin/bash

# cd to the project
cd /project || exit

echo "Debug state"
echo "$APP_DEBUG"

# To include hidden files
shopt -s nullglob dotglob 
files=(/project/*)
# check if it's empty
if [ ${#files[@]} -eq 0 ]; then
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

	if [ "$AOT" == true ] ; then
		ng serve --host=$DEBUG_HOST
	else
		ng serve --host=$DEBUG_HOST --aot
	fi
else
	# make sure everything is installed for the project.
	npm install --only=production
	ng build -prod
	nginx
fi