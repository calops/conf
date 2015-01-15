#! /bin/bash

all_targets="""
vim
zsh
"""

targets=$all_targets

if [ -z "$INSTALL_DIR" ]; then
    INSTALL_DIR=$HOME
fi

if [ ! -z "$1" ]; then
    targets="$1"
fi

root=$(pwd)

for target in $targets; do
    echo Installing target $target:
    cd $target
    for file in *; do
        echo - .${file}
        cp -r ${file} ${INSTALL_DIR}/.${file}
    done
    cd $root
done
