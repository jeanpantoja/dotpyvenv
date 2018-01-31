#!/usr/bin/env sh

readonly INSTALL_DIR="${HOME}/.oh-my-zsh/plugins/dotpyvenv"

rm -rfv "${INSTALL_DIR}"
mkdir -p "${INSTALL_DIR}"

cp -v dotpyvenv.plugin.zsh "${INSTALL_DIR}"
