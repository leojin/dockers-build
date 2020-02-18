#!/usr/bin/env bash

PATH_ROOT=$(cd "$(dirname "$0")" && pwd)

DOCKER_IMAGES=(
    "centos-7-dev"
)

function entry_help() {
    local scriptName="$(dirname $0)/$(basename $0)"
    cat << EOF
usage ${scriptName} [options] [args]
-b      centos-6-dev
        centos-7-dev
        ftp
-o      release all
-h      get help
EOF
}

function entry_build_image() {

    local imageName="$1"

    if [[ $# -gt 1 ]]; then
        local imageOutput="$2"
    else
        local imageOutput=""
    fi

    cd "${PATH_ROOT}/docker/${imageName}"

    if [[ ! -f Dockerfile ]]; then
        return 1
    fi

    if [[ ! -f VERSION ]]; then
        return 1
    fi

    if [[ -f setup.sh ]]; then
        ./setup.sh || return 1
    fi

    imageVersion=$(cat VERSION)

    echo "removing image personal/$imageName:$imageVersion"
    docker rmi -f "intention/$imageName:$imageVersion"

    echo "building image personal/$imageName:$imageVersion"
    docker build \
        --rm=true \
        -t "personal/${imageName}:${imageVersion}" \
        . || return 1

    if [[ "X${imageOutput}" != "X" ]]; then
        echo "exporting image personal/$imageName:$imageVersion"
        docker save "personal/${imageName}:${imageVersion}" -o "${imageOutput}/personal-${imageName}-${imageVersion}.image"
    fi

    return 0
}

function entry_build_all() {

    cd "${PATH_ROOT}" || return 1
    rm -rf output

    mkdir -p output/images

    cp -r "${PATH_ROOT}/scripts/"* "${PATH_ROOT}/output/"

    for imageName in ${DOCKER_IMAGES[*]}; do
        entry_build_image "${imageName}" "${PATH_ROOT}/output/images"
    done

    return 0
}

function main() {

    if [[ $# -lt 1 ]]; then
        entry_help
        return 1
    fi

    argBuildType=""
    flagOut=0

    while getopts "hob:" opt; do
        case ${opt} in
            h )
                entry_help
                return 0
                ;;
            b )
                argBuildType=$OPTARG
                ;;
            o )
                flagOut=1
                ;;
        esac
    done

    if [[ ${flagOut} -eq 1 ]]; then
        entry_build_all || return 1
    elif [[ -f "docker/$argBuildType/Dockerfile" ]]; then
        entry_build_image "${argBuildType}" || return 1
    else
        entry_help
        return 1
    fi

    return 0
}

main "$@"

exit $?