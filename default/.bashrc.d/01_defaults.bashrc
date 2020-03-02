#!/usr/bin/env bash
## Add ~/local/bin to PATH
[[ -d "$HOME/local/bin" ]] && export PATH+=:~/local/bin

## vi = vim
alias vi='vim'

set show-all-if-ambiguous on
set completion-ignore-case on

## set default editors
export EDITOR="vim"

# Add scripts dir to PATH, if it is present
GIT_DIR="$(find ~/ -type d -name "git" | head -1)"
if [[ $GIT_DIR != "" ]] && [[ -d "$GIT_DIR/scripts" ]] ; then
	export PATH+=:${GIT_DIR// /\\ }/scripts
fi
