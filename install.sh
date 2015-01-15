#! /bin/bash

all_targets="""
vim
zsh
fonts
git
irssi
pentadactyl
tmux
sqlite
X
"""

targets=$all_targets

if [ -z "$INSTALL_DIR" ]; then
    INSTALL_DIR=$HOME
fi

if [ ! -z "$@" ]; then
    targets="$@"
fi

root=$(pwd)

for target in $targets; do
    echo Installing target $target:
    cd $target
    for file in *; do
        echo - .${file}
        rm -rfi ${INSTALL_DIR}/.${file}
        ln -s ${root}/${target}/${file} ${INSTALL_DIR}/.${file}
    done
    cd $root
done
