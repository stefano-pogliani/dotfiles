" This file was automatically generated from a template.
" To chage it, update '/home/stefano/code/conf/dotfiles/vim/templates/vimrc'
" and re-generate this file with `make build`.


" Install and initialise plugins with vim-plug
source /home/stefano/code/conf/dotfiles/neovim/vim-plug/plug.vim
call plug#begin(stdpath('data') . '/plugged')
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'plasticboy/vim-markdown'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'wesQ3/vim-windowswap'
call plug#end()


" Load additional files.
source /home/stefano/code/conf/dotfiles/neovim/bindings.vim


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
imap <S-Tab> <C-o><<


" Extra plugin configs.
let g:vim_markdown_folding_disabled = 1
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
