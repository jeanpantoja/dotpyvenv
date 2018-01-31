#!/usr/bin/env zsh

dotpyvenv:current_dir_has_virtualenv_folder(){
    echo "$(pwd)" | grep "$(dirname "$VIRTUAL_ENV")" > /dev/null 2>&1
}

dotpyvenv:source() {
    local DOTPYVENV_DIR=".pyvenv"

    if [ -n "$VIRTUAL_ENV"  ]; then
        dotpyvenv:current_dir_has_virtualenv_folder || deactivate

    elif [ -f "${DOTPYVENV_DIR}/bin/activate" ]; then
        source "${DOTPYVENV_DIR}/bin/activate"
    fi
}


autoload -U add-zsh-hook
add-zsh-hook chpwd dotpyvenv:source
