" Vim settings 

syntax on
set showmatch
set  t_Co=256
set background=dark
set hlsearch
set incsearch 	
set mouse=a
set splitright

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

" Mappings

" Mapping the save command :w to Ctrl+S
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Insert newline without entering insert mode with ENTER
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Plugins
set runtimepath^=~/.vim/bundle/ctrlp.vim
