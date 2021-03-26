" Indentation
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

" Cursor
set guicursor=

" Dinamically loaded vim configs
set exrc


" Text editing
" Line information
set relativenumber
set number

set nowrap

" Swap and backup
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set hidden

set incsearch
set scrolloff=4
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=80
set cursorline 

" Plugin managing
" https://github.com/junegunn/vim-plug#installation
call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none
