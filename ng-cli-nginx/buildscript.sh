#!/bin/bash

npm install

# make sure everything is installed for the project.
if [ "$AOT" == true ] ; then
	echo "AOT enabled, using AOT"
	ng build -prod --aot
else
	ng build -prod
fi

rm -rf /build
mv /project/dist /build