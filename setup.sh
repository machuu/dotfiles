#!/usr/bin/env bash
#
# Setup dotfiles in this login session

## Install bashdot, if not already installed
if ! which bashdot ; then
	echo "bashdot not installed, installing now"
	git clone git@github.com:machuu/dotfiles.git
	curl -s https://raw.githubusercontent.com/bashdot/bashdot/master/bashdot > bashdot
	sudo mv bashdot /usr/local/bin
	sudo chmod a+x /usr/local/bin/bashdot
fi

bashdot install webdev
