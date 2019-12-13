#!/bin/bash

# x86_64 or arm64
[ "$(uname -m)" != "x86_64" ] && USE_ARM64="-arm64"

# security or no security
[ "$SECURITY_SERVICE_NEEDED" != true ] && USE_NO_SECURITY="-no-secty"

# redis or mongo
[ "$FOR_REDIS" = true ] && USE_REDIS="-redis"

# nightly or other release
USE_RELEASE=${RELEASE:-nightly-build}
if [ "$USE_RELEASE" = "nightly-build" ]; then
     export COMPOSE_FILE="releases/${USE_RELEASE}/compose-files/docker-compose-nexus${USE_REDIS}${USE_NO_SECURITY}${USE_ARM64}.yml"
else
     export COMPOSE_FILE="releases/${USE_RELEASE}/compose-files/docker-compose${USE_REDIS}-${USE_RELEASE}${USE_NO_SECURITY}${USE_ARM64}.yml"
fi

echo $COMPOSE_FILE
git remote add dev https://github.com/edgexfoundry/developer-scripts.git
git checkout -b devBranch
git fetch dev
git checkout dev/master -- $COMPOSE_FILE
