"" Vim settings 

syntax enable
set clipboard=unnamedplus				" Copy and pasting goes to system clipboard
set nowrap								" No word wrapping
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
let mapleader = ","
	
"" Plugins
call plug#begin('~/.nvim/plugged')
	Plug 'tpope/vim-vividchalk' " ColorScheme
	Plug 'mattn/emmet-vim'
call plug#end()

"" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

" Syntax highlighting changes to the default colorscheme
hi Comment ctermfg=blue
hi Search ctermbg=black ctermfg=yellow

autocmd BufRead,BufNewFile *.ts set filetype=javascript " same filetype for .js and .ts files
