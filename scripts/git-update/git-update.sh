#!/bin/sh

git fetch "${1}" "${2}" &&
    git checkout "${1}/${2}" &&
    true
