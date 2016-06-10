#!/bin/sh

# Make symbolic links under home directory
echo "Setting up customized options for spf13-vim ..."

VIM_REPO=$HOME/github/vim_settings
ln -s $VIM_REPO/vimrc.local $HOME/.vimrc.local

# Installing user scripts
USER_BIN_PATH=$HOME/bin
mkdir -p $USER_BIN_PATH

echo "Installing cscope DB builder script to $HOME/bin ..."
cp $VIM_REPO/make_cscope.sh $USER_BIN_PATH
