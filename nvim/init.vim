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

"" Plugins
call plug#begin('~/.nvim/plugged')

"" Functionality
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'kkoomen/vim-doge'

"" Syntax support
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'bfrg/vim-cpp-modern'

"" Colorschemes
Plug 'tpope/vim-vividchalk'

call plug#end()

command W w

"" DOGE 
let g:doge_enable_mappings = 1
let g:doge_mapping = '<leader>f'


"" Airline
let g:airline_powerline_fonts = 1
set t_Co=256

"" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,php,javascript.jsx EmmetInstall
let g:user_emmet_leader_key=','

"" jsx-pretty
let g:vim_jsx_pretty_colorful_config = 1

"" vim-cpp-modern
let g:cpp_no_function_highlight = 0
let g:cpp_simple_highlight = 1
let g:cpp_named_requirements_highlight = 1
let c_no_curly_error = 1

"" aditional clang options 
let g:doge_clang_args = ['-I', '/my/include/path']


let g:gruvbox_contrast_dark = 'hard'

autocmd BufRead,BufNewFile *.ts set filetype=javascript " same filetype for .js and .ts files
autocmd FocusGained * checktime		" Checks if the file has been changed outside of vim and reloads the file


" Cursorline background color
" highlight Normal guibg=black guifg=white

colorscheme vividchalk 
hi comment ctermfg=blue
highlight CursorLine ctermbg=NONE


