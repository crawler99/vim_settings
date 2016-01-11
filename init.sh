#!/bin/sh

####################################################
echo "Setting up the Vundle environment for the first use ..."

VIM_HOME=$HOME/.vim
VUNDLE_HOME=$VIM_HOME/bundle/Vundle.vim
VUNDLE_REPO=https://github.com/VundleVim/Vundle.vim.git

if [ ! -f $VUNDLE_HOME ]; then
    echo "creating dir for $VUNDLE_HOME ..."
    mkdir -p $VUNDLE_HOME
    git clone $VUNDLE_REPO $VUNDLE_HOME
fi

####################################################
echo "Setting up the color scheme for the first use ..."
COLOR_SCHEMES=$VIM_HOME/colors
COLOR_SCHEMES_REPO=$HOME/github/vim_settings/colors

if [ ! -f $COLOR_SCHEMES ]; then
    echo "linking color schemes to $COLOR_SCHEMES ..."
    ln -s $COLOR_SCHEMES_REPO $COLOR_SCHEMES
fi

####################################################
rc=$?
exit $rc
