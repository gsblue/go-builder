# go-builder
Docker container to test and build GoLang 1.4.2 application.

## Requirements

### Tests
Go builder will run all the tests from your application with code coverage. If the tests fail build process will not continue.

### Canonical Import Path
Go builder needs to know the fully-qualified package name of your application. Below is how we can identify [canonical import path](https://golang.org/doc/go1.4#canonicalimports) of your application.

    package main // import "github.com/gsblue/sampleApi"

It will read this annotation from your source code and copy the source code appropriately in the GOPATH for compilation.

### Dependencies
If you are using Godep to manage your dependencies builder will reference the packages from your `Godeps/_workspace` directory instead of downloading them via `go get`.
Note: `go get` may download versions of packages which are different to what you developed against.

### Binary
Go builder only produces native binary for linux based os with amd64 architecture. The intention is to use the binary in a docker container.

## Usage
    docker run --rm -v $(pwd):/src gsblue/go-builder

Run this command from the root directory of your application.
