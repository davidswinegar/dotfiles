syntax enable

" tabs
set smartindent
set tabstop=4
set softtabstop=4
set expandtab

" UI
set number " show line numbers
set showcmd " show previous command
set wildmenu " wildcard menu
set showmatch " highlight matching brackets

" search
set hlsearch " highlight matches

" remap movement keys
imap <C-c> <Esc>

" backup
" set backup
" set backupdir=~/.vim-tmp
" set directory=~/vim-tmp
" set writebackup

" tabs
nnoremap <C-Tab> :tabnext<CR>
nnoremap <C-S-Tab> :tabprevious<CR>

" vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" necessary
Plugin 'gmarik/Vundle.vim'
" Sublime-like search functionality
Plugin 'kien/ctrlp.vim'
" commenting
Plugin 'tomtom/tcomment_vim'
" Git inside vim
Plugin 'tpope/vim-fugitive'
" Change tags in pairs
Plugin 'tpope/vim-surround'

call vundle#end()
filetype plugin indent on
