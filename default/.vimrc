set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Add plugins here
Plugin 'editorconfig/editorconfig-vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-commentary'

call vundle#end()

filetype plugin indent on
syntax on

set undodir=~/.vim/.undo//
set undofile
set undolevels=1000
set undoreload=10000

set backup
set writebackup
set backupdir=~/.vim/.backup//

set directory=~/.vim/.swp//

:silent call system('mkdir -p ' . &undodir)
:silent call system('mkdir -p ' . &backupdir)
:silent call system('mkdir -p ' . &directory)
