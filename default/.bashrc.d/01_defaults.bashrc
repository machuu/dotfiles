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
GIT_DIR="$(find ~/ -type d -name "git" 2>/dev/null | head -1)"
if [[ $GIT_DIR != "" ]] && [[ -d "$GIT_DIR/scripts" ]] ; then
	export PATH+=:${GIT_DIR// /\\ }/scripts
fi

# source BASH git auto-completion if it exists
GIT_BASH_AUTOCOMPLETION_FILE="~/.bashrc.d/bash_completion.d/git-completion.bash"
if [[ -s "${GIT_BASH_AUTOCOMPLETION_FILE}" ]] ; then
	source "${GIT_BASH_AUTOCOMPLETION_FILE}"
fi
