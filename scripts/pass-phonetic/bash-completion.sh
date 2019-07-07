#!/bin/sh

__password_store_extension_complete_phonetic() {
    COMPREPLY+=($(compgen -W "-c --clip" -- ${cur}))
    _pass_complete_entries 1
}
