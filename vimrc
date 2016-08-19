"========================================================="
"                    Vim Configuration                    "
"                                                         "
"                                                         "
"                  Author: David Hagerty                  "
"                                                         "
"       My configuration for Vim, lovingly crafted.       "
"                                                         "
"========================================================="
let mapleader = "\<Space>"

imap <C-[> <esc>:w<cr>

nmap <leader>vr :sp $MYVIMRC<cr>
nmap <leader>so :source $MYVIMRC<cr>
nmap <leader>h :nohlsearch<CR>
nmap <leader>b :TagbarToggle<CR>

nnoremap <expr> { len(getline(line('.')-1)) > 0 ? '{+' : '{-'
nnoremap <expr> } len(getline(line('.')+1)) > 0 ? '}-' : '}+'

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
  Plugin 'gmarik/Vundle.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'tpope/vim-commentary'
  Plugin 'tpope/vim-rails'
  Plugin 'tpope/vim-surround'
  Plugin 'tpope/vim-unimpaired'
  Plugin 'tpope/vim-abolish'
  Plugin 'tpope/vim-repeat'
  Plugin 'tpope/vim-haml'
  Plugin 'tpope/vim-rbenv'
  Plugin 'tpope/vim-bundler'
  Plugin 'tpope/vim-endwise'
  Plugin 'janko-m/vim-test'
  Plugin 'benmills/vimux'
  Plugin 'ctrlpvim/ctrlp.vim'
  Plugin 'tomtom/tlib_vim'
  Plugin 'vim-ruby/vim-ruby'
  Plugin 'wellle/targets.vim'
  Plugin 'vim-scripts/closetag.vim'
  Plugin 'scrooloose/syntastic'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'majutsushi/tagbar'
  Plugin 'airblade/vim-gitgutter'
  Plugin 'Shougo/neocomplete.vim'
  Plugin 'tweekmonster/braceless.vim'
  Plugin 'jiangmiao/auto-pairs'
  Plugin 'ekalinin/Dockerfile.vim'
  Plugin 'scrooloose/nerdtree'
  Plugin 'thoughtbot/vim-rspec'
  Plugin 'dracula/vim'
call vundle#end()

filetype plugin indent on

set smartindent

set incsearch
set hlsearch

set laststatus=2
set showtabline=2

set colorcolumn=+1

set encoding=utf-8 nobomb

syntax on

colorscheme dracula

set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start

set ttyfast
set ttyscroll=3
set lazyredraw

set wildmenu
set linespace=0
set wrap
set linebreak

set cursorline
set cursorcolumn

set number
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
autocmd FileType ruby,haml,yaml,coffee BracelessEnable +fold +highlight
autocmd WinLeave * setlocal nocursorline
autocmd Filetype gitcommit setlocal spell textwidth=72

autocmd BufRead * normal zR

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let test#strategy = 'vimux'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
let g:ctrlp_use_caching = 0

let g:syntastic_aggregate_errors=1
let g:syntastic_auto_loc_list=1
