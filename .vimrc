set ts=2
set sw=2
set number
syntax on

set ignorecase
set hlsearch
set showmatch
set expandtab
set autoindent
set softtabstop=2
set incsearch
set smartcase
set showcmd
set nocompatible

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Helpers
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-bundler'
Plugin 'thoughtbot/vim-rspec'

" Tools
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'danro/rename.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'kana/vim-fakeclip'
Plugin 'vim-auto-save'

" Search
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'

" Interface
Plugin 'altercation/vim-colors-solarized'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Lokaltog/vim-powerline'
Plugin 'fholgado/minibufexpl.vim'

" Code manipulation
Plugin 'tpope/vim-surround'
Plugin 'svermeulen/vim-easyclip'
Plugin 'tpope/vim-endwise'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'scrooloose/nerdcommenter'

" Syntax Highlight
Plugin 'kchmck/vim-coffee-script'

" Other
Plugin 'malkomalko/projections.vim'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
set background=light
colorscheme solarized
set t_Co=256

" Powerline font settings
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
" Always show status line (for Powerline)
set laststatus=2

" Mappings to save/restore vim sessions
map <F7> :mksession! ~/vim_session<Enter>
map <F8> :source ~/vim_session<Enter>
map <F9> :cope<Enter>

" For full bash-like autocompletion
set wildmode=longest,list,full
set wildmenu

" Enabling continuous scroll
set scrolloff=10
set sidescrolloff=7
set sidescroll=10

" saving as root
cmap w!! %!sudo tee > /dev/null %

" greping for current word
map <F2> :Ggrep <cword><CR>
map <F3> :Ack <cword><CR>

" mapping for ESC
inoremap jk <ESC>
inoremap kj <ESC>

" insert empty line
nmap <s-t> o<ESC>k

" move to next tab
map <right> gt
" move to previous tag
map <left> gT

" automatically convert markdown file into html
au BufWritePost *.md :!markdown % > %.html

" Adding dash as part of the word
set isk+=-

" Navigation between split windows
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-l> :wincmd l<CR>

" Toggle Nerdtree mapping
map <C-o> :NERDTreeToggle<CR>

call togglebg#map("<F5>")

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
