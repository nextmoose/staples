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
	--upstream-host-name)
	    UPSTREAM_HOST_NAME="${2}" &&
		shift 2 &&
		true
	    ;;
	--upstream-user)
	    UPSTREAM_USER="${2}" &&
		shift 2 &&
		true
	    ;;
	--upstream-identity-key)
	    UPSTREAM_IDENTITY_KEY="${2}" &&
		shift 2 &&
		true
	    ;;
	--upstream-known-hosts-key)
	    UPSTREAM_KNOWN_HOSTS_KEY="${2}" &&
		shift 2 &&
		true
	    ;;
	--report-host-name)
	    REPORT_HOST_NAME="${2}" &&
		shift 2 &&
		true
	    ;;
	--report-user)
	    REPORT_USER="${2}" &&
		shift 2 &&
		true
	    ;;
	--report-identity-key)
	    REPORT_IDENTITY_KEY="${2}" &&
		shift 2 &&
		true
	    ;;
	--report-known-hosts-key)
	    REPORT_KNOWN_HOSTS_KEY="${2}" &&
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
    elif [ -z "${UPSTREAM_HOST_NAME}" ]
    then
	echo Unspecified UPSTREAM_HOST_NAME &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${UPSTREAM_USER}" ]
    then
	echo Unspecified UPSTREAM_USER &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${UPSTREAM_IDENTITY_KEY}" ]
    then
	echo Unspecified UPSTREAM_IDENTITY_KEY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${UPSTREAM_KNOWN_HOSTS_KEY}" ]
    then
	echo Unspecified UPSTREAM_KNOWN_HOSTS_KEY &&
	    echo "${0}" &&
	    exit 64 &&
	    true 
    elif [ -z "${REPORT_HOST_NAME}" ]
    then
	echo Unspecified REPORT_HOST_NAME &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${REPORT_USER}" ]
    then
	echo Unspecified REPORT_USER &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${REPORT_IDENTITY_KEY}" ]
    then
	echo Unspecified REPORT_IDENTITY_KEY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${REPORT_KNOWN_HOSTS_KEY}" ]
    then
	echo Unspecified REPORT_KNOWN_HOSTS_KEY &&
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
	-e "s#\${UPSTREAM_HOST_NAME}#${UPSTREAM_HOST_NAME}#" \
	-e "s#\${UPSTREAM_USER}#${UPSTREAM_USER}#" \
	-e "s#\${REPORT_HOST_NAME}#${REPORT_HOST_NAME}#" \
	-e "s#\${REPORT_USER}#${REPORT_USER}#" \
	-e "s#\${HOME}#${HOME_DIR}#" \
	-e "w${HOME_DIR}/.ssh/config" \
	"${STORE_DIR}/src/config" &&
    pass show "${PERSONAL_IDENTITY_KEY}" > "${HOME_DIR}/.ssh/personal.id_rsa" &&
    pass show "${PERSONAL_KNOWN_HOSTS_KEY}" > "${HOME_DIR}/.ssh/personal.known_hosts" &&
    pass show "${UPSTREAM_IDENTITY_KEY}" > "${HOME_DIR}/.ssh/upstream.id_rsa" &&
    pass show "${UPSTREAM_KNOWN_HOSTS_KEY}" > "${HOME_DIR}/.ssh/upstream.known_hosts" &&
    pass show "${REPORT_IDENTITY_KEY}" > "${HOME_DIR}/.ssh/report.id_rsa" &&
    pass show "${REPORT_KNOWN_HOSTS_KEY}" > "${HOME_DIR}/.ssh/report.known_hosts" &&
    chmod \
	0400 \
	"${HOME_DIR}/.ssh/personal.id_rsa" \
	"${HOME_DIR}/.ssh/personal.known_hosts" \
	"${HOME_DIR}/.ssh/upstream.id_rsa" \
	"${HOME_DIR}/.ssh/upstream.known_hosts" \
	"${HOME_DIR}/.ssh/report.id_rsa" \
	"${HOME_DIR}/.ssh/report.known_hosts" \
	"${HOME_DIR}/.ssh/config" &&
    true
