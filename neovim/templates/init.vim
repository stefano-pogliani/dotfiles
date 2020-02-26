" This file was automatically generated from a template.
" To chage it, update '${REPO_PATH}/vim/templates/vimrc'
" and re-generate this file with `make build`.


" Install and initialise plugins with vim-plug
source ${REPO_PATH}/neovim/vim-plug/plug.vim
call plug#begin(stdpath('data') . '/plugged')
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'hashivim/vim-terraform'
Plug 'junegunn/fzf'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'wesQ3/vim-windowswap'
call plug#end()


" Load additional files.
source ${REPO_PATH}/neovim/bindings.vim
source ${REPO_PATH}/neovim/autocomplete.vim


" Basic configuration options.
set nocompatible
set splitright


" Basic formatting options.
set autoindent
set number
syntax on
filetype plugin indent on

set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=2
imap <silent> <S-Tab> <C-o><<


" Theme options.
set background=dark
set cursorline
colorscheme palenight


" Extra plugin configs.
let g:airline#extensions#tabline#enabled= 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = "palenight"
let g:vim_markdown_folding_disabled = 1
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
