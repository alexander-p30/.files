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
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'tiagofumo/vim-nerdtree-syntax-highlight' | 
            \ Plug 'PhilRunninger/nerdtree-visual-selection' 
Plug 'tpope/vim-commentary' 
call plug#end()

" Theming and styling
colorscheme onedark
let g:airline_theme = 'onedark'

" Keybindings
let mapleader = " "

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Test-related bindings
nnoremap <leader>tn :call OpenNeotermInNewTabAndFocus('tn')<cr>
nnoremap <leader>tf :call OpenNeotermInNewTabAndFocus('tf')<cr>
nnoremap <leader>ts :call OpenNeotermInNewTabAndFocus('ts')<cr>
nnoremap <leader>tl :call OpenNeotermInNewTabAndFocus('tl')<cr>
nnoremap <leader>tv :TestVisit<cr>
nnoremap <leader>c :Tclose!<cr>
"
" File navigation
nnoremap <C-n> :NERDTreeFind<CR>

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
nnoremap <leader>w :w<cr>
nnoremap <leader>qw :wq<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader>Q :q!<cr>

" Clear search highlighting
nnoremap <leader>h :noh<cr>

" Update configs
nnoremap <C-s> :so ~/.config/nvim/init.vim<cr>

" Coc floating window scroll
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" gitgutter hunk navigation
nnoremap <silent> <cr> :GitGutterNextHunk<cr>
nnoremap <silent> <backspace> :GitGutterPrevHunk<cr>

" Delete current file
nnoremap <Leader>df :call DeleteFileAndCloseBuffer()<cr>

fun! DeleteFileAndCloseBuffer()
  let choice = confirm("Delete file and close buffer?", "&Do it!\n&Nonono", 1)
  if choice == 1 | call delete(expand('%:p')) | q! | endif
endfun

" Plugin configs
" vim-test
let test#strategy = "neoterm"

" neoterm
let g:neoterm_default_mod='tab'

" blamer 
let g:blamer_delay = 500
let g:blamer_enabled = 1

" gitgutter
let g:gitgutter_sign_added = 'Δ'
let g:gitgutter_sign_modified = '▷'
let g:gitgutter_sign_removed = '∇'
let g:gitgutter_sign_removed_first_line = '∅'
let g:gitgutter_sign_removed_above_and_below = '⩫'
let g:gitgutter_sign_modified_removed = '◁'

" NERDTree
let g:NERDTreeQuitOnOpen = 1

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (has("nvim"))
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
if (has("termguicolors"))
  set termguicolors
endif

