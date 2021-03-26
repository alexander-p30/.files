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
set colorcolumn=80
set nocursorline 

" Plugin managing
" https://github.com/junegunn/vim-plug#installation
call plug#begin('~/.vim/plugged')
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}
Plug 'elixir-editors/vim-elixir'
Plug 'scrooloose/nerdTree'
call plug#end()

" Theming and styling
colorscheme gruvbox
highlight Normal guibg=none ctermbg=none

autocmd VimEnter * NERDTree | wincmd p

let NERDTreeShowHidden=1

"" Keybindings
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

