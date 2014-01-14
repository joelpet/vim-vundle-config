SHELL=/bin/sh

MAKEFILE_PATH=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: install
install: clean clone_vundle checkout_tag link setup

.PHONY: clone_vundle
clone_vundle:
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

.PHONE: checkout_tag
checkout_tag:
	git --git-dir ~/.vim/bundle/vundle/.git checkout -b 0.9.1

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
