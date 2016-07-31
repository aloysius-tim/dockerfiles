#!/bin/bash

# cd to the project
cd /project || exit


# start nginx
service nginx start

echo "Debug state"
echo "$APP_DEBUG"

# if in debug mode, start the serve command for auto reload.
if [ "$APP_DEBUG" == true ] ; then
	# make sure everything is installed for the project.
	npm install
	ng serve
else
	# make sure everything is installed for the project.
	npm install --only=production
	tail -f /dev/null
fi