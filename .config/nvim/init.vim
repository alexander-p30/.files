" vim:foldmethod=marker

" Plugin managing {{{
" Automatically install new plugins
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q | so ~/.config/nvim/init.vim
  \| endif

call plug#begin('~/.vim/plugged')
" File-related
Plug 'lambdalisue/fern.vim' |
      \ Plug  'lambdalisue/fern-hijack.vim' |
      \ Plug 'lambdalisue/fern-git-status.vim' |
      \ Plug 'lambdalisue/fern-renderer-nerdfont.vim' |
      \ Plug  'lambdalisue/glyph-palette.vim' |
      \ Plug 'yuki-yano/fern-preview.vim'
Plug 'nvim-telescope/telescope.nvim' |
      \ Plug 'nvim-lua/plenary.nvim' |
      \ Plug 'nvim-lua/popup.nvim'

" Fonts and assets
Plug 'lambdalisue/nerdfont.vim'

" Git
Plug 'kdheepak/lazygit.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'
Plug 'tpope/vim-fugitive'

" LS, syntax highlighting and programming utils
Plug 'neovim/nvim-lspconfig' |
      \ Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp' |
      \ Plug 'hrsh7th/cmp-buffer' |
      \ Plug 'hrsh7th/nvim-cmp' |
      \ Plug 'saadparwaiz1/cmp_luasnip' |
      \ Plug 'L3MON4D3/LuaSnip'
Plug 'ray-x/lsp_signature.nvim'
Plug 'vim-test/vim-test'
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'elixir'] }
Plug 'mg979/vim-visual-multi'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} |
      \ Plug 'nvim-treesitter/playground', { 'on': 'TSPlaygroundToggle' } |
      \ Plug 'p00f/nvim-ts-rainbow'
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'mboughaba/i3config.vim', { 'for': 'i3config' }
Plug 'fladson/vim-kitty'
Plug 'RRethy/vim-illuminate'
Plug 'kmonad/kmonad-vim'
Plug 'tversteeg/registers.nvim', { 'branch': 'main' }

" Other
Plug 'kassio/neoterm'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'rmagatti/auto-session'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Themes / Visual
Plug 'alexander-p30/onedark.nvim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'morhetz/gruvbox'
Plug 'alexander-p30/gruvbox-material'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'romgrk/doom-one.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
call plug#end()
" }}}

" Folding {{{
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" }}}

" Theming and styling {{{
lua require('onedark').setup()
" }}}

" General Sets and Cmds {{{
" Indentation
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set notimeout
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

" trigger `autoread` when files changes on disk
set autoread
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

set title
set incsearch
set scrolloff=4
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set colorcolumn=120
set cursorline
set termguicolors

" Split behaviour
set noequalalways
set splitbelow
set splitright

syntax on
" }}}

" Plugin configs {{{
" nvim-web-devicons
lua require'nvim-web-devicons'.setup { default = true; }

" vim-test
let test#strategy = "neoterm"

" neoterm
let g:neoterm_default_mod='botright'
let g:neoterm_size=''

" gitgutter {{{
let gitgutter_character = "▎"
let g:gitgutter_sign_added = gitgutter_character
let g:gitgutter_sign_modified = gitgutter_character
let g:gitgutter_sign_removed = gitgutter_character
let g:gitgutter_sign_removed_first_line = gitgutter_character
let g:gitgutter_sign_removed_above_and_below = gitgutter_character
let g:gitgutter_sign_modified_removed = gitgutter_character
" }}}

" fern
let g:fern#renderer = "nerdfont"

" git-blamer {{{
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_delay = 500
" }}}

" Keybindings {{{
let mapleader = " "

" Splits {{{
nnoremap <A-h> <C-w><C-h>
nnoremap <A-j> <C-w><C-j>
nnoremap <A-k> <C-w><C-k>
nnoremap <A-l> <C-w><C-l>
" }}}

" Test-related bindings {{{
nnoremap <leader>tn :call OpenNeoterm('tn')<cr>
nnoremap <leader>tf :call OpenNeoterm('tf')<cr>
nnoremap <leader>ts :call OpenNeoterm('ts')<cr>
nnoremap <leader>tl :call OpenNeoterm('tl')<cr>
nnoremap <leader>tv :TestVisit<cr>
nnoremap <leader>tc :Tclose!<cr>
" }}}

" Yanking and pasting clipboard {{{
vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p
" }}}

" Writing and Closing {{{
nnoremap <leader>w :w<cr>
nnoremap <leader>qw :wq<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader>Q :q!<cr>
" }}}

" Fern {{{
nnoremap <silent> <C-b> :Fern . -drawer -width=50 -reveal=% -toggle<cr>
function! s:fern_settings() abort
  nmap <silent> <buffer> p     <Plug>(fern-action-preview:toggle)
  nmap <silent> <buffer> <C-p> <Plug>(fern-action-preview:auto:toggle)
  nmap <silent> <buffer> <C-d> <Plug>(fern-action-preview:scroll:down:half)
  nmap <silent> <buffer> <C-u> <Plug>(fern-action-preview:scroll:up:half)
endfunction

augroup fern-settings
  autocmd!
  autocmd FileType fern call s:fern_settings()
augroup END
" }}}

" Copy until end of line
nnoremap Y y$

" Copy current filepath
nmap <leader>yfp :let @" = expand("%")<cr>

" Clear search highlighting
nnoremap <C-h> :noh<cr>

" Update configs
nnoremap <C-s> :so ~/.config/nvim/init.vim<cr>

" gitgutter hunk navigation
nnoremap <silent> <cr> :GitGutterNextHunk<cr>
nnoremap <silent> <backspace> :GitGutterPrevHunk<cr>

" Git
nnoremap <silent> <leader>g :Git<CR>
nnoremap <silent> <leader>lg :Git<CR>

" Profiling
nnoremap <leader>profi :call ProfileSession()<cr>
nnoremap <leader>profs :call EndSessionProfiling()<cr>

" Delete current file
nnoremap <Leader>df :call DeleteFileAndCloseBuffer()<cr>

" Increment number under the cursor
nnoremap <C-S-X> <C-a>

" Quickfix list navigation
nnoremap <leader>cn :cnext <cr>
nnoremap <leader>cp :cprev <cr>
nnoremap <leader>co :copen <cr>
nnoremap <leader>cc :cclose <cr>

" Location list navigation
nnoremap <leader>ln :lnext <cr>
nnoremap <leader>lp :lprev <cr>
nnoremap <leader>lo :lopen <cr>
nnoremap <leader>lc :lclose <cr>

" Tab in normal mode to enter command mode
nnoremap <TAB> :
" }}}

" External Files Sourcing {{{
source $HOME/.config/nvim/modules/functions.vim
source $HOME/.config/nvim/modules/hexokinase.vim
source $HOME/.config/nvim/modules/treesitter.lua
source $HOME/.config/nvim/modules/telescope.lua
source $HOME/.config/nvim/modules/lualine.lua
source $HOME/.config/nvim/modules/nvim_lsp.lua
source $HOME/.config/nvim/modules/cmp.lua
source $HOME/.config/nvim/modules/indent_blankline.lua
" }}}

