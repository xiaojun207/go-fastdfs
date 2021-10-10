#!/bin/bash

BIN_VERSION="go-fastdfs:${1-$(git describe  --tags `git rev-parse HEAD`)}"

if [[ ! -d src ]];then

cp -r vendor src

fi


mkdir -p src/github.com/sjqzhang/go-fastdfs
cp -rf cmd doc server main.go  src/github.com/sjqzhang/go-fastdfs


#for linux
GOPATH=`pwd` GOOS=linux GOARCH=amd64 go build -o fileserver -ldflags "-w -s -X 'main.VERSION=$BIN_VERSION' -X 'main.BUILD_TIME=build_time:`date`' -X 'main.GO_VERSION=`go version`' -X 'main.GIT_VERSION=git_version:`git rev-parse HEAD`'" src/github.com/sjqzhang/go-fastdfs/main.go
GOPATH=`pwd` GOOS=linux GOARCH=386 go build -o fileserver32 -ldflags "-w -s -X 'main.VERSION=$BIN_VERSION' -X 'main.BUILD_TIME=build_time:`date`' -X 'main.GO_VERSION=`go version`' -X 'main.GIT_VERSION=git_version:`git rev-parse HEAD`'" src/github.com/sjqzhang/go-fastdfs/main.go

#for windows
GOPATH=`pwd` GOOS=windows GOARCH=amd64 go build -o fileserver.exe -ldflags "-w -s -X 'main.VERSION=$BIN_VERSION' -X 'main.BUILD_TIME=build_time:`date`' -X 'main.GO_VERSION=`go version`' -X 'main.GIT_VERSION=git_version:`git rev-parse HEAD`'" src/github.com/sjqzhang/go-fastdfs/main.go
GOPATH=`pwd` GOOS=windows GOARCH=386 go build -o fileserver32.exe -ldflags "-w -s -X 'main.VERSION=$BIN_VERSION' -X 'main.BUILD_TIME=build_time:`date`' -X 'main.GO_VERSION=`go version`' -X 'main.GIT_VERSION=git_version:`git rev-parse HEAD`'" src/github.com/sjqzhang/go-fastdfs/main.go

#for mac
GOPATH=`pwd` GOOS=darwin GOARCH=amd64 go build -o fileserver_darwin -ldflags "-w -s -X 'main.VERSION=$BIN_VERSION' -X 'main.BUILD_TIME=build_time:`date`' -X 'main.GO_VERSION=`go version`' -X 'main.GIT_VERSION=git_version:`git rev-parse HEAD`'" src/github.com/sjqzhang/go-fastdfs/main.go
GOPATH=`pwd` GOOS=darwin GOARCH=386 go build -o fileserver_darwin32 -ldflags "-w -s -X 'main.VERSION=$BIN_VERSION' -X 'main.BUILD_TIME=build_time:`date`' -X 'main.GO_VERSION=`go version`' -X 'main.GIT_VERSION=git_version:`git rev-parse HEAD`'" src/github.com/sjqzhang/go-fastdfs/main.go
