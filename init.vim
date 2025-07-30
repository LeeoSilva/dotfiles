syntax enable
set path=$PWD/**
set nocompatible
set encoding=utf-8
set t_Co=256
set mouse=a
set clipboard=unnamedplus				        " Copy and pasting goes to system clipboard
set autoread							" Watch the file for changes
set nowrap							" No word wrapping
set confirm							" Always confirm commands intead of failing
set ffs=dos,unix
set nofsync
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
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
let mapleader = ","

filetype plugin indent on

highlight Normal guibg=NONE guifg=NONE ctermbg=NONE ctermfg=NONE

