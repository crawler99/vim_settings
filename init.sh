#!/bin/sh

# Make symbolic links under home directory
echo "Setting up customized options for spf13-vim ..."

VIM_REPO=${HOME}/github/vim_settings
ln -s ${VIM_REPO}/vimrc.local ${HOME}/.vimrc.local
