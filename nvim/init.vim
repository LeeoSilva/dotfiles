" Vim settings 

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
Plug 'HerringtonDarkholme/yats.vim'   
Plug 'pangloss/vim-javascript'
Plug 'bfrg/vim-cpp-modern'
Plug 'leafOfTree/vim-vue-plugin'
Plug 'cespare/vim-toml'
Plug 'thanethomson/vim-jenkinsfile'

"" Colorschemes
Plug 'tpope/vim-vividchalk'

call plug#end()

command W w

"" Maps the F1 Key to escape 
map <F1> <Esc>
imap <F1> <Esc>

nmap K k

"" DOGE 
let g:doge_enable_mappings = 1
let g:doge_mapping = '<leader>f'
let g:doge_doc_standard_cpp='doxygen_javadoc'
let g:doge_php_settings = { 'resolve_fqn': 1 }

"" Airline
let g:airline_powerline_fonts = 1

"" emmet-vim
let g:user_emmet_install_global = 0
autocmd FileType html,css,javascript,javascript.jsx,vue EmmetInstall
let g:user_emmet_leader_key=','

"" jsx-prettynpm i --save @types/socket.io
let g:vim_jsx_pretty_colorful_config = 1

"" vim-cpp-modern
let g:cpp_no_function_highlight = 0
let g:cpp_simple_highlight = 1
let g:cpp_named_requirements_highlight = 1
let c_no_curly_error = 1

let g:gruvbox_contrast_dark = 'hard'

autocmd FocusGained * checktime		" Checks if the file has been changed outside of vim and reloads the file


" Cursorline background color
" highlight Normal guibg=black guifg=white

colorscheme vividchalk 
hi comment ctermfg=blue
highlight CursorLine ctermbg=NONE


