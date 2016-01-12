#!/bin/sh

####################################################
echo "Setting up the Vundle environment for the first use ..."

VIM_HOME=$HOME/.vim
VUNDLE_HOME=$VIM_HOME/bundle/Vundle.vim
VUNDLE_REPO=https://github.com/VundleVim/Vundle.vim.git

if [ ! -d $VUNDLE_HOME ]; then
    echo "creating dir for $VUNDLE_HOME ..."
    mkdir -p $VUNDLE_HOME
    git clone $VUNDLE_REPO $VUNDLE_HOME
fi

####################################################
echo "Setting up the color scheme for the first use ..."
COLOR_SCHEMES=$VIM_HOME/colors
COLOR_SCHEMES_REPO=$HOME/github/vim_settings/colors

if [ ! -d $COLOR_SCHEMES ]; then
    echo "linking color schemes to $COLOR_SCHEMES ..."
    ln -s $COLOR_SCHEMES_REPO $COLOR_SCHEMES
fi

####################################################
echo "Setting up the syntax spec for the first use ..."
SYNTAX_SPECS=$VIM_HOME/syntax
SYNTAX_SPECS_REPO=$HOME/github/vim_settings/syntax

if [ ! -d $SYNTAX_SPECS ]; then
    echo "linking color schemes to $SYNTAX_SPECS ..."
    ln -s $SYNTAX_SPECS_REPO $SYNTAX_SPECS
fi

####################################################
rc=$?
exit $rc

