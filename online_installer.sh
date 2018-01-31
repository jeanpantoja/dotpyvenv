#!/usr/bin/env sh

CURRENT_DIR="$(pwd)"
CLONE_DIR=/tmp/dotpyvenv

[ -d "${CLONE_DIR}" ] && rm -rfv "${CLONE_DIR}"

git clone https://github.com/jeanpantoja/dotpyvenv.git "${CLONE_DIR}"

cd "${CLONE_DIR}"
./install.sh

cd "${CURRENT_DIR}"

rm -rfv "${CLONE_DIR}"
echo "done"
