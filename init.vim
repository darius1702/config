let mapleader = "\<space>"

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif

call plug#begin('~/.config/nvim/plugged')
" Color schemes
Plug 'joshdick/onedark.vim'       " onedark
Plug 'arcticicestudio/nord-vim'   " nord
Plug 'gruvbox-community/gruvbox'  " gruvbox
Plug 'junegunn/seoul256.vim'      " seoul256
Plug 'jnurmine/Zenburn'           " zenburn
Plug 'arzg/vim-colors-xcode'      " xcodedark, xcodedarkhc, xcodewwdc
" Syntax
Plug 'jiangmiao/auto-pairs'
" Lightline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
" Git
Plug 'airblade/vim-gitgutter'
" UI
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

colorscheme xcodedark
set bg=dark
set termguicolors

let g:zenburn_italic_Comment=0

set scrolloff=3
set matchpairs+=<:>
set signcolumn=auto

set clipboard=unnamedplus

nnoremap <silent><leader>t :8sp +term<CR>
tnoremap <silent><ESC> <C-\><C-n>

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }
set noshowmode

set langmenu=en_US
let $LANG = 'en_US'
set expandtab
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=50
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
set ignorecase
" set smartcase
set nocompatible
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber
set splitbelow splitright

" Nerd tree
map <silent><leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore = ['\.png$','\.jpg$','\.gif$','\.mp3$','\.flac$', '\.ogg$', '\.mp4$','\.avi$','.webm$','.mkv$','\.pdf$', '\.zip$', '\.tar.gz$', '\.rar$']

" Shortcutting split navigation, saving a keypress:
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

"if !has('gui_running')
  set t_Co=256
"endif

"hi! Normal ctermbg=NONE guibg=NONE
"hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
"hi! link LineNr guibg
"hi! link SignColumn LineNr


""""""fzf""""""
nmap <silent><leader>/ :Lines<cr>
"""""""""""""""

"""""""""goyo"""""""""
" let g:goyo_linenr = 1
let g:goyo_width = "80%"
let g:goyo_heigth = "80%"

map <silent><leader>g :Goyo<cr>

"Transparent background after exiting goyo
function! s:goyo_leave()
"  hi! Normal ctermbg=NONE guibg=NONE
"  hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
"  hi! link LineNr guibg
"  hi! link SignColumn LineNr
endfunction
autocmd! User GoyoLeave nested call <SID>goyo_leave()
