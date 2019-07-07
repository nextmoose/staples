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
	--canonical-host-name)
	    CANONICAL_HOST_NAME="${2}" &&
		shift 2 &&
		true
	    ;;
	--canonical-user)
	    CANONICAL_USER="${2}" &&
		shift 2 &&
		true
	    ;;
	--canonical-identity-file)
	    CANONICAL_IDENTITY_FILE="${2}" &&
		shift 2 &&
		true
	    ;;
	--canonical-user-known-hosts-file)
	    CANONICAL_USER_KNOWN_HOSTS_FILE="${2}" &&
		shift 2 &&
		true
	    ;;
	--canonical-remote)
	    CANONICAL_REMOTE="${2}" &&
		shift 2 &&
		true
	    ;;
	--canonical-branch)
	    CANONICAL_BRANCH="${2}" &&
		shift 2 &&
		true
	    ;;
	--mode)
	    MODE="${2}" &&
		shift 2 &&
		true
	    ;;
	--command)
	    COMMAND="${2}" &&
		shift 2 &&
		true
	    ;;
	--run)
	    shift &&
		RUN="${@}" &&
		shift "${#}" &&
		true
	    ;;
	*)
	    echo Unsupported Option &&
		echo "${1}" &&
		echo "${@}" &&
		echo "${0}" &&
		echo "RUN=${RUN}" &&
		exit 64 &&
		true
	    ;;
    esac &&
	true
done &&
    if [ -z "${GPG_PRIVATE_KEYS_FILE}" ]
    then
	echo Unspecified GPG_PRIVATE_KEYS_FILE &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ ! -f "${GPG_PRIVATE_KEYS_FILE}" ]
    then
	echo "Nonexistent GPG_PRIVATE_KEYS_FILE ${GPG_PRIVATE_KEYS_FILE}" &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${GPG_OWNERTRUST_FILE}" ]
    then
	echo Unspecified GPG_OWNERTRUST_FILE &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ ! -f "${GPG_OWNERTRUST_FILE}" ]
    then
	echo "Nonexistent GPG_OWNERTRUST_FILE ${GPG_OWNERTRUST_FILE}" &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${GPG2_PRIVATE_KEYS_FILE}" ]
    then
	echo Unspecified GPG2_PRIVATE_KEYS_FILE &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ ! -f "${GPG2_PRIVATE_KEYS_FILE}" ]
    then
	echo "Nonexistent GPG2_PRIVATE_KEYS_FILE ${GPG2_PRIVATE_KEYS_FILE}" &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${GPG2_OWNERTRUST_FILE}" ]
    then
	echo Unspecified GPG2_OWNERTRUST_FILE &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ ! -f "${GPG2_OWNERTRUST_FILE}" ]
    then
	echo "Nonexistent GPG2_OWNERTRUST_FILE ${GPG2_OWNERTRUST_FILE}" &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${CANONICAL_REMOTE}" ]
    then
	echo Unspecified CANONICAL_REMOTE &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${CANONICAL_BRANCH}" ]
    then
	echo Unspecified CANONICAL_BRANCH &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ -z "${MODE}" ]
    then
	echo Unspecified MODE &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ "${MODE}" != "command" ] && [ ! -z "${COMMAND}" ]
    then
	echo "MODE=${MODE} is not command and COMMAND=${COMMAND} is specified" &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ "${MODE}" == "command" ] && [ -z "${COMMAND}" ]
    then
	echo "MODE=${MODE} and COMMAND is unspecified" &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ "${MODE}" != "run" ] && [ ! -z "${RUN}" ]
    then
	echo "MODE=${MODE} is not run and COMMAND=${COMMAND} is specified" &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    elif [ "${MODE}" == "run" ] && [ -z "${RUN}" ]
    then
	echo "MODE=${MODE} and RUN is unspecified" &&
	    echo "${0}" &&
	    exit 64 &&
	    true
    fi &&
    if [ "${MODE}" == "shell" ]
    then
	nix-shell \
	    --arg staples "import ${STAPLES_SOURCE}/default.nix {}" \
	    --argstr gpg-private-keys-file "${GPG_PRIVATE_KEYS_FILE}" \
	    --argstr gpg-ownertrust-file "${GPG_OWNERTRUST_FILE}" \
	    --argstr gpg2-private-keys-file "${GPG2_PRIVATE_KEYS_FILE}" \
	    --argstr gpg2-ownertrust-file "${GPG2_OWNERTRUST_FILE}" \
	    --argstr canonical-remote "${CANONICAL_REMOTE}" \
	    --argstr canonical-branch "${CANONICAL_BRANCH}" \
	    --quiet \
	    "${STAPLES_SOURCE}/shells/read-only-pass.nix" &&
	    true
    elif [ "${MODE}" == "command" ]
    then
	nix-shell \
	    --command "${COMMAND}" \
	    --arg staples "import ${STAPLES_SOURCE}/default.nix {}" \
	    --argstr gpg-private-keys-file "${GPG_PRIVATE_KEYS_FILE}" \
	    --argstr gpg-ownertrust-file "${GPG_OWNERTRUST_FILE}" \
	    --argstr gpg2-private-keys-file "${GPG2_PRIVATE_KEYS_FILE}" \
	    --argstr gpg2-ownertrust-file "${GPG2_OWNERTRUST_FILE}" \
	    --argstr canonical-remote "${CANONICAL_REMOTE}" \
	    --argstr canonical-branch "${CANONICAL_BRANCH}" \
	    --quiet \
	    --no-build-output \
	    "${STAPLES_SOURCE}/shells/read-only-pass.nix" &&
	    true
    elif [ "${MODE}" == "run" ]
    then
	nix-shell \
	    --run "${RUN}" \
	    --arg staples "import ${STAPLES_SOURCE}/default.nix {}" \
	    --no-build-output \
	    --argstr gpg-private-keys-file "${GPG_PRIVATE_KEYS_FILE}" \
	    --argstr gpg-ownertrust-file "${GPG_OWNERTRUST_FILE}" \
	    --argstr gpg2-private-keys-file "${GPG2_PRIVATE_KEYS_FILE}" \
	    --argstr gpg2-ownertrust-file "${GPG2_OWNERTRUST_FILE}" \
	    --argstr canonical-remote "${CANONICAL_REMOTE}" \
	    --argstr canonical-branch "${CANONICAL_BRANCH}" \
	    --quiet \
	    --no-build-output \
	    "${STAPLES_SOURCE}/shells/read-only-pass.nix" &&
	    true
    fi &&
    true
