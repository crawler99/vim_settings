#!/bin/sh

echo "Setting up the Vundle environment for the first use ..."

VIM_HOME=$HOME/.vim
VUNDLE_HOME=$VIM_HOME/bundle/Vundle.vim
VUNDLE_REPO=https://github.com/VundleVim/Vundle.vim.git

if [ -f $VUNDLE_HOME ]; then
    echo "$VUNDLE_HOME exists, quit ..."
    exit 1
fi

mkdir -p $VUNDLE_HOME
git clone $VUNDLE_REPO $VUNDLE_HOME

rc=$?
exit $rc

