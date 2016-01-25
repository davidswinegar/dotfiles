syntax enable

" tabs
set smartindent
set tabstop=4
set softtabstop=4
set expandtab
set showtabline=2

" shift by 2 instead of by 4
set sw=2

" shortcut for expanding current directory
cabbr <expr> %% expand('%:p:h')
cabbr <expr> %^ expand('%:p')

" special indentation for javascript
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2

" set correct splitting
set splitbelow
set splitright

" make sure shell is a login shell so aliases work
set shell=bash\ -l

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

" remap up/down movement keys
nnoremap <Space> <C-f>  
" hack for C-Space
nnoremap <Nul> <C-b>

" remap for movement
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" remap for new tab
nnoremap <C-n> <C-t>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-q> :tabclose<CR>

" tabs
nnoremap <tab> :tabnext<CR>
nnoremap <S-tab> :tabprevious<CR>

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
" cool status bar
Plugin 'bling/vim-airline'
" jade highlighting
Plugin 'vim-scripts/jade.vim'
" react highlighting
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
" stylus highlighting
Plugin 'wavded/vim-stylus'
" save sessions
Plugin 'tpope/vim-obsession'
" json
Plugin 'elzr/vim-json'
" syntax checking
" Plugin 'scrooloose/syntastic'
call vundle#end()
filetype plugin indent on

" ctrlp
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40
let g:ctrlp_clear_cache_on_exit = 0
" ignore crane with ctrl p
set wildignore+=*/static.crane/*
let g:ctrlp_user_command =
    \ ['.git', 'cd %s && git ls-files . -co --exclude-standard']

" airline
let g:airline_detect_modified=1
let g:airline_section_warning='' " remove whitespace indicators
let g:airline_section_y=''
let g:airline_powerline_fonts = 0
set laststatus=2
set noshowmode

" syntastic
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_javascript_checkers = ['eslint']

" default to /g in search necessary for global
set nogdefault

" move by display lines

noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$
