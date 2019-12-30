#!/usr/bin/env bash
## Add ~/local/bin to PATH
[[ -d "$HOME/local/bin" ]] && export PATH+=:~/local/bin

## vi = vim
alias vi='vim'

set show-all-if-ambiguous on
set completion-ignore-case on

## set default editors
export EDITOR="vim"
