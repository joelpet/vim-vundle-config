SHELL=/bin/sh

MAKEFILE_PATH=$(dir $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: install
install: clean clone_vundle link setup

.PHONY: clone_vundle
clone_vundle:
	git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

.PHONY: get_font
get_font:
	mkdir -p ~/.fonts
	git://github.com/Lokaltog/powerline-fonts.git ~/.fonts/

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
