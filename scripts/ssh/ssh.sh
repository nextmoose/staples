#!/bin/sh

ssh -F "${HOME}/.ssh/config" ${@} &&
    true
