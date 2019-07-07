#!/bin/sh

while [ "${#}" -gt 0 ]
do
    case "${1}" in
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
	--pass-executable)
	    PASS_EXECUTABLE="${2}" &&
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
    if [ -z "${GPG_PRIVATE_KEYS_KEY}" ]
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
    elif [ -z "${PERSONAL_ORGANIZATION}" ]
    then
	echo Unspecified PERSONAL_ORGANIZATIN &&
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
    elif [ -z "${UPSTREAM_ORGANIZATION}" ]
    then
	echo Unspecified UPSTREAM_ORGANIZATIN &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${UPSTREAM_REPOSITORY}" ]
    then
	echo Unspecified UPSTREAM_REPOSITORY &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${UPSTREAM_BRANCH}" ]
    then
	echo Unspecified UPSTREAM_BRANCH &&
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
    elif [ -z "${REPORT_ORGANIZATION}" ]
    then
	echo Unspecified REPORT_ORGANIZATIN &&
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
    fi &&
    "${PASS_EXECUTABLE}" \
	$(which init-dot-ssh-3) \
	--home-dir "${HOME}" \
	--gpg-private-keys-key "${GPG_PRIVATE_KEYS_KEY}" \
	--gpg-ownertrust-key "${GPG_OWNERTRUST_KEY}" \
	--gpg2-private-keys-key "${GPG2_PRIVATE_KEYS_KEY}" \
	--gpg2-ownertrust-key "${GPG2_OWNERTRUST_KEY}" \
	--personal-host-name "${PERSONAL_HOST_NAME}" \
	--personal-user "${PERSONAL_USER}" \
	--personal-identity-key "${PERSONAL_IDENTITY_KEY}" \
	--personal-known-hosts-key "${PERSONAL_KNOWN_HOSTS_KEY}" \
	--upstream-host-name "${UPSTREAM_HOST_NAME}" \
	--upstream-user "${UPSTREAM_USER}" \
	--upstream-identity-key "${UPSTREAM_IDENTITY_KEY}" \
	--upstream-known-hosts-key "${UPSTREAM_KNOWN_HOSTS_KEY}" \
	--report-host-name "${REPORT_HOST_NAME}" \
	--report-user "${REPORT_USER}" \
	--report-identity-key "${REPORT_IDENTITY_KEY}" \
	--report-known-hosts-key "${REPORT_KNOWN_HOSTS_KEY}" &&
    init-gnupg \
	--gpg-private-keys-file "${HOME}/private/gpg-private-keys.asc" \
	--gpg-ownertrust-file "${HOME}/private/gpg-ownertrust.asc" \
	--gpg2-private-keys-file "${HOME}/private/gpg2-private-keys.asc" \
	--gpg2-ownertrust-file "${HOME}/private/gpg2-ownertrust.asc" &&
    init-development-environment \
        --upstream-organization "${UPSTREAM_ORGANIZATION}" \
        --upstream-repository "${UPSTREAM_REPOSITORY}" \
        --upstream-branch "${UPSTREAM_BRANCH}" \
        --personal-organization "${PERSONAL_ORGANIZATION}" \
        --personal-repository "${PERSONAL_REPOSITORY}" \
        --personal-branch "${PERSONAL_BRANCH}" \
        --report-organization "${REPORT_ORGANIZATION}" \
        --report-repository "${REPORT_REPOSITORY}" \
        --report-branch "${REPORT_BRANCH}" \
	--committer-name "${COMMITTER_NAME}" \
	--committer-email "${COMMITTER_EMAIL}" \
	--commit-message "${COMMIT_MESSAGE}" &&
    true
