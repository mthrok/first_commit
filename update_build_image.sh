#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build \
  -t first_commit/build \
  --build-arg USER=${USER} \
  --build-arg USERID=${UID} \
  ${DIR}/docker/build
