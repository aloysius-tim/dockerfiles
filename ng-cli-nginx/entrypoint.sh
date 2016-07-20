#!/bin/bash

# cd to the project
cd /project || exit

# make sure everything is installed for the project.
npm install

# start nginx
service nginx start

echo "Debug state"
echo "$APP_DEBUG"

# if in debug mode, start the serve command for auto reload.
if [ "$APP_DEBUG" == true ] ; then
	ng serve
else
	tail -f /dev/null
fi