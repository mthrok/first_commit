#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p ${DIR}/build
mkdir -p ${DIR}/out
mkdir -p ${DIR}/external
docker run \
  --user ${USER} \
  -e USER=${USER} \
  -e USERID=${UID} \
  -v ${DIR}:/home/${USER}/first_commit:ro \
  -v ${DIR}/build:/home/${USER}/build \
  -v ${DIR}/out:/home/${USER}/out \
  -v ${DIR}/external:/home/${USER}/external \
  first_commit/build
