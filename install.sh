#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)

ln -s $SCRIPT_DIR/.zshrc $HOME/.zshrc
ln -s $SCRIPT_DIR/.zsh $HOME/.zsh
ln -s $SCRIPT_DIR/.zshenv $HOME/.zshenv
ln -s $SCRIPT_DIR/.zprofile $HOME/.zprofile
ln -s $SCRIPT_DIR/.tmux.conf $HOME/.tmux.conf

# source $HOME/.zshrc