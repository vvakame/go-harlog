#!/bin/bash -eux

cd "$(dirname "$0")"

targets=$(find . -type f \( -name '*.go' -and -not -iwholename '*vendor*' \))
packages=$(go list ./...)

PATH=$(pwd)/bin:$PATH
export PATH
command -v goimports
# shellcheck disable=SC2086
goimports -w $targets
go vet ./...
golint -min_confidence 0.6 -set_exit_status $packages

go test -race ./... $@

git diff --exit-code
