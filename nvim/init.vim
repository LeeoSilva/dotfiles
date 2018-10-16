" Vim settings 
set showmatch
set t_Co=256
set background=dark
set hlsearch
set incsearch
set mouse=a
set splitright
set nowrap
set tabstop=4
set ignorecase

" Turning backup off
set nobackup
set nowb
set noswapfile

set ffs=unix,dos,mac
set encoding=utf8
set autoindent
set number 
set cursorline
set number relativenumber 

"" Mapings

" Press / twice to clear the search buffer
nmap <silent> // :nohlsearch<CR>


" Don't need to press shift ;
nnoremap ; :

" Mapping the save command :w to Ctrl+S
inoremap <c-s> <Esc>:w<CR>l 

" Try the following so Shift-Space also enters insert mode.
:imap kj <Esc>
" Or just Space to enter insert mode.
:nmap <Space> i

map <C-w> :qa<CR>

" Insert newline without entering insert mode with ENTER
nmap <S-Enter> o<Esc>
nmap <CR> o<Esc>

"" Plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim
