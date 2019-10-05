set number
set nocompatible              " be iMproved, required
set nu rnu

filetype plugin indent on
syntax on


set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'
Plugin '844196/lightline-badwolf.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

call vundle#end()         

map <silent> <C-n> :NERDTreeToggle<CR>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Lightline Plugin
"let g:lightline = { 'colorscheme': 'badwolf' }

set bg=light
"set termuicolors

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" Shortcutting split navigation, saving a keypress:
 map <C-h> <C-w>h
 map <C-j> <C-w>j
 map <C-k> <C-w>k
 map <C-l> <C-w>l

 " Disables automatic commenting on newline:
 
 autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
 
 " Close vim if the only window left open is NERDTree
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif	

" open NERDTree automatically when vim starts on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:sstd_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
