#!/bin/sh

while [ "${#}" -gt 0 ]
do
    case "${1}" in
	--canonical-remote)
	    CANONICAL_REMOTE="${2}" &&
		shift 2 &&
		true
	    ;;
	--canonical-branch)
	    CANONICAL_BRANCH="${2}" &&
		shift 2 &&
		true
    esac &&
	true
done &&
    if [ -z "${CANONICAL_REMOTE}" ]
    then
	echo Unspecified CANONICAL_REMOTE &&
	    exit 64 &&
	    true
    elif [ -z "${CANONICAL_BRANCH}" ]
    then
	echo Unspecified CANONICAL_BRANCH &&
	    exit 64 &&
	    true
    fi &&
    pass init "$(gnupg-key-id)" &&
    export PATH="$PATH:/usr/bin:/usr/sbin:/sbin" &&
    pass git init &&
    pass git remote add canonical "${CANONICAL_REMOTE}" &&
    pass git fetch canonical "${CANONICAL_BRANCH}" &&
    pass git clean -fd &&
    pass git checkout "canonical/${CANONICAL_BRANCH}" &&
    true
