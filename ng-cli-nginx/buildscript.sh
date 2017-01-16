#!/bin/bash
cd /project

npm install | tee /build.log

# make sure everything is installed for the project.
if [ "$AOT" == true ] ; then
	echo "AOT enabled, using AOT"
	ng build -prod --aot | tee /build.log
else
	ng build -prod | tee /build.log
fi

rm -rf /build
mv /project/dist /build