#!/bin/sh

while [ "${#}" -gt 0 ]
do
    case "${1}" in
	--home-dir)
	    HOME_DIR="${2}" &&
		shift 2 &&
		true
	    ;;
	--gpg-private-keys-key)
	    GPG_PRIVATE_KEYS_KEY="${2}" &&
		shift 2 &&
		true
	    ;;
	--gpg-ownertrust-key)
	    GPG_OWNERTRUST_KEY="${2}" &&
		shift 2 &&
		true
	    ;;
	--gpg2-private-keys-key)
	    GPG2_PRIVATE_KEYS_KEY="${2}" &&
		shift 2 &&
		true
	    ;;
	--gpg2-ownertrust-key)
	    GPG2_OWNERTRUST_KEY="${2}" &&
		shift 2 &&
		true
	    ;;
	--personal-host-name)
	    PERSONAL_HOST_NAME="${2}" &&
		shift 2 &&
		true
	    ;;
	--personal-user)
	    PERSONAL_USER="${2}" &&
		shift 2 &&
		true
	    ;;
	--personal-identity-key)
	    PERSONAL_IDENTITY_KEY="${2}" &&
		shift 2 &&
		true
	    ;;
	--personal-known-hosts-key)
	    PERSONAL_KNOWN_HOSTS_KEY="${2}" &&
		shift 2 &&
		true
	    ;;
	*)
	    echo Unsupported Option &&
		echo "${1}" &&
		echo "${@}" &&
		echo "${0}" &&
		exit 0 &&
		true
	    ;;
    esac &&
	true
done &&
    if [ -z "${HOME_DIR}" ]
    then
	echo Unspecified HOME_DIR &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ ! -d "${HOME_DIR}" ]
    then
	echo "Specified HOME_DIR=${HOME_DIR} does not exist" &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${GPG_PRIVATE_KEYS_KEY}" ]
    then
	echo Unspecified GPG_PRIVATE_KEYS_KEY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${GPG_OWNERTRUST_KEY}" ]
    then
	echo Unspecified GPG_OWNERTRUST_KEY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${GPG2_PRIVATE_KEYS_KEY}" ]
    then
	echo Unspecified GPG2_PRIVATE_KEYS_KEY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${GPG2_OWNERTRUST_KEY}" ]
    then
	echo Unspecified GPG2_OWNERTRUST_KEY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${PERSONAL_HOST_NAME}" ]
    then
	echo Unspecified PERSONAL_HOST_NAME &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${PERSONAL_USER}" ]
    then
	echo Unspecified PERSONAL_USER &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${PERSONAL_IDENTITY_KEY}" ]
    then
	echo Unspecified PERSONAL_IDENTITY_KEY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${PERSONAL_KNOWN_HOSTS_KEY}" ]
    then
	echo Unspecified PERSONAL_KNOWN_HOSTS_KEY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    fi &&
    mkdir "${HOME_DIR}/private" &&
    pass show "${GPG_PRIVATE_KEYS_KEY}" > "${HOME_DIR}/private/gpg-private-keys.asc" &&
    pass show "${GPG_OWNERTRUST_KEY}" > "${HOME_DIR}/private/gpg-ownertrust.asc" &&
    pass show "${GPG2_PRIVATE_KEYS_KEY}" > "${HOME_DIR}/private/gpg2-private-keys.asc" &&
    pass show "${GPG2_OWNERTRUST_KEY}" > "${HOME_DIR}/private/gpg2-ownertrust.asc" &&
    mkdir "${HOME_DIR}/.ssh" &&
    chmod 0700 "${HOME_DIR}/.ssh" &&
    sed \
	-e "s#\${PERSONAL_HOST_NAME}#${PERSONAL_HOST_NAME}#" \
	-e "s#\${PERSONAL_USER}#${PERSONAL_USER}#" \
	-e "s#\${HOME}#${HOME_DIR}#" \
	-e "w${HOME_DIR}/.ssh/config" \
	"${STORE_DIR}/src/config" &&
    pass show "${PERSONAL_IDENTITY_KEY}" > "${HOME_DIR}/.ssh/personal.id_rsa" &&
    pass show "${PERSONAL_KNOWN_HOSTS_KEY}" > "${HOME_DIR}/.ssh/personal.known_hosts" &&
    chmod \
	0400 \
	"${HOME_DIR}/.ssh/config" \
	"${HOME_DIR}/.ssh/personal.id_rsa" \
	"${HOME_DIR}/.ssh/personal.known_hosts" &&
    true
