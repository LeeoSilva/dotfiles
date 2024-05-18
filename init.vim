syntax enable
set path=$PWD/**
set nocompatible
set encoding=utf-8
set t_Co=256
set termencoding=utf-8
set mouse=a
set clipboard=unnamedplus				        " Copy and pasting goes to system clipboard
set autoread							" Watch the file for changes
set nowrap							" No word wrapping
set confirm							" Always confirm commands intead of failing
set tabstop=8
set shiftwidth=4						" Width of tabs is 4 spaces
set ffs=dos,unix
set softtabstop=4						" Width of tabs in 4 spaces
set noexpandtab							" use tabs, not spaces
set ignorecase							" Make search case-insensitive
set ai								" Disable auto identing
set ruler							" Display cursor position in status line
set number 							" Show line numbers
set laststatus=1						" Always display status line
set cursorline							" Show cursor line
set noswapfile							" No swap file
set foldmethod=indent
set nofoldenable
set foldlevel=1
let mapleader = ","
set expandtab 
set smarttab
set autoindent
set cindent
filetype plugin indent on

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/bundle')
Plug 'tpope/vim-vividchalk'
call plug#end()

autocmd FocusGained * checktime		" Checks if the file has been changed outside of vim and reloads the file
colorscheme vividchalk 
hi comment ctermfg=blue
highlight CursorLine ctermbg=NONE
