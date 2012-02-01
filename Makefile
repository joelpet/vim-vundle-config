SHELL = /bin/sh

PATH = $(dir $(realpath $(lastword $(MAKEFILE_LIST))))

install: clone_vundle link setup

.PHONY: clone_vundle
clone_vundle:
	git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

.PHONY: link
link:
	/bin/ln --backup --force --symbolic $(PATH)vimrc ~/.vimrc
	/bin/ln --backup --force --symbolic $(PATH)gvimrc ~/.gvimrc

.PHONY: setup
setup:
	vim +BundleInstall +qall

.PHONY: clean
clean:
	rm ~/.vimrc ~/.gvimrc
	rm -r ~/.vim/bundle
