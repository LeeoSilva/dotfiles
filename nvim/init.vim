"" Vim settings 

syntax enable
set path=$PWD/**
set mouse=a
set clipboard=unnamedplus				" Copy and pasting goes to system clipboard
set nowrap								" No word wrapping
set confirm								" Always confirm commands intead of failing
set tabstop=4							" Tabs equals four spaces
set shiftwidth=4						" Width of tabs is 4 spaces
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
	
"" Plugins
call plug#begin('~/.nvim/plugged')
	Plug 'tpope/vim-vividchalk' " ColorScheme
	Plug 'mattn/emmet-vim'
call plug#end()


imap kj <ESC>
command W w

"" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css,php EmmetInstall
let g:user_emmet_leader_key=','

autocmd BufRead,BufNewFile *.ts set filetype=javascript " same filetype for .js and .ts files
colorscheme vividchalk

" Cursorline background color
highlight CursorLine ctermbg=NONE

hi comment ctermfg=blue
