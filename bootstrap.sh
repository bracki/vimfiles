#!/bin/sh

set -e

install_vimrc() {
    echo "--->  Installing vimrc"

    local abspath=$(cd "$(dirname "$0")"; pwd)

    ln -snf "$abspath/vimrc" $HOME/.vimrc
}

install_vim_plugins() {
    echo "--->  Installing Vim plugins"

    local vundle="$HOME/.vim/bundle/vundle"
    if [[ -d "$vundle" ]]; then
        (cd "$vundle"; git pull)
    else
        mkdir -p "$vundle"
        git clone https://github.com/gmarik/vundle.git "$vundle"
    fi

    vim +BundleInstall +qall
}

echo "About to do the works...."
install_vimrc
install_vim_plugins
