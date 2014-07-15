SHELL=/bin/sh

MAKEFILE_PATH=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))
VUNDLE_REPO_URL=https://github.com/gmarik/vundle.git
VUNDLE_VERSION_TAG=0.9.1

.PHONY: install
install: clean clone_vundle link setup

.PHONY: clone_vundle
clone_vundle:
	git clone $(VUNDLE_REPO_URL) ~/.vim/bundle/vundle

.PHONE: checkout_tag
checkout_tag:
	git --git-dir ~/.vim/bundle/vundle/.git checkout -b $(VUNDLE_VERSION_TAG)

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
