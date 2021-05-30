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
set colorcolumn=120
set nocursorline 

syntax on

" Plugin managing
" https://github.com/junegunn/vim-plug#installation
call plug#begin('~/.vim/plugged')
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'elixir-editors/vim-elixir'
Plug 'APZelos/blamer.nvim'
Plug 'airblade/vim-gitgutter' 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" Theming and styling
colorscheme onedark
let g:airline_theme='onedark'

"" Keybindings
let mapleader=" "
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

let g:blamer_delay = 500
let g:blamer_enabled = 1
let g:gitgutter_sign_added = '🔵'
let g:gitgutter_sign_modified = '⚪'
let g:gitgutter_sign_removed = '🔴'

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

