#!/bin/sh

git commit --all --allow-empty --message "preparation commit" &&
    if git refresh
    then
        git checkout -b scratch_$(uuidgen) &&
            COMMENT_COMMIT=$(git log --pretty=format:"%h" "upstream/${UPSTREAM_BRANCH}"..HEAD | tail -n 1) &&
            git reset --soft "upstream/${UPSTREAM_BRANCH}" &&
            git commit -S --reedit-message ${COMMENT_COMMIT}
    else
        echo Failed to cleanly refresh &&
            exit 64
    fi
