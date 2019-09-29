"" Vim settings 
set showmatch							" show matching characters
set t_Co=256							" Allow 256 colors
set clipboard=unnamedplus				" Copy and pasting goes to system clipboard
set background=dark						" Syntax colors addepted to dark backgrounds
set hlsearch							" Highlight all search patterns
set incsearch							" Highlight the searching string while typing
set mouse=a								" Allow mouse in the vim terminal
set nowrap								" No word wrapping
set tabstop=4							" Tabs equals four spaces
set ignorecase							" Make search case-insensitive
set ai									" Disable auto identing
set nobackup							" No backup file
set nowb								" No backup file	
set noswapfile							" No backup file
set ffs=unix							" Convert line end to LF automatically
set encoding=utf8						" UTF-8 encodding
set ruler								" Display cursor position
set laststatus=2						" Always display status line
set foldmethod=manual					" Changes the state of the folding code method 
set cindent								" Ident files according to C indentation standard
set number 								" Show line numbers
set cursorline							" Show cursor line
"set number relativenumber				" Enable relative line numbers
set autoread							" Re-read files changed outside of vim
set confirm								" Confirm commands instead of failing
set visualbell							" Visual bell instead of beeping
set noexpandtab							" use tabs, not spaces
set shiftwidth=4						" Width of tabs is 4 spaces
set softtabstop=4						" Width of tabs in 4 spaces
set noshowmode							" Dont show the mode of the GUI
set backupdir=~/.tmp
set directory=~/.tmp					" Don't clutter my dirs up with swp and tmp 
set smarttab
highlight Comment ctermfg=green 
filetype plugin indent on				" Language dependent identation
:let mapleader = ","
	
"" Plugins

call plug#begin('~/.nvim/plugged')
	Plug 'itchyny/lightline.vim' " Better status line 
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " Better Python syntax highlighting
	Plug 'octol/vim-cpp-enhanced-highlight' " Better C++ syntax highlighting 
	Plug 'tpope/vim-vividchalk' " ColorScheme
	Plug 'adamclerk/vim-razor'
	Plug 'tpope/vim-surround'
	Plug 'skammer/vim-css-color'
	Plug 'mattn/emmet-vim'
	Plug 'leafgarland/typescript-vim'
call plug#end()

"" vim-cpp-enhanced-highlight configuration

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_experimental_template_highlight = 1
let g:cpp_concepts_highlight = 1

"" Semshi 

hi semshiLocal           ctermfg=209 guifg=#ff875f
hi semshiGlobal          ctermfg=214 guifg=#ffaf00
hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiParameter       ctermfg=75  guifg=#5fafff
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#ffafd7
hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
hi semshiAttribute       ctermfg=49  guifg=#00ffaf
hi semshiSelf            ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
sign define semshiError text=E> texthl=semshiErrorSign
let g:semshi#error_sign = v:false
let g:semshi#mark_selected_nodes = 0 	

"" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','

"" typescript-vim
au BufRead,BufNewFile *.ts   setfiletype typescript

noremap <cr> <Nop>
noremap <bs> <Nop>

syntax enable
colorscheme vividchalk 

hi MatchParen guibg=NONE guifg=blue gui=bold
highlight Comment ctermfg=blue

