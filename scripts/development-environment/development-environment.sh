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
    elif [ -z "${UPSTREAM_ORGANIZATION}" ]
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
    elif [ -z "${UPSTREAM_BRANCH}" ]
    then
	echo Unspecified UPSTREAM_BRANCH &&
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
    nix-shell \
	--arg staples "import ${STAPLES_SOURCE}/default.nix {}" \
	--argstr gpg-private-keys-key "${GPG_PRIVATE_KEYS_KEY}" \
	--argstr gpg-ownertrust-key "${GPG_OWNERTRUST_KEY}" \
	--argstr gpg2-private-keys-key "${GPG2_PRIVATE_KEYS_KEY}" \
	--argstr gpg2-ownertrust-key "${GPG2_OWNERTRUST_KEY}" \
	--argstr pass-executable "${PASS_EXECUTABLE}" \
	--argstr upstream-host-name "${UPSTREAM_HOST_NAME}" \
	--argstr upstream-user "${UPSTREAM_USER}" \
	--argstr upstream-identity-key "${UPSTREAM_IDENTITY_KEY}" \
	--argstr upstream-known-hosts-key "${UPSTREAM_KNOWN_HOSTS_KEY}" \
	--argstr upstream-organization "${UPSTREAM_ORGANIZATION}" \
	--argstr upstream-repository "${UPSTREAM_REPOSITORY}" \
	--argstr upstream-branch "${UPSTREAM_BRANCH}" \
	--argstr personal-host-name "${PERSONAL_HOST_NAME}" \
	--argstr personal-user "${PERSONAL_USER}" \
	--argstr personal-identity-key "${PERSONAL_IDENTITY_KEY}" \
	--argstr personal-known-hosts-key "${PERSONAL_KNOWN_HOSTS_KEY}" \
	--argstr personal-organization "${PERSONAL_ORGANIZATION}" \
	--argstr personal-repository "${PERSONAL_REPOSITORY}" \
	--argstr personal-branch "${PERSONAL_BRANCH}" \
	--argstr report-host-name "${REPORT_HOST_NAME}" \
	--argstr report-user "${REPORT_USER}" \
	--argstr report-identity-key "${REPORT_IDENTITY_KEY}" \
	--argstr report-known-hosts-key "${REPORT_KNOWN_HOSTS_KEY}" \
	--argstr report-organization "${REPORT_ORGANIZATION}" \
	--argstr report-repository "${REPORT_REPOSITORY}" \
	--argstr report-branch "${REPORT_BRANCH}" \
	--argstr committer-name "${COMMITTER_NAME}" \
	--argstr committer-email "${COMMITTER_EMAIL}" \
	--argstr commit-message "${COMMIT_MESSAGE}" \
	"${STAPLES_SOURCE}/shells/development-environment.nix" &&
    true
