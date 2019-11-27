#!/usr/bin/env zsh

dotpyvenv:current_dir_has_virtualenv_folder(){
    echo "$(pwd)" | grep "$(dirname "$VIRTUAL_ENV")" > /dev/null 2>&1
}

# Find the virtualenv in the current directory or any parent up to the root or $HOME
function dotpyvenv:find_venv()
{
    local DOTPYVENV_DIR=".pyvenv"
    local DOTPYVENV_FILE=".pyvenvdir"
    local dir="$1"

    while true; do
        local ENV_DIR="${dir}/${DOTPYVENV_DIR}"
        local ENV_FILE="${dir}/${DOTPYVENV_FILE}"

        if [[ -f "${ENV_DIR}/bin/activate" ]]; then
            printf "${ENV_DIR}"
            break

        elif [[ -f "${ENV_FILE}" ]]; then
            ENV_DIR="${dir}/$(cat ${ENV_FILE})"

            if [[ -f "${ENV_DIR}/bin/activate" ]]; then
                printf "${ENV_DIR}"
                break
            fi
        fi

        [[ "$dir" != "/" && $dir != "$HOME" ]] || break
        dir=$(dirname "$dir")
    done
}


dotpyvenv:source() {
    if [ -n "$VIRTUAL_ENV"  ]; then
        dotpyvenv:current_dir_has_virtualenv_folder || deactivate

    else
        local venv_path=$(dotpyvenv:find_venv $PWD)

        if [[ -n "$venv_path" ]]; then
            source "${venv_path}/bin/activate"
        fi
    fi
}


autoload -U add-zsh-hook
add-zsh-hook chpwd dotpyvenv:source
