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
      \ Plug  'lambdalisue/glyph-palette.vim'
Plug 'nvim-telescope/telescope.nvim' |
      \ Plug 'nvim-lua/plenary.nvim' |
      \ Plug 'nvim-lua/popup.nvim'   |
      \ Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Fonts and assets
Plug 'lambdalisue/nerdfont.vim'

" Git
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

" Projectionist
Plug 'tpope/vim-projectionist'
Plug 'c-brenn/fuzzy-projectionist.vim'
Plug 'andyl/vim-projectionist-elixir'

" Other
Plug 'kassio/neoterm'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'rmagatti/auto-session'

" Themes / Visual
Plug 'navarasu/onedark.nvim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-lualine/lualine.nvim'
Plug 'romgrk/doom-one.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'folke/which-key.nvim' 
call plug#end()
" }}}

" Folding {{{
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" }}}

" Theming and styling {{{
colorscheme onedark
" }}}

" General Sets and Cmds {{{
" Indentation
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set smartindent

set timeoutlen=500
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
let g:neoterm_default_mod = 'botright'
let g:neoterm_size = ''
let g:neoterm_autoscroll = 1
let g:neoterm_automap_keys = ''

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
let g:blamer_prefix = ' 🤡 '
" }}}

" Keybindings {{{
let mapleader = " "

" Terminal/Test-related bindings {{{
nnoremap <leader>tt :Ttoggle<CR>

nnoremap <leader>tn :call OpenNeoterm('tn')<CR>
nnoremap <leader>tf :call OpenNeoterm('tf')<CR>
nnoremap <leader>ts :call OpenNeoterm('ts')<CR>
nnoremap <leader>tl :call OpenNeoterm('tl')<CR>

nnoremap <leader>tv :TestVisit<CR>
nnoremap <leader>tc :Tclose!<CR>
" }}}

" Linting {{{
nnoremap <leader>cq :T mix format && mix credo --strict && mix dialyzer<CR>
" }}}

" Yanking and pasting clipboard {{{
vnoremap <C-y> "+y
nnoremap <C-p> "+p
vnoremap <C-p> "+p
" }}}

" Writing and Closing {{{
nnoremap <leader>w :w<CR>
nnoremap <leader>qw :wq<CR>
nnoremap <leader>qq :q<CR>
nnoremap <leader>qall :qall<CR>
nnoremap <leader>qal! :qall!<CR>
nnoremap <leader>Q :q!<CR>
" }}}

" Fern {{{
nnoremap <silent> <C-b> :Fern . -drawer -width=50 -reveal=% -toggle<CR>
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
nmap <leader>yfp :let @" = expand("%")<CR>

" Clear search highlighting
nnoremap <silent> <C-h> :noh<CR>

" Update configs
nnoremap <C-s> :so ~/.config/nvim/init.vim<CR>

" gitgutter hunk navigation
nnoremap <silent> <CR> :GitGutterNextHunk<CR>
nnoremap <silent> <backspace> :GitGutterPrevHunk<CR>

" Git
nnoremap <silent> <leader>gg :Git<CR>
nnoremap <leader>gP :Git push<CR>
nnoremap <leader>gsP :call SetBranchUpstream()<CR>
nnoremap <leader>gp :Git pull<CR>
nnoremap <leader>gcb :Git checkout -b 

" Profiling
nnoremap <leader>profi :call ProfileSession()<CR>
nnoremap <leader>profs :call EndSessionProfiling()<CR>

" Delete current file
nnoremap <Leader>df :call DeleteFileAndCloseBuffer()<CR>

" Delete all buffers
nnoremap <Leader>db :bufdo bd!

" Increment number under the cursor
nnoremap <C-S-X> <C-a>

" Sort selection
vnoremap <silent> <leader>so :'<,'>sort<CR>

vnoremap <Up> :m '<-2<CR>gv=gv
vnoremap <Down> :m '>+1<CR>gv=gv

" Quickfix list navigation
nnoremap <leader>cn :cnext <CR>
nnoremap <leader>cp :cprev <CR>
nnoremap <silent> <leader>co :copen <CR>
nnoremap <silent> <leader>cc :cclose <CR>

" Location list navigation
nnoremap <leader>ln :lnext <CR>
nnoremap <leader>lp :lprev <CR>
nnoremap <silent> <leader>lo :lopen <CR>
nnoremap <silent> <leader>lc :lclose <CR>
" }}}

" External Files Sourcing {{{
source $HOME/.config/nvim/modules/functions.vim
source $HOME/.config/nvim/modules/hexokinase.vim
source $HOME/.config/nvim/modules/treesitter.lua
source $HOME/.config/nvim/modules/telescope.lua
source $HOME/.config/nvim/modules/lualine.lua
source $HOME/.config/nvim/modules/lsp.lua
source $HOME/.config/nvim/modules/cmp.lua
source $HOME/.config/nvim/modules/indent_blankline.lua
source $HOME/.config/nvim/modules/which_key.lua
" }}}

