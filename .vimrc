set number
set nocompatible              " be iMproved, required
set nu rnu
set encoding=UTF-8

filetype plugin indent on
syntax on
let g:markdown_folding=1

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'

"Plugin 'itchyny/lightline.vim'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'

Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'michal-h21/vim-zettel'
Plugin 'ferrine/md-img-paste.vim'

Plugin 'ryanoasis/vim-devicons'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dbeniamine/todo.txt-vim'

Plugin 'OmniSharp/omnisharp-vim'

call vundle#end()         

" gruvbox
let g:airline_theme='gruvbox'
autocmd vimenter * ++nested colorscheme gruvbox
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_nr = 0
set background=dark
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_termcolors = 256

map <silent> <C-n> :NERDTreeToggle<CR>

autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
let g:mdip_imgdir = 'images'
let g:mdip_imgname = 'image'

" VIMWIKI CONFIG
let g:vimwiki_list = [{'path': '~/onedrive/personal/data/vimwiki/', 'auto_tags':1,
                      \ 'syntax': 'markdown', 'ext': '.md',
                         \ 'links_space_char': '-'}]

au FileType vimwiki setlocal shiftwidth=6 tabstop=2 noexpandtab
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_folding='expr'
"let g:vimwiki_folding = 'custom'
"let g:vimwiki_folding = 'list'

" VIMWIKI DIARY TEMPLATE
au BufNewFile ~/onedrive/personal/data/vimwiki/diary/*.md :silent 0r !~/.vim/bin/generate-vimwiki-diary-template '%'



" VIM-ZETTLE
let g:zettel_options = [{"front_matter": {"tags": ""}}]

" Set zettle fileformat
let g:zettel_format = "%title"

" VIMWIKI CONFIG

" TODO.TXT-VIM CONFIG

" Use todo#Complete as the omni complete function for todo files
au filetype todo setlocal omnifunc=todo#Complete

" Auto complete projects
au filetype todo imap <buffer> + +<C-X><C-O>

" Auto complete contexts
au filetype todo imap <buffer> @ @<C-X><C-O>

let g:Todo_fold_char='@'
let g:Todo_update_fold_on_sort=0

" TODO.TXT-VIM CONFIG
"

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Lightline Plugin
""let g:lightline = { 'colorscheme': 'badwolf' }

set guifont=CaskaydiaCove\ Nerd\ Font\ 16

"set bg=light
"set termuicolors
"
"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'
"
"" Shortcutting split navigation, saving a keypress:
" map <C-h> <C-w>
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

"vim-tmux navigaor configuration
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2

     " Disables automatic commenting on newline:
     "  
     "   autocmd FileType * setlocal formatoptions-=c formatoptions-=r
     "   formatoptions-=o
     "    
     "     " Close vim if the only window left open is NERDTree
     "      autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
     "      b:NERDTree.isTabTree()) | q | endif	
     "
     "      " open NERDTree automatically when vim starts on opening a
     "      directory
     "      autocmd StdinReadPre * let s:std_in=1
     "      autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) &&
     "      !exists("s:sstd_in") | exe 'NERDTree' argv()[0] | wincmd p | ene |
     "      endif
