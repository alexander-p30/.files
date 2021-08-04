" vim:foldmethod=marker

" Plugin managing {{{
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

" LS, syntax highlighting and programming utils
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-test/vim-test'
Plug 'elixir-editors/vim-elixir'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'mg979/vim-visual-multi'
Plug 'mhinz/vim-mix-format'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-treesitter/playground'
Plug 'mboughaba/i3config.vim'

" Other
Plug 'kassio/neoterm'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'axelf4/vim-strip-trailing-whitespace'
Plug 'rmagatti/auto-session'

" Themes / Visual
Plug 'joshdick/onedark.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'morhetz/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'kyazdani42/nvim-web-devicons'
call plug#end()
" }}}

" Folding {{{
set nofoldenable
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" }}}

" Theming and styling {{{
let g:gruvbox_material_palette="mix"
colorscheme gruvbox-material
set background=dark
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
set noea

syntax on
" }}}

" Plugin configs {{{
" nvim-web-devicons
lua require'nvim-web-devicons'.setup { default = true; }

" vim-test
let test#strategy = "neoterm"

" vim-mix-format
let g:mix_format_on_save = 1

" neoterm
let g:neoterm_default_mod='botright'
let g:neoterm_size=''

" gitgutter {{{
let g:gitgutter_sign_added = 'Δ'
let g:gitgutter_sign_modified = '▷'
let g:gitgutter_sign_removed = '∇'
let g:gitgutter_sign_removed_first_line = '∅'
let g:gitgutter_sign_removed_above_and_below = '⩫'
let g:gitgutter_sign_modified_removed = '◁'
" }}}

" fern
let g:fern#renderer = "nerdfont"

" git-blamer {{{
let g:blamer_enabled = 1
let g:blamer_show_in_visual_modes = 0
let g:blamer_delay = 500
" }}}

" coc
let g:coc_node_path = '/home/alexander/.asdf/shims/node'
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
nnoremap <leader>tn :call OpenNeotermInNewTabAndFocus('tn')<cr>
nnoremap <leader>tf :call OpenNeotermInNewTabAndFocus('tf')<cr>
nnoremap <leader>ts :call OpenNeotermInNewTabAndFocus('ts')<cr>
nnoremap <leader>tl :call OpenNeotermInNewTabAndFocus('tl')<cr>
nnoremap <leader>tv :TestVisit<cr>
nnoremap <leader>c :Tclose!<cr>
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

" Coc {{{
" Definition navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)

" Floating window scroll
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-g> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-g> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
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

" Clear search highlighting
nnoremap <leader>h :noh<cr>

" Update configs
nnoremap <C-s> :so ~/.config/nvim/init.vim<cr>

" gitgutter hunk navigation
nnoremap <silent> <cr> :GitGutterNextHunk<cr>
nnoremap <silent> <backspace> :GitGutterPrevHunk<cr>

" LazyGit
nnoremap <silent> <leader>lg :LazyGit<CR>

" Profiling
nnoremap <leader>profi :call ProfileSession()<cr>
nnoremap <leader>profs :call EndSessionProfiling()<cr>

" Delete current file
nnoremap <Leader>df :call DeleteFileAndCloseBuffer()<cr>
" }}}

" External Files Sourcing {{{
source $HOME/.config/nvim/modules/functions.vim
source $HOME/.config/nvim/modules/hexokinase.vim
source $HOME/.config/nvim/modules/statusline.vim
source $HOME/.config/nvim/modules/treesitter.vim
source $HOME/.config/nvim/modules/telescope.vim
" }}}

