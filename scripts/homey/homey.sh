#!/bin/sh

HOME=$(mktemp -d) &&
    homer --home "${HOME}" &&
    true
