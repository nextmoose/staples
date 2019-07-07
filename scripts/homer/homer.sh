#!/bin/sh

while [ "${#}" -gt 0 ]
do
    case "${1}" in
	--home)
	    HOME="${2}" &&
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
    if [ -z "${HOME}" ]
    then
	echo Unspecified HOME &&
	    echo "${0}" &&
	    exit 64 &&
	    true
	true
    fi &&
    (cat <<EOF
export HOME="${HOME}" &&
    trap $(which cleanup) EXIT &&
    true
EOF
    ) &&
    true
