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
Plugin 'skwp/vim-iterm-rspec'
Plugin 'tpope/vim-unimpaired'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'skwp/vim-conque'
Plugin 'tpope/vim-repeat'

" To enable racer autocompletion type signatures for Rust
Plugin 'Shougo/echodoc.vim'

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
Plugin 'gosukiwi/vim-atom-dark'
Plugin 'romainl/Apprentice.git'

" Code manipulation
Plugin 'tpope/vim-surround'
" Plugin 'svermeulen/vim-easyclip'
Plugin 'tpope/vim-endwise'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/taglist.vim'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/vim-easy-align'
" Plugin 'matze/vim-move'
Plugin 'honza/vim-snippets'

" Syntax Highlight
Plugin 'kchmck/vim-coffee-script'
" Plugin 'pangloss/vim-javascript'
Plugin 'matchit.zip'
Plugin 'isRuslan/vim-es6'
" Plugin 'Syntastic'
Plugin 'chrisbra/Colorizer'
Plugin 'tpope/vim-haml'
Plugin 'Shutnik/jshint2.vim'
Plugin 'burnettk/vim-angular'
" Plugin 'jelera/vim-javascript-syntax'
" Plugin 'othree/yajs.vim'
" Plugin 'sheerun/vim-polyglot'
Plugin 'leafgarland/typescript-vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'ngmy/vim-rubocop'

" Commands
Plugin 'Lokaltog/vim-easymotion'
Plugin 'kien/ctrlp.vim'

" Other
Plugin 'malkomalko/projections.vim'
Plugin 'vol2223/vim-colorblind-colorscheme'

call vundle#end()            " required
filetype plugin indent on    " required

syntax enable
colorscheme solarized
set background=light
let g:solarized_contrast = 'high'
set t_Co=256


" Powerline font settings
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
set termencoding=utf-8
let g:Powerline_stl_path_style = 'short'
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
map <F2> :Ag! 'def <cword>'<CR>
map <F3> :Ag! <cword><CR>

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
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

" Adding dash as part of the word
set isk+=-

" Navigation between split windows
:nmap <silent> <C-k> :wincmd k<CR>
:nmap <silent> <C-j> :wincmd j<CR>
:nmap <silent> <C-h> :wincmd h<CR>
:nmap <silent> <C-l> :wincmd l<CR>

" Toggle Nerdtree mapping
map <BS> :NERDTreeTabsToggle<CR>
map <S-BS> :NERDTreeFind<CR>


call togglebg#map("<F5>")

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

" let g:rspec_command = "bundle exec rspec --drb --color {spec}"
map <Leader>t :Dispatch rspec %<CR>
map <Leader>s :Dispatch rspec %:<C-r>=line('.')<CR><CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

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
set foldlevelstart=10

set clipboard=unnamed

" Syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
"
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0


nmap <script> <silent> <leader>q :call ToggleQuickfixList()<CR>

nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

vnoremap m d

" mvim settings
set visualbell
set gcr=a:blinkon0

set guifont=Inconsolata\ for\ Powerline:h19
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

set shell=zsh

" vim indent guides setup
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

" ctrlp-vim speed up
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/\.git/*,tmp/*
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" to add background for hightlight for onedark theme
" highlight Search guibg='#494949' guifg='NONE'

map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt

" set guioptions-=m  "remove menu bar
" set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
" set guioptions-=L  "remove left-hand scroll bar

" Auto-save on focus lost except unnamed buffers
:au FocusLost * silent! wa

" Syntastic

" let syntastic_mode_map = { 'passive_filetypes': ['html'] }
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

" Racer for rust
set hidden
let g:racer_cmd = "racer"
let $RUST_SRC_PATH="/Users/gregolsen/projects/rustc-1.7.0/src/"
let g:echodoc_enable_at_startup = 1

if !empty(matchstr($MY_RUBY_HOME, 'jruby'))
  let g:ruby_path = join(split(glob($MY_RUBY_HOME.'/lib/ruby/*.*')."\n".glob($MY_RUBY_HOME.'/lib/rubysite_ruby/*'),"\n"),',')
endif

let g:move_key_modifier = 'Leader'

" For Active Admin arb files
:autocmd BufRead,BufNewFile *.arb setfiletype ruby

" To not replace buffer while pasting in visual mode
vnoremap p "0p

" Keep indentation on the line wrap
set bri
