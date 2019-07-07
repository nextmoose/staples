#!/bin/sh

export PATH="$PATH:/usr/bin:/usr/sbin:/sbin" &&
    NOW=$(date +%s) &&
    pass git ls-files | grep "[.]gpg\$" | sed -e "s#[.]gpg\$##" | while read KEY
    do
	LENGTH=$(($(pass show "${KEY}" | wc -c) - 1)) &&
	    BIRTH=$(pass git log -1 --format=%ct "${KEY}.gpg") &&
	    AGE=$((${NOW} - ${BIRTH})) &&
	    LIMIT=$(date --date @${BIRTH} +%y) &&
	    DIFF=$((${LENGTH} - ${LIMIT})) &&
	    if [ ${DIFF} -gt 0 ] && [ ${AGE} -gt $((60 * 60 * 24 * 366)) ]
	    then
		echo "${KEY}" &&
		    true
	    elif [ ${DIFF} -eq 0 ] && [ ${AGE} -gt $((60 * 60 * 24 * 31 * 4)) ]
	    then
		echo "${KEY}" &&
		    true
	    elif [ ${DIFF} -eq -1 ] && [ ${AGE} -gt $((60 * 60 * 24 * 31)) ]
	    then
		echo "${KEY}" &&
		    true
	    elif [ ${DIFF} -eq -2 ] && [ ${AGE} -gt $((60 * 60 * 24 * 7)) ]
	    then
		echo "${KEY}" &&
		    true
	    elif [ ${DIFF} -eq -3 ] && [ ${AGE} -gt $((60 * 60 * 24)) ]
	    then
		echo "${KEY}" &&
		    true
	    elif [ ${DIFF} -eq -4 ] && [ ${AGE} -gt $((60 * 60)) ]
	    then
		echo "${KEY}" &&
		    true
	    elif [ ${DIFF} -eq -5 ] && [ ${AGE} -gt $((60)) ]
	    then
		echo "${KEY}" &&
		    true
	    elif [ ${DIFF} -eq -6 ] && [ ${AGE} -gt $((1)) ]
	    then
		echo "${KEY}" &&
		    true
	    elif [ ${DIFF} -lt -6 ]
	    then
		echo "${KEY}" &&
		    true
	    fi &&
	    true
    done &&
    true
