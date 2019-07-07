#!/bin/sh

while [ "${#}" -gt 0 ]
do
    case "${1}" in
	--personal-organization)
	    PERSONAL_ORGANIZATION="${2}" &&
		shift 2 &&
		true
	    ;;
	--personal-repository)
	    PERSONAL_REPOSITORY="${2}" &&
		shift 2 &&
		true
	    ;;
	--personal-branch)
	    PERSONAL_BRANCH="${2}" &&
		shift 2 &&
		true
	    ;;
	--committer-name)
	    COMMITTER_NAME="${2}" &&
		shift 2 &&
		true
	    ;;
	--committer-email)
	    COMMITTER_EMAIL="${2}" &&
		shift 2 &&
		true
	    ;;
	*)
	    echo Unsupported Option &&
		echo "${1}" &&
		echo "${0}" &&
		echo "${@}" &&
		exit 64 &&
		true
	    ;;
    esac &&
	true
done &&
    if [ -z "${PERSONAL_ORGANIZATION}" ]
    then
	echo Unspecified PERSONAL_ORGANIZATION &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${PERSONAL_REPOSITORY}" ]
    then
	echo Unspecified PERSONAL_REPOSITORY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${PERSONAL_BRANCH}" ]
    then
	echo Unspecified PERSONAL_BRANCH &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${COMMITTER_NAME}" ]
    then
	echo Unspecified COMMITTER_NAME &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${COMMITTER_EMAIL}" ]
    then
	echo Unspecified COMMITTER_EMAIL &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    fi &&
    pass init "$(gnupg-key-id)" &&
    export PATH="$PATH:/usr/bin:/usr/sbin:/sbin" &&
    pass git init &&
    pass git config user.name "${COMMITTER_NAME}" &&
    pass git config user.email "${COMMITTER_EMAIL}" &&
    pass git remote add personal "personal:${PERSONAL_ORGANIZATION}/${PERSONAL_REPOSITORY}.git" &&
    pass git fetch personal "${PERSONAL_BRANCH}" &&
    pass git clean -fd &&
    pass git checkout -B "${PERSONAL_BRANCH}" "personal/${PERSONAL_BRANCH}" &&
    ln --symbolic $(which post-commit) "${HOME}/.password-store/.git/hooks" &&
    true
