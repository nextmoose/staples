#!/bin/sh

nix-shell \
    arg staples "import ${STAPLES_SOURCE}/default.nix {}" \
    "${STAPLES_SOURCE}/shells/homer.nix" &&
    true
