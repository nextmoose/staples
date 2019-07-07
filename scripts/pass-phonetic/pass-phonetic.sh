#!/bin/sh

pass show "${@}" | phonetic &&
    true
