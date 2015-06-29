#!/bin/bash -e
source /build_environment.sh

echo "Running Tests"
go test -v -cover ./...

if [ $? -ne 0 ]; then
	    echo "Tests failed for $pkgName!"
	    exit 1
fi

echo "Building $pkgName"
#Grab the application name
appName=$(basename $pkgName)

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -o ./output/$appName

if [ $? -ne 0 ]; then
	    echo "Build failed for $pkgName!"
	    exit 1
fi

echo "Build succeded!"
