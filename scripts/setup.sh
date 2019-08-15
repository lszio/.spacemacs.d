#!/bin/sh

set -e

install_spacemacs() {
    echo "Install Spacemacs"
    git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
}

get_liszt_config() {
    echo "Getting config"
    git clone https://github.com/Liszt21/.spacemacs.d.git ~/.spacemacs.d
}

main() {
    cd $LISUX_HOME/
    echo "Spacemacs Installer"
    if [ ! -f "$HOME/.emacs.d/spacemacs.mk" ];then
        echo "spacemacs is not installed"
        rm -rf "$HOME/.emacs.d"
        install_spacemacs
    else
        echo "spacemacs is already installed"
    fi
    if [ ! -d "$HOME/.spacemacs.d" ];then
        echo "liszt config is not installed"
        get_liszt_config
        touch "$HOME/.spacemacs.d/local.el"
    else
        echo "liszt config is already installed"
    fi
}

main