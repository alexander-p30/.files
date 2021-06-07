" Indentation
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set updatetime=500
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

set title
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
Plug 'vim-test/vim-test'
Plug 'kassio/neoterm'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-surround'
call plug#end()

" Theming and styling
colorscheme onedark
let g:airline_theme='onedark'

" Keybindings
let mapleader=" "

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Test-related bindings
"" nnoremap <leader>tn :TestNearest<cr>
nnoremap <leader>tn :call OpenNeotermInNewTabAndFocus('tn')<cr>
nnoremap <leader>tf :call OpenNeotermInNewTabAndFocus('tf')<cr>
nnoremap <leader>ts :call OpenNeotermInNewTabAndFocus('ts')<cr>
nnoremap <leader>tl :call OpenNeotermInNewTabAndFocus('tl')<cr>
nnoremap <leader>tv :TestVisit<cr>
nnoremap <leader>cc :Tclose!<cr>

fun! OpenNeotermInNewTabAndFocus(option)
  if a:option == 'tn' 
    TestNearest 
  elseif a:option == 'tf' 
    TestFile 
  elseif a:option == 'ts' 
    TestSuite
  elseif a:option == 'tl' 
    TestLast 
  endif

  tabnext
endfun

" Yanking and pasting clipboard
vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p

" Definition navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Tab managing
nnoremap <C-t> :tabedit %<cr>
nnoremap <C-w> :tabclose<cr>
nnoremap <C-h> :tabprev<cr>
nnoremap <C-j> :tabfirst<cr>
nnoremap <C-l> :tabnext<cr>
nnoremap <C-k> :tablast<cr>

" Clear search highlighting
nnoremap <leader>ww :w<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader>QQ :q<cr>

" Clear search highlighting
nnoremap <leader>h :noh<cr>

" Update configs
nnoremap <C-s> :so ~/.config/nvim/init.vim<cr>

" Coc floating window scroll
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" Plugin configs
let test#strategy = "neoterm"
let g:neoterm_default_mod='tab'
let g:blamer_delay = 500
let g:blamer_enabled = 1
let g:gitgutter_sign_added = '🔵'
let g:gitgutter_sign_modified = '⚪'
let g:gitgutter_sign_removed = '🔴'

" Delete current file
nnoremap <Leader>df :call DeleteFileAndCloseBuffer()<cr>

fun! DeleteFileAndCloseBuffer()
  let choice = confirm("Delete file and close buffer?", "&Do it!\n&Nonono", 1)
  if choice == 1 | call delete(expand('%:p')) | q! | endif
endfun

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif

