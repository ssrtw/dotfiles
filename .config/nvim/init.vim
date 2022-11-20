" Packer插件管理
colorscheme nordfox
lua require('plugins')
lua require('keybindings')
lua require('plugin-config/cmp')
lua require('nvim-tree').setup()
lua require("symbols-outline").setup()

lua require('plugin-config/startup')
lua require('plugin-config/indent')
lua require('plugin-config/bufferline')

" utf-8 byte sequence.
set encoding=utf-8

set mouse=r
set number
set smarttab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set nocompatible                " be iMproved"
set list listchars=tab:\¦\ |
set autoindent                  " set auto-indenting on for programming"
set expandtab
set showcmd                     " show the typing command"
set ttyfast

"set smartindent
autocmd FileType python setlocal expandtab sw=4 softtabstop=4
" Some servers have issues with backup files, see #649.
set nobackup
set noswapfile
set nowritebackup

" autocmd FileType c,cpp setlocal equalprg=clang-format

" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><C-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><C-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

vnoremap <silent><A-Down> :'<,'>move '>+1 \| normal! gv<CR>
vnoremap <silent><A-Up> :'<,'>move '<-2 \| normal! gv<CR>
