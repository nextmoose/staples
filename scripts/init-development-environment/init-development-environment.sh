#!/bin/sh

while [ "${#}" -gt 0 ]
do
    case "${1}" in
	--upstream-organization)
	    UPSTREAM_ORGANIZATION="${2}" &&
		shift 2 &&
		true
	    ;;
	--upstream-repository)
	    UPSTREAM_REPOSITORY="${2}" &&
		shift 2 &&
		true
	    ;;
	--upstream-branch)
	    UPSTREAM_BRANCH="${2}" &&
		shift 2 &&
		true
	    ;;
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
	--report-organization)
	    REPORT_ORGANIZATION="${2}" &&
		shift 2 &&
		true
	    ;;
	--report-repository)
	    REPORT_REPOSITORY="${2}" &&
		shift 2 &&
		true
	    ;;
	--report-branch)
	    REPORT_BRANCH="${2}" &&
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
	--commit-message)
	    COMMIT_MESSAGE="${2}" &&
		shift 2 &&
		true
	    ;;
	*)
	    echo Unsupported Option &&
		echo "${1}" &&
		echo "${@}" &&
		echo "${0}" &&
		exit 64 &&
		true
	    ;;
    esac &&
	true
done &&
    if [ -z "${UPSTREAM_ORGANIZATION}" ]
    then
	echo Unspecified UPSTREAM_ORGANIZATION &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${UPSTREAM_REPOSITORY}" ]
    then
	echo Unspecified UPSTREAM_REPOSITORY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${REPORT_REPOSITORY}" ]
    then
	echo Unspecified REPORT_REPOSITORY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${PERSONAL_ORGANIZATION}" ]
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
    elif [ -z "${REPORT_ORGANIZATION}" ]
    then
	echo Unspecified REPORT_ORGANIZATION &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${REPORT_REPOSITORY}" ]
    then
	echo Unspecified REPORT_REPOSITORY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${REPORT_BRANCH}" ]
    then
	echo Unspecified REPORT_BRANCH &&
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
    elif [ -z "${COMMIT_MESSAGE}" ]
    then
	echo Unspecified COMMIT_MESSAGE &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    fi &&
    mkdir "${HOME}/project" &&
    git -C "${HOME}/project" init &&
    git -C "${HOME}/project" config user.name "${COMMITTER_NAME}" &&
    git -C "${HOME}/project" config user.email "${COMMITTER_EMAIL}" &&
    git -C "${HOME}/project" config user.signingkey $(gnupg-key-id) &&
    git -C "${HOME}/project" remote add upstream "upstream:${UPSTREAM_ORGANIZATION}/${UPSTREAM_REPOSITORY}.git" &&
    git -C "${HOME}/project" remote set-url --push upstream no_push &&
    git -C "${HOME}/project" remote add personal "personal:${PERSONAL_ORGANIZATION}/${PERSONAL_REPOSITORY}.git" &&
    git -C "${HOME}/project" remote add report "report:${REPORT_ORGANIZATION}/${REPORT_REPOSITORY}.git" &&
    git -C "${HOME}/project" fetch upstream "${UPSTREAM_BRANCH}" &&
    git -C "${HOME}/project" checkout "upstream/${UPSTREAM_BRANCH}" &&
    git -C "${HOME}/project" checkout -b scratch/$(cat /dev/urandom | tr -dc "a-zA-Z0-9" | fold -w 32 | head -n 1) &&
    ln --symbolic $(which post-commit) "${HOME}/project/.git/hooks" &&
    git -C "${HOME}/project" commit --message "${COMMIT_MESSAGE}" --allow-empty &&
    true
