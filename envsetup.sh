#!/bin/sh

CURDIR=`pwd`

#backup vimrc
if [ -f ~/.vimrc ]
then
	mv ~/.vimrc ~/.vimrc.backup
fi

ln -sf $CURDIR/vimrc ~/.vimrc
ln -sf $CURDIR/vimrc.bundles ~/.vimrc.bundles
