#!/usr/bin/env bash

PATH_ROOT=$(cd "$(dirname "$0")/../../" && pwd)
PATH_DOCKER=$(cd "$(dirname "$0")" && pwd)

NAME_DOCKER="${PATH_DOCKER##*/}"
NAME_IMAGE="personal/${NAME_DOCKER}:$(cat ${PATH_DOCKER}/VERSION)"
NAME_CONTAINER="debug-${NAME_DOCKER}"

cd "${PATH_ROOT}" || exit 1

containerId=`docker ps -a --filter "name=^${NAME_CONTAINER}$"|grep "${NAME_CONTAINER}"|awk '{print $1}'`
if [[ "X${containerId}" != "X" ]]; then
    docker stop ${containerId}
    docker rm ${containerId}
fi
docker rmi -f "${NAME_IMAGE}"

sh build.sh -b "${NAME_DOCKER}"

docker run \
    --name "${NAME_CONTAINER}" \
    -it \
    -d \
    "${NAME_IMAGE}" bash
