#!/usr/bin/env sh

set -ex

MY_PATH=$(dirname "$0")
MY_PATH=$(cd "$MY_PATH" && cd .. && pwd)

VERSION_MAJOR=${ENV_VERSION_MAJOR:-0}
VERSION_MINOR=${ENV_VERSION_MINOR:-1}
VERSION_PATCH="$(date +%s)"

CURRENT_VERSION="v$VERSION_MAJOR.$VERSION_MINOR.$VERSION_PATCH"

cd "$MY_PATH"

go mod tidy
go test ./...
git add . && git commit -m "commit autogate-go-core: changes for $CURRENT_VERSION"
git push
git commit -m "autogate-go-core: changes for $CURRENT_VERSION"
git tag "$CURRENT_VERSION"
git push origin "$CURRENT_VERSION"