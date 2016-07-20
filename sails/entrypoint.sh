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
	forever start /project/app.js --prod
fi