#!/bin/bash

# Backup ZFILES
SCRIPT_DIR=$(cd $(dirname $0); pwd)
BACKUP_DIR=$HOME/.zbackup/$(date "+%Y%m%d%H%M%S")
mkdir -p $BACKUP_DIR

function backup(){
    if [ -e $1 ]; then
        if [ -L $1 ]; then
            unlink $1
        else
            mv $1 $BACKUP_DIR
        fi
    fi
}

backup $HOME/.zshrc
backup $HOME/.zsh
backup $HOME/.zshenv
backup $HOME/.zprofile
backup $HOME/.tmux.conf
backup $HOME/.userscripts

ln -s $SCRIPT_DIR/.zshrc $HOME/.zshrc
ln -s $SCRIPT_DIR/.zsh $HOME/.zsh
ln -s $SCRIPT_DIR/.zshenv $HOME/.zshenv
ln -s $SCRIPT_DIR/.zprofile $HOME/.zprofile
ln -s $SCRIPT_DIR/.tmux.conf $HOME/.tmux.conf
ln -s $SCRIPT_DIR/.userscripts $HOME/.userscripts


# Install Applications
if !(type "brew" > /dev/null 2>&1); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ "$(uname -s)" == "Darwin" ]; then
    if !(type "lsd" > /dev/null 2>&1); then
        brew install lsd
    elif !(type "tmux" > /dev/null 2>&1); then
        brew install tmux
    elif !(type "lazygit" > /dev/null 2>&1); then
        brew install lazygit
    elif !(type "nkf" > /dev/null 2>&1); then
        brew install nkf
    elif !(type "gh" > /dev/null 2>&1); then
        brew install gh
    elif !(type "nvim" > /dev/null 2>&1); then
        brew install neovim
    else
        echo
    fi
fi