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
	echo "No loopback project found, make sure you mount it to /project."
	exit;
fi

# if in debug mode, start the serve command for auto reload.
if [ "$APP_DEBUG" == true ] ; then
	# make sure everything is installed for the project.
	npm install
	grunt
else
	# make sure everything is installed for the project.
	npm install --only=production
	
	forever start -l info.log -o info.log -e error.log server/server.js
	tail -f ./.forever/info.log
fi