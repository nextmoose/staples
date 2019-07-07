#!/bin/sh

while [ "${#}" -gt 0 ]
do
    case "${1}" in
	--gpg-private-keys-file)
	    GPG_PRIVATE_KEYS_FILE="${2}" &&
		shift 2 &&
		true
	;;
	--gpg-ownertrust-file)
	    GPG_OWNERTRUST_FILE="${2}" &&
		shift 2 &&
		true
	;;
	--gpg2-private-keys-file)
	    GPG2_PRIVATE_KEYS_FILE="${2}" &&
		shift 2 &&
		true
	;;
	--gpg2-ownertrust-file)
	    GPG2_OWNERTRUST_FILE="${2}" &&
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
    if [ -z "${GPG_PRIVATE_KEYS_FILE}" ]
    then
	echo Unspecified GPG_PRIVATE_KEYS_FILE &&
	    exit 64 &&
	    true
    elif [ ! -f "${GPG_PRIVATE_KEYS_FILE}" ]
    then
	echo "Nonexistent GPG_PRIVATE_KEYS_FILE ${GPG_PRIVATE_KEYS_FILE}" &&
	    exit 64 &&
	    true
    elif [ -z "${GPG_OWNERTRUST_FILE}" ]
    then
	echo Unspecified GPG_OWNERTRUST_FILE &&
	    exit 64 &&
	    true
    elif [ ! -f "${GPG_OWNERTRUST_FILE}" ]
    then
	echo "Nonexistent GPG_OWNERTRUST_FILE ${GPG_OWNERTRUST_FILE}" &&
	    exit 64 &&
	    true
    elif [ -z "${GPG2_PRIVATE_KEYS_FILE}" ]
    then
	echo Unspecified GPG2_PRIVATE_KEYS_FILE &&
	    exit 64 &&
	    true
    elif [ ! -f "${GPG2_PRIVATE_KEYS_FILE}" ]
    then
	echo "Nonexistent GPG2_PRIVATE_KEYS_FILE ${GPG2_PRIVATE_KEYS_FILE}" &&
	    exit 64 &&
	    true
    elif [ -z "${GPG2_OWNERTRUST_FILE}" ]
    then
	echo Unspecified GPG2_OWNERTRUST_FILE &&
	    exit 64 &&
	    true
    elif [ ! -f "${GPG2_OWNERTRUST_FILE}" ]
    then
	echo "Nonexistent GPG2_OWNERTRUST_FILE ${GPG2_OWNERTRUST_FILE}" &&
	    exit 64 &&
	    true
    fi &&
    gpg --batch --import "${GPG_PRIVATE_KEYS_FILE}" &&
    gpg --import-ownertrust "${GPG_OWNERTRUST_FILE}" &&
    gpg2 --import "${GPG2_PRIVATE_KEYS_FILE}" &&
    gpg2 --import-ownertrust "${GPG_OWNERTRUST_FILE}" &&
    true
