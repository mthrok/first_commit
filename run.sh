#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
docker run \
  -it \
  --user ${USER} \
  -e USER=${USER} \
  -e USERID=${UID} \
  -v ${DIR}:${HOME}/first_commit \
  -w ${HOME}/first_commit \
  --entrypoint "/bin/bash" \
  first_commit/build
