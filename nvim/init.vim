"" Vim settings 

set showmatch							" Show matching characters
set t_Co=256							" Allow 256 colors
set clipboard=unnamedplus				" Copy and pasting goes to system clipboard
set background=dark						" Syntax colors addepted to dark backgrounds
set hlsearch							" Highlight all search patterns
set incsearch							" Highlight the searching string while typing
set mouse=a								" Allow mouse in the vim terminal
set nowrap								" No word wrapping
set tabstop=4							" Tabs equals four spaces
set ignorecase							" Make search case-insensitive
set nobackup							" No backup file
set nowb								" No backup file	
set noswapfile							" No backup file
set ffs=unix							" Convert line end to LF automatically
set encoding=utf8						" UTF-8 encodding
set ruler								" Display cursor position
set laststatus=2						" Always display status line
set cindent								" Ident files according to C indentation standard
set number 								" Show line numbers
set cursorline							" Show cursor line
"set number relativenumber				" Enable relative line numbers
set autoread							" Re-read files changed outside of vim
set confirm								" Confirm commands instead of failing
set visualbell							" Visual bell instead of beeping
set noexpandtab							" Tab format
set shiftwidth=4						" Width of tabs is 4 spaces
set softtabstop=4						" Width of tabs in 4 spaces
set virtualedit=onemore					" Makes the cursor goes after the last character
set noshowmode							" Dont show the mode of the GUI
filetype plugin on

"" Plugins

call plug#begin('~/.nvim/plugged')
	Plug 'tpope/vim-surround'
	Plug 'itchyny/lightline.vim'
	Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'tpope/vim-commentary'
	Plug 'sickill/vim-monokai'
	Plug 'tpope/vim-vividchalk'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
call plug#end()

"" vim-cpp-enhanced-highlight configuration

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

hi MatchParen guibg=NONE guifg=blue gui=bold
"" Mapings
" Press / twice to clear the search buffer
nmap <silent> // :nohlsearch<CR>

" K + J sequencially exists insert mode
:imap kj <Esc>

" Or just Space to enter insert mode.
:nmap <Space> i

" Insert newline without entering insert mode with ENTER
nmap <S-Enter> o<Esc>
nmap <CR> o<Esc>

" toggle comments by pressing Leader+/
noremap <C-a> :Commentary<cr>

" $ Actually goes to the end of an line
:noremap $ g$

" Unbind arrow keys
" noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

syntax enable
colorscheme vividchalk 

highlight Comment ctermfg=blue

