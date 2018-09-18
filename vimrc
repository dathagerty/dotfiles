"========================================================="
"                                                         "
"                    Vim Configuration                    "
"                                                         "
"                  Author: David Hagerty                  "
"                     Copyright 2018                      "
"                                                         "
"       My configuration for Vim, lovingly crafted.       "
"              Made for ease of use in macOS.             "
"                    Copy as you wish.                    "
"                But credit is appreciated.               "
"                                                         "
"========================================================="

"==============="
"  Keybindings  "
"==============="

" Set the Leader key to the spacebar
let mapleader = "\<Space>"

" When in Insert mode, <Control>+[ will exit Insert mode and save changes.
imap <C-[> <esc>:w<CR>

" Open this file for editing anywhere you are
nmap <leader>vr :sp $MYVIMRC<CR>

" Reload this configuration
nmap <leader>so :source $MYVIMRC<CR>

" Search without highlighting
nmap <leader>h :nohlsearch<CR>

" Jump forwards by paragraph. Jumps to the beginning and then the end of 'paragraph'-type structures
nnoremap <expr> { len(getline(line('.')-1)) > 0 ? '{+' : '{-'

" Jump backwards by paragraph. Jumps to the end and then the beginning of 'paragraph'-type structures
nnoremap <expr> } len(getline(line('.')+1)) > 0 ? '}-' : '}+'

" Disable arrow keys to encourage Vim's own movement paradigms
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"==================="
"  Vundle Settings  "
"==================="

" Enable Vundle
set rtp+=~/.vim/bundle/Vundle.vim

" List plugins to manage
call vundle#begin()
  " Let Vundle manage itself
  Plugin 'gmarik/Vundle.vim'
  " Better Ruby support in Vim
  Plugin 'vim-ruby/vim-ruby'
  " The best git wrapper, period.
  Plugin 'tpope/vim-fugitive'
  " Easily handle comments
  Plugin 'tpope/vim-commentary'
  " Makes Rails and Vim best friends
  Plugin 'tpope/vim-rails'
  " Makes working with brackets, quotes, tags, etc easier
  Plugin 'tpope/vim-surround'
  " The secret sauce to make netrw better
  Plugin 'tpope/vim-vinegar'
  " Work with words better
  Plugin 'tpope/vim-abolish'
  " Better repeating support
  Plugin 'tpope/vim-repeat'
  " Haml support
  Plugin 'tpope/vim-haml'
  " Basic rbenv support
  Plugin 'tpope/vim-rbenv'
  " Bundler integration
  Plugin 'tpope/vim-bundler'
  " Support for auto-completing if/endif do/end type structures
  Plugin 'tpope/vim-endwise'
  " Plugin 'ctrlpvim/ctrlp.vim'
  " Plugin 'wellle/targets.vim'
  " Plugin 'vim-scripts/closetag.vim'
  " Plugin 'scrooloose/syntastic'
  " Plugin 'majutsushi/tagbar'
  " Add git diff information to the gutter
  Plugin 'airblade/vim-gitgutter'
  " Plugin 'jiangmiao/auto-pairs'
  " Plugin 'thoughtbot/vim-rspec'
  " Plugin 'junegunn/fzf.vim'
call vundle#end()

"==========="
"  General  "
"==========="

" Set the local encoding to UTF-8 and ignore any BOMs
set encoding=utf-8 nobomb

" Turn on filetype detection, and turn on filetype-based settings and indentation rules
filetype plugin indent on

" Enable syntax highlighting
syntax on

" Always show the status bar
set laststatus=2

" Allow backspaces to wrap over indents, line breaks, and the start of Insert mode
set backspace=indent,eol,start

" Enable better command-line completion
set wildmenu

" Turn on wrapping lines (default is on, but this is to show I want this behavior)
set wrap

" Wrap lines at words, not characters
set linebreak

" Turn on spell checking for Git commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

"=========="
"  Search  "
"=========="

" Case-insensitive search, unless we use capital letters
set ignorecase
set smartcase

" Incrementally search
set incsearch

" Highlight search results
set hlsearch

"=========================="
"  Tab and Space Settings  "
"=========================="

" Set tab to two spaces
set tabstop=2

" An indent is the same width as tab
set shiftwidth=2

" Expand tab characters into space characters
set expandtab

" Automatically indent blocks
set smartindent

"======================"
"  Performance Tuning  "
"======================"

" Indicate a fast terminal connection
set ttyfast

" Limit the scrolling speed
set ttyscroll=3

" Don't redraw while executing macros
set lazyredraw

"=========="
"  Cursor  "
"=========="

" Highlight the current line the cursor is on
set cursorline

" When the window is no longer active, do not highlight the cursor line
autocmd WinLeave * setlocal nocursorline

" Highlight the current column the cursor is in
set cursorcolumn

" When the window is no longer active, do not highlight the cursor column
autocmd WinLeave * setlocal nocursorcolumn

" Highlight the column after <textwidth> (default is 80 characters)
set colorcolumn=+1

"=================="
"  Line Numbering  "
"==================" 

" Turn on line numbering relative to the current line (default)
set relativenumber

" Set absolute line numbers while in Insert mode
autocmd InsertEnter * :set number

" Return to relative numbers outside of Insert mode
autocmd InsertLeave * :set relativenumber

" Set the fold level to the deepest level on reading a buffer
autocmd BufRead * normal zR

"==========================="
"  Plugin Related Settings  "
"==========================="

" set rtp+=/usr/local/opt/fzf
" nmap <leader>b :TagbarToggle<CR>
" autocmd FileType ruby,haml,yaml,coffee BracelessEnable +fold +highlight
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'
" let g:ctrlp_use_caching = 0
" let g:syntastic_aggregate_errors=1
" let g:syntastic_auto_loc_list=1
" command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
