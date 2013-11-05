SHELL=/bin/sh

MAKEFILE_PATH=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: install
install: clean clone_vundle link setup

.PHONY: clone_vundle
clone_vundle:
	git clone https://github.com/joelpet/vim-vundle-config.git ~/.vim/bundle/vundle

.PHONY: link
link:
	ln --backup --force --symbolic $(MAKEFILE_PATH)vimrc ~/.vimrc
	ln --backup --force --symbolic $(MAKEFILE_PATH)gvimrc ~/.gvimrc

.PHONY: setup
setup:
	vim +BundleInstall +qall

.PHONY: clean
clean:
	rm -rf ~/.vim/bundle
