#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build \
  -t first_commit/build \
  --build-arg USER=${USER} \
  --build-arg USERID=${UID} \
  ${DIR}/docker/build

# Cleanup images and containers without tags, to prevent it get from getting cluttered after running
# this scipt a bunch of times.
containers=( $(docker ps -aq 2>/dev/null) )
docker rm "${containers[@]}" 2>/dev/null
volumes=( $(docker ps --filter status=exited -q 2>/dev/null) )
docker rm -v "${volumes[@]}" 2>/dev/null
images=( $(docker images --filter dangling=true -q 2>/dev/null) )
docker rmi "${images[@]}" 2>/dev/null
