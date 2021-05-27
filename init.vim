" Indentation
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set updatetime=50
" Cursor
set guicursor=
" Dinamically loaded vim configs
set exrc


" Text editing
" Line information
"" set relativenumber
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
set colorcolumn=120
set nocursorline 

" Plugin managing
" https://github.com/junegunn/vim-plug#installation
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-editors/vim-elixir'
Plug 'APZelos/blamer.nvim'
Plug 'airblade/vim-gitgutter' 
call plug#end()

" Theming and styling
colorscheme gruvbox
highlight Normal guibg=none ctermbg=none

"" Keybindings
let mapleader = " "
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p

let g:blamer_delay = 500
let g:blamer_enabled = 1
let g:gitgutter_sign_added = '🔵'
let g:gitgutter_sign_modified = '⚪'
let g:gitgutter_sign_removed = '🔴'

