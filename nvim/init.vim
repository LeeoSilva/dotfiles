"" Vim settings 

syntax enable
set path=$PWD/**
set nocompatible
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
set ai									" Disable auto identing
set ruler								" Display cursor position in status line
set number 								" Show line numbers
set laststatus=1						" Always display status line
set cursorline							" Show cursor line
set noswapfile							" No swap file
let mapleader = ","
set expandtab 
set smarttab
filetype plugin indent on

"" Plugins
call plug#begin('~/.nvim/plugged')
Plug 'tpope/vim-vividchalk' " ColorScheme
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'jaredgorski/spacecamp'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
call plug#end()

imap kj <ESC>
command W w

"" Airline
let g:airline_powerline_fonts = 1
set t_Co=256

"" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,php,javascript.jsx EmmetInstall
let g:user_emmet_leader_key=','


let g:vim_jsx_pretty_colorful_config = 1

autocmd BufRead,BufNewFile *.ts set filetype=javascript " same filetype for .js and .ts files

autocmd FocusGained * checktime		" Checks if the file has been changed outside of vim and reloads the file


" Cursorline background color
" highlight Normal guibg=black guifg=white

colorscheme vividchalk 
hi comment ctermfg=blue
highlight CursorLine ctermbg=NONE




