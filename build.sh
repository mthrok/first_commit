#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p ${DIR}/build
mkdir -p ${DIR}/out
mkdir -p ${DIR}/external
docker run \
  --user ${USER} \
  -e USER=${USER} \
  -e USERID=${UID} \
  -v ${DIR}:${HOME}/first_commit:ro \
  -v ${DIR}/build:${HOME}/build \
  -v ${DIR}/out:${HOME}/out \
  -v ${DIR}/external:${HOME}/external \
  first_commit/build
