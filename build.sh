#!/bin/bash -e
source /setup_environment.sh

echo "Running Tests"
go test -v -cover ./...

if [ $? -ne 0 ]; then
	    echo "Tests failed for $pkgName!"
	    exit 1
fi

if [ -z "$APP_NAME" ]; then
	#Grab the application name
	appName=$(basename $pkgName)
else
	appName=$APP_NAME
fi

echo "Building $pkgName"

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s" -installsuffix cgo -v -a -o ./output/$appName

if [ $? -ne 0 ]; then
	    echo "Build failed for $pkgName!"
	    exit 1
fi

chmod 777 ./output

echo "Build succeded!"