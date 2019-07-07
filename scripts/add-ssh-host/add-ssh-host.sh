#!/bin/sh

while [ "${#}" -gt 0 ]
do
    case "${1}" in
	--host)
	    HOST="${2}" &&
		shift 2 &&
		true
	    ;;
	--host-name)
	    HOST_NAME="${2}" &&
		shift 2 &&
		true
	    ;;
	--user)
	    USER="${2}" &&
		shift 2 &&
		true
	    ;;
	--identity-key)
	    IDENTITY_KEY="${2}" &&
		shift 2 &&
		true
	    ;;
	--user-known-hosts-key)
	    USER_KNOWN_HOSTS_KEY="${2}" &&
		shift 2 &&
		true
	    ;;
	--pass-executable)
	    PASS_EXECUTABLE="${2}" &&
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
    if [ -z "${HOST}" ]
    then
	echo Unspecified HOST &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${HOST_NAME}" ]
    then
	echo Unspecified HOST_NAME &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${IDENTITY_KEY}" ]
    then
	echo Unspecified IDENTITY_KEY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${USER_KNOWN_HOSTS_KEY}" ]
    then
	echo Unspecified USER_KNOWN_HOSTS_KEY &&
	    echo "${0}" &&
	    echo "IDENTITY_KEY=${IDENTITY_KEY}"&&
	    exit 64 &&
	    true
    elif [ -z "${PASS_EXECUTABLE}" ]
    then
	echo Unspecified PASS_EXECUTABLE &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ ! -x "${PASS_EXECUTABLE}" ]
    then
	echo "Specified PASS_EXECUTABLE=${PASS_EXECUTABLE} is not executable" &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    fi &&
    TEMP_IDENTITY_FILE=$(mktemp "${HOME}/.ssh/${HOST}.XXXXXXXX.id_rsa") &&
    "${PASS_EXECUTABLE}" "${IDENTITY_KEY}" > "${TEMP_IDENTITY_FILE}" &&
    TEMP_USER_KNOWN_HOSTS_FILE=$(mktemp "${HOME}/.ssh/${HOST}.XXXXXXXX.known_hosts") &&
    "${PASS_EXECUTABLE}" "${USER_KNOWN_HOSTS_KEY}" > "${TEMP_USER_KNOWN_HOSTS_FILE}" &&
    TEMP_CONF_FILE=$(mktemp "${HOME}/.ssh/${HOST}.XXXXXXXX.conf") &&
    sed \
	-e "s#\${HOST}#${HOST}#" \
	-e "s#\${HOST_NAME}#${HOST_NAME}#" \
	-e "s#\${USER}#${USER}#" \
	-e "s#\${IDENTITY_FILE}#${TEMP_IDENTITY_FILE}#" \
	-e "s#\${USER_KNOWN_HOSTS_FILE}#${TEMP_USER_KNOWN_HOSTS_FILE}#" \
	-e "w${TEMP_CONF_FILE}" \
	"${STORE_DIR}/src/host.conf" &&
    chmod \
	0400 \
	"${TEMP_IDENTITY_FILE}" \
	"${TEMP_USER_KNOWN_HOSTS_FILE}" \
	"${TEMP_CONF_FILE}" &&
    true
