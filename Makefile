SHELL = /bin/sh

PATH = $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

link:
	/bin/ln --backup --force --symbolic $(PATH)vimrc ~/.vimrc
	/bin/ln --backup --force --symbolic $(PATH)gvimrc ~/.gvimrc
