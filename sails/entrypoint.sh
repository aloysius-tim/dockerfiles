#!/bin/bash

# cd to the project
cd /project || exit

# make sure everything is installed for the project.
npm install

echo "Debug state"
echo "$APP_DEBUG"

# if in debug mode, start the serve command for auto reload.
if [ "$APP_DEBUG" == true ] ; then
	sails lift
else
	forever -o /var/log/docker/sailsjs.log -e /var/log/docker/sailsjs.log start /project/app.js --prod
	tail -f /var/log/docker/sailsjs.log # keep the docker running mate
fi