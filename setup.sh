#!/bin/sh -eux

cd "$(dirname "$0")"

# build tools
rm -rf bin/
mkdir bin/

go mod download

GOBIN="$(pwd -P)/bin"
export GOBIN
go install golang.org/x/tools/cmd/goimports
go install golang.org/x/lint/golint
