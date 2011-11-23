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

" Stuff for auto indent and different filetypes
filetype plugin indent on
augroup vimrc
au!
autocmd FileType ant setlocal sw=2 sts=2 et
autocmd FileType sh setlocal sw=4 sts=4 et
autocmd FileType bash setlocal sw=4 sts=4 et
autocmd FileType xml setlocal sw=2 sts=2 et
autocmd FileType python setlocal sw=4 sts=4 et tw=72
autocmd FileType php setlocal sw=4 sts=4 et
autocmd FileType rst setlocal sw=4 sts=4 et
autocmd FileType ruby setlocal sw=2 sts=2 et tw=72
autocmd FileType cucumber setlocal sw=2 sts=2 et 
autocmd FileType java setlocal sw=2 sts=2 et 
autocmd FileType javascript setlocal sw=2 sts=2 et 
autocmd FileType htmldjango setlocal sw=4 sts=4 et 
autocmd FileType jsp setlocal sw=2 sts=2 et 
autocmd FileType html setlocal sw=2 sts=2 et 
autocmd FileType eruby setlocal sw=2 sts=2 et 
autocmd FileType xhtml setlocal sw=2 sts=2 et
autocmd BufNewFile,BufRead Capfile setf ruby
autocmd BufNewFile,BufRead Vagrantfile setf ruby
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
"  " Command-T
"  " --------------------
let g:CommandTMatchWindowAtTop=1

" Vim settings for cnext etc.
map <F2>  :cprev<CR>
map <F3>  :cnext<CR>

" --------------------
"  Stuff for clojure
" --------------------
let g:clj_highlight_builtins = 1
let g:clj_paren_rainbow = 10

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
map <silent><C-Left> <C-T>
map <silent><C-Right> <C-]>

" twitvim
let twitvim_count = 100

augroup filetypedetect 
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig 
augroup END 


call pathogen#runtime_append_all_bundles() 
