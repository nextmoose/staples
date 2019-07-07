#!/bin/sh

git rev-parse HEAD &&
    if ! git diff --exit-code
    then
        echo There are local unstaged changes. &&
            exit 64
    elif ! git diff --cached --exit-code
    then
        echo There are local changes that are staged but not committed. &&
            exit 65
    elif [ ! -z "$(git ls-files --other --exclude-standard --directory)" ]
    then
        echo There are untracked files that are not .gitignored. &&
            exit 66
    else
        echo The project is clean. &&
            exit 0
    fi
