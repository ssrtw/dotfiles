" golbal setting
"""""""""""""""""
syntax on
set encoding=utf-8
set mouse=r
set number
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4
"set smartindent
autocmd FileType python setlocal expandtab sw=4 softtabstop=4
set list listchars=tab:\¦\ |
set autoindent                  " set auto-indenting on for programming"
set showcmd                     " show the typing command"
set showmatch                   " automatically show matching brackets."
set ruler                       " show the cursor position all the time"
set laststatus=2                " make the last line where the status is two lines deep so you can see status always"
set background=dark             " Use colours that work well on a dark background (Console is usually black)"
set showmode                    " show the current mode"
set nocompatible                " be iMproved"
let mapleader="9"               " the <leader> key.  "
syntax enable                   " turn syntax highlighting on by default"
set ttyfast
""""""""""""""""""""

" vim-plug setting
"""""""""""""""""
filetype on
set rtp+=~/.vim/autoload/plug.vim
call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'terryma/vim-multiple-cursors'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf'
call plug#end()
filetype plugin indent on
""""""""""""""""""""

" solarized theme settings
"""""""""""""""""""
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_visibility="low"
"colorscheme tomasr/molokai
""""""""""""""""""""

" airline setting
"""""""""""""""""""
let g:airline_theme='laederon'
let g:airline_left_sep = '»'
let g:airline_right_sep = '«'
""""""""""""""""""""

" remove trailing whitespace when type :w on normal mode
"""""""""""""""""""
autocmd BufWritePre *.{h,c,hpp,cpp,java,py,html,css,js} :%s/\s\+$//e
""""""""""""""""""""