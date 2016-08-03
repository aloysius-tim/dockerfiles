#!/bin/bash

# cd to the project
cd /project || exit


# start nginx
service nginx start

echo "Debug state"
echo "$APP_DEBUG"

# To include hidden files
shopt -s nullglob dotglob 
files=(/project/*)
# check if it's empty
if [ ${#files[@]} -eq 0 ]; then
	ng init
fi

# install all typings
typings install

# if in debug mode, start the serve command for auto reload.
if [ "$APP_DEBUG" == true ] ; then
	# make sure everything is installed for the project.
	npm install
	ng serve
else
	# make sure everything is installed for the project.
	npm install --only=production
	ng build -prod
	tail -f /dev/null
fi