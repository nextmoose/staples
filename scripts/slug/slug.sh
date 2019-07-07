#!/bin/sh

pass generate ${@}/$(tee | sed -e "s#[^a-zA-Z0-9]#_#g") 22 &&
    true
