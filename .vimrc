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
Plugin 'tomtom/tcomment_vim'
Plugin 'ervandew/supertab'
Plugin 'danro/rename.vim'
Plugin 'kana/vim-fakeclip'
Plugin 'vim-auto-save'
Plugin 'tpope/vim-dispatch'

" Search
Plugin 'rking/ag.vim'

" Interface
Plugin 'altercation/vim-colors-solarized'
Plugin 'geoffharcourt/one-dark.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Lokaltog/vim-powerline'
Plugin 'bufexplorer.zip'
Plugin 'milkypostman/vim-togglelist'
Plugin 'chriskempson/base16-vim'

" Code manipulation
Plugin 'tpope/vim-surround'
" Plugin 'svermeulen/vim-easyclip'
Plugin 'tpope/vim-endwise'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/taglist.vim'

" Syntax Highlight
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'matchit.zip'
"Plugin 'Syntastic'

" Commands
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'

" Other
Plugin 'malkomalko/projections.vim'
Plugin 'vol2223/vim-colorblind-colorscheme'

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
map <F3> :Ag <cword><CR>

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
map <BS> :NERDTreeToggle<CR>

call togglebg#map("<F5>")

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

let g:rspec_command = "Dispatch bundle exec rspec --drb --color {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

let g:rails_projections = {
\ "config/projections.json": {
\   "command": "projections"
\ },
\ "app/services/*.rb": {
\   "command": "service"
\ },
\ "app/presenters/*.rb": {
\   "command": "presenter"
\ },
\ "app/serializers/*.rb": {
\   "command": "serializer"
\ },
\ "spec/factories/*.rb": {
\   "command": "factory"
\ },
\ "app/admin/*.rb": {
\   "command": "admin",
\   "affinity": "model",
\   "related": "app/models/%s.rb",
\   "template":
\   "ActiveAdmin.register %S do\n\n  # form do\n  # end\n\n  #menu parent: '', label: ''\n\n  # index do\n  # end\n\nend\n"
\ },
\ "config/*.rb": { "command": "config"  },
\ "spec/support/*.rb": {"command": "support"},
\ "spec/features/*_spec.rb": {
\   "command": "feature",
\   "template": "require 'spec_helper'\n\nfeature '%h' do\n\nend",
\ }}

let g:bufExplorerShowRelativePath=1

set foldmethod=indent
set foldlevel=20

set clipboard=unnamed

" Syntastic
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['html'] }

nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

" ignore files (for ctrl-p)
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

vnoremap m d
