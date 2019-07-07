#!/bin/sh

while [ "${#}" -gt 0 ]
do
    case "${1}" in
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
		exit 64 &&
		true
	    ;;
    esac &&
	true
done &&
    if [ -z "${PERSONAL_HOST_NAME}" ]
    then
	echo Unspecified PERSONAL_HOST_NAME &&
	    echo "${0}" &&
	    exit 64 &&
    elif [ -z "${PERSONAL_USER}" ]
    then
	echo Unspecified PERSONAL_USER &&
	    echo "${0}" &&
	    exit 64 &&
    elif [ -z "${PERSONAL_IDENTITY_KEY}" ]
    then
	echo Unspecified PERSONAL_IDENTITY_KEY &&
	    echo "${0}" &&
	    exit 64 &&
    elif [ -z "${PERSONAL_KNOWN_HOSTS_KEY}" ]
    then
	echo Unspecified PERSONAL_KNOWN_HOSTS_KEY &&
	    echo "${0}" &&
	    exit 64 &&
    elif [ -z "${UPSTREAM_HOST_NAME}" ]
    then
	echo Unspecified UPSTREAM_HOST_NAME &&
	    echo "${0}" &&
	    exit 64 &&
    elif [ -z "${UPSTREAM_USER}" ]
    then
	echo Unspecified UPSTREAM_USER &&
	    echo "${0}" &&
	    exit 64 &&
    elif [ -z "${UPSTREAM_IDENTITY_KEY}" ]
    then
	echo Unspecified UPSTREAM_IDENTITY_KEY &&
	    echo "${0}" &&
	    exit 64 &&
    elif [ -z "${UPSTREAM_KNOWN_HOSTS_KEY}" ]
    then
	echo Unspecified UPSTREAM_KNOWN_HOSTS_KEY &&
	    echo "${0}" &&
	    exit 64 &&
    elif [ -z "${REPORT_HOST_NAME}" ]
    then
	echo Unspecified REPORT_HOST_NAME &&
	    echo "${0}" &&
	    exit 64 &&
    elif [ -z "${REPORT_USER}" ]
    then
	echo Unspecified REPORT_USER &&
	    echo "${0}" &&
	    exit 64 &&
    elif [ -z "${REPORT_IDENTITY_KEY}" ]
    then
	echo Unspecified REPORT_IDENTITY_KEY &&
	    echo "${0}" &&
	    exit 64 &&
    elif [ -z "${REPORT_KNOWN_HOSTS_KEY}" ]
    then
	echo Unspecified REPORT_KNOWN_HOSTS_KEY &&
	    echo "${0}" &&
	    exit 64 &&
    fi &&
    mkdir "${HOME}/.ssh" &&
    UPSTREAM_IDENTITY_FILE=$(mktemp "${HOME}/.ssh/upstream.XXXXXXXX.id_rsa") &&
    UPSTREAM_KNOWNHOSTS_FILE=$(mktemp "${HOME}/.ssh/upstream.XXXXXXXX.known_hosts") &&
    "${PASS_EXECUTABLE}" show "${UPSTREAM_IDENTITY_KEY}" > "${UPSTREAM_IDENTITY_FILE}" &&
    PERSONAL_IDENTITY_FILE=$(mktemp "${HOME}/.ssh/personal.XXXXXXXX.id_rsa") &&
    PERSONAL_KNOWNHOSTS_FILE=$(mktemp "${HOME}/.ssh/personal.XXXXXXXX.known_hosts") &&
    "${PASS_EXECUTABLE}" show "${PERSONAL_IDENTITY_KEY}" > "${PERSONAL_IDENTITY_FILE}" &&
    REPORT_IDENTITY_FILE=$(mktemp "${HOME}/.ssh/report.XXXXXXXX.id_rsa") &&
    REPORT_KNOWNHOSTS_FILE=$(mktemp "${HOME}/.ssh/report.XXXXXXXX.known_hosts") &&
    "${PASS_EXECUTABLE}" show "${REPORT_IDENTITY_KEY}" > "${REPORT_IDENTITY_FILE}" &&
    sed \
	-e "s#\${UPSTREAM_IDENTITY_FILE}#${UPSTREAM_IDENTITY_FILE}#" \
	-e "s#\${UPSTREAM_KNOWN_HOSTS_FILE}#${UPSTREAM_KNOWN_HOSTS_FILE}#" \
	-e "s#\${PERSONAL_IDENTITY_FILE}#${PERSONAL_IDENTITY_FILE}#" \
	-e "s#\${PERSONAL_KNOWN_HOSTS_FILE}#${PERSONAL_KNOWN_HOSTS_FILE}#" \
	-e "s#\${REPORT_IDENTITY_FILE}#${REPORT_IDENTITY_FILE}#" \
	-e "s#\${REPORT_KNOWN_HOSTS_FILE}#${REPORT_KNOWN_HOSTS_FILE}#" \
    chmod \
	0400 \
	"${HOME}/.ssh/config" \
	"${UPSTREAM_IDENTITY_FILE}" \
	"${UPSTREAM_KNOWN_HOSTS_FILE}" \
	"${PERSONAL_IDENTITY_FILE}" \
	"${PERSONAL_KNOWN_HOSTS_FILE}" \
	"${REPORT_IDENTITY_FILE}" \
	"${REPORT_KNOWN_HOSTS_FILE}" &&
    true
