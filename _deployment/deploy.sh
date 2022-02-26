#!/usr/bin/env sh

# see: https://go.dev/doc/modules/publishing

set -x
MY_PATH=$(cd $(dirname "$0") && cd .. && pwd)

VERSION_MAJOR=${ENV_VERSION_MAJOR:-0}
VERSION_MINOR=${ENV_VERSION_MINOR:-1}
VERSION_PATCH="$(date +%s)"

CURRENT_VERSION="v$VERSION_MAJOR.$VERSION_MINOR.$VERSION_PATCH"

cd "$MY_PATH" || return

go mod tidy
go test ./...
git add .
git commit -m "autogate-go-core: changes for $CURRENT_VERSION"
git tag "$CURRENT_VERSION"
git push origin "$CURRENT_VERSION"