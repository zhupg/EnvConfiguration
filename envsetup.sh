#!/bin/sh

CURDIR=`pwd`

#backup vimrc
if [ -f ~/.vimrc ]
then
	mv ~/.vimrc ~/.vimrc.backup
fi

ln -sf $CURDIR/vimrc ~/.vimrc
ln -sf $CURDIR/vimrc.bundles ~/.vimrc.bundles

#backup bashrc
if [ -f ~/.bashrc ]
then
	mv ~/.bashrc ~/.bashrc.backup
fi

ln -sf $CURDIR/bashrc ~/.bashrc
ln -sf $CURDIR/zshrc ~/.zshrc
ln -sf $CURDIR/tmux.conf ~/.tmux.conf.local
ln -sf ~/.tmux/tmux.conf ~/.tmux.conf
