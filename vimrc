" enter vim mode
set nocompatible
" set up Vundle (https://github.com/gmarik/vundle)
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" list of plugins installed by Vundle
Bundle 'gmarik/vundle'
Bundle 'molokai'
Bundle 'vim-flake8'
Bundle 'ctrlp.vim'
Bundle 'Syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'bling/vim-airline'
Bundle 'fatih/vim-go'
Bundle 'TwitVim'
Bundle 'taglist.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'mlafeldt/vim-puppet'
Bundle 'honza/dockerfile.vim'
Bundle 'derekwyatt/vim-scala'
Bundle 'elzr/vim-json'

" Clojure Plugins
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-classpath'
Bundle 'tpope/vim-leiningen'
Bundle 'tpope/vim-projectionist'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-fireplace'
Bundle 'rainbow_parentheses.vim'

" SnipMate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"

Bundle "vim-prometheus"

Bundle "ag.vim"

Bundle "leafgarland/typescript-vim"

Bundle "elmcast/elm-vim"

" Terraform
Bundle "hashivim/vim-terraform"
let g:terraform_fmt_on_save=1

" Go Present
Bundle "corylanou/vim-present"

" end of Vundle setup
filetype plugin indent on

" -------------------------------------------

let mapleader = ","
let maplocalleader = ","
set t_Co=256
colorscheme molokai
"set guifont=DejaVu_Sans_Mono:h9:cANSI
syntax on
set ruler
set showcmd
set hlsearch
" Allow backspace over everything in insert mode
set backspace=indent,eol,start

" Make vim-airline work
set laststatus=2

set modeline
set modelines=5

set nu
set cursorline
set cursorcolumn

" Stuff for auto indent and different filetypes
augroup vimrc
au!
autocmd FileType ant setlocal sw=2 sts=2 et
autocmd FileType sh setlocal sw=4 sts=4 et
autocmd FileType bash setlocal sw=4 sts=4 et
autocmd FileType xml setlocal sw=2 sts=2 et
autocmd FileType python setlocal sw=4 sts=4 et tw=72
autocmd FileType erlang setlocal sw=4 sts=4 et tw=72
autocmd FileType php setlocal sw=4 sts=4 et
autocmd FileType rst setlocal sw=4 sts=4 et
autocmd FileType ruby setlocal sw=2 sts=2 et tw=72
autocmd FileType cucumber setlocal sw=2 sts=2 et 
autocmd FileType java setlocal sw=2 sts=2 et 
autocmd FileType javascript setlocal sw=2 sts=2 et 
autocmd FileType coffee setlocal sw=2 sts=2 et 
autocmd FileType htmldjango setlocal sw=4 sts=4 et 
autocmd FileType jsp setlocal sw=2 sts=2 et 
autocmd FileType html setlocal sw=2 sts=2 et 
autocmd FileType eruby setlocal sw=2 sts=2 et 
autocmd FileType xhtml setlocal sw=2 sts=2 et
autocmd FileType json setlocal sw=2 sts=2 et
autocmd FileType groovy setlocal sw=4 sts=4 et
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 et
autocmd BufNewFile,BufRead Capfile setf ruby
autocmd BufNewFile,BufRead Vagrantfile setf ruby
autocmd FileType ruby,python,puppet autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END

" --------------------
"  " TagList
"  " --------------------
"  " F4:  Switch on/off TagList
nnoremap <silent> <F4> :TlistToggle<CR>

" --------------------
"  " NERDTree
"  " --------------------
"  " F5:  Switch on/off NERDTree
nnoremap <silent> <F5> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

" --------------------
" CtrlP
" --------------------
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:20'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Vim settings for cnext etc.
map <F2>  :cprev<CR>
map <F3>  :cnext<CR>

" --------------------
"  Stuff for clojure
" --------------------
let g:clj_highlight_builtins = 1
let g:clj_paren_rainbow = 10
let g:rbpt_colorpairs = [
  \[ 'yellow'      , 'orange1'],
  \[ 'green'       , 'yellow1'],
  \[ 'cyan'        , 'greenyellow'],
  \[ 'magenta'     , 'green1'],
  \[ 'red'         , 'springgreen1'],
  \[ 'yellow'      , 'cyan1'],
  \[ 'green'       , 'slateblue1'],
  \[ 'cyan'        , 'magenta1'],
  \[ 'magenta'     , 'purple1'],
  \[ 'darkyellow'  , 'orangered3'],
  \[ 'darkgreen'   , 'orange2'],
  \[ 'blue'        , 'yellow3'],
  \[ 'darkmagenta' , 'olivedrab4'],
  \[ 'red'         , 'green4'],
  \[ 'darkyellow'  , 'paleturquoise3'],
  \[ 'darkgreen'   , 'deepskyblue4'],
  \[ 'blue'        , 'darkslateblue'],
  \[ 'darkmagenta' , 'darkviolet'],
\]
let g:rbpt_max = 16
" --------------------
" Stuff for Python
"
autocmd FileType python set omnifunc=pythoncomplete#Complete
python << EOF
import os
import sys
import vim
for p in sys.path:
	if os.path.isdir(p):
		vim.command(r"set path+=%s" % (p.replace(" ", r"\ ")))
EOF
set tags+=$HOME/.vim/tags/python.ctags
let g:syntastic_python_flake8_args='--ignore=E501'
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>

" twitvim
let twitvim_count = 100

augroup filetypedetect 
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
augroup END 

let g:flake8_cmd=$HOME."/.virtualenvs/vim/bin/flake8"
let g:airline_powerline_fonts = 1

" Anti fuck up spec runner
nnoremap <leader>s :RunTestFile<cr>
nnoremap <leader>S :RunNearestTest<cr>
nnoremap <leader>a :RunAllTests<cr>

" Do not automagically install Go stuff 
let g:go_disable_autoinstall = 1
let g:go_fmt_command = "goimports"

" elm specific settings
let g:elm_format_autosave = 1

set shell=/bin/zsh
