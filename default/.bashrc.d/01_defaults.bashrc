#!/usr/bin/env bash
## Add ~/local/bin to PATH
[[ -d "$HOME/local/bin" ]] && export PATH+=:~/local/bin

## vi = vim
alias vi='vim'

set show-all-if-ambiguous on
set completion-ignore-case on

## set default editors
export EDITOR="vim"

# Add scripts directories to PATH, if they are present
GIT_SCRIPTS_DIRS=()
GIT_SCRIPTS_DIRS+=("$HOME/git/scripts")
GIT_SCRIPTS_DIRS+=("$HOME/local/scripts")
GIT_SCRIPTS_DIRS+=("$HOME/local/bin")
for GIT_SCRIPTS_DIR in "${GIT_SCRIPTS_DIRS[@]}" ; do
	if [[ -d "$GIT_SCRIPTS_DIR" ]] && [[ ! "$PATH" =~ :$GIT_SCRIPTS_DIR ]] ; then
		export PATH+=:"${GIT_SCRIPTS_DIR}"
	fi
done

# source BASH git auto-completion if it exists
GIT_BASH_AUTOCOMPLETION_FILE="~/.bashrc.d/bash_completion.d/git-completion.bash"
if [[ -s "${GIT_BASH_AUTOCOMPLETION_FILE}" ]] ; then
	source "${GIT_BASH_AUTOCOMPLETION_FILE}"
fi
