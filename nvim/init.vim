set mouse=a
set autowrite
set noswapfile
set nowritebackup
set hidden
set number
set inccommand=nosplit
set colorcolumn=80,120
set ignorecase
set smartcase
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000
let g:powerline_pycmd = 'py3'
let g:powerline_pyeval = 'py3eval'


call plug#begin('~/.config/nvim/plug')

let g:ale_javascript_eslint_executable = expand('~/.npm/bin/eslint')
let g:airline_powerline_fonts = 1

" linters
Plug 'w0rp/ale'

" aesthetics
Plug 'Adryd/vim-adryd-monokai'
Plug 'Dru89/vim-adventurous'
"Plug 'vim-airline/vim-airline'

" language support
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
"Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'


Plug 'rakr/vim-one' 
"Plug 'scrooloose/nerdtree'
call plug#end()


py3 import sys


" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

set rtp+=$HOME/Library/Python/3.6/lib/python/site-packages/powerline/bindings/vim

let g:powerline_pycmd = 'py3'
let g:powerline_pyeval = 'py3eval'

set termguicolors
set background=dark
let g:gruvbox_italic=1
colorscheme one

let g:mapleader = ' '
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>pi :PlugInstall<CR>
nnoremap <silent> <leader>pu :PlugUpdate<CR>
nnoremap <silent> <leader>pg :PlugUpgrade<CR>
nnoremap <silent> <leader>sv :source $MYVIMRC<CR>

nnoremap <silent> <C-L> :noh<CR>
nnoremap <silent> <A-[> :bp<CR>
nnoremap <silent> <A-]> :bn<CR>
" macos's default keyboard layout's option key outputs special characters
" when the option key is held, and macos's alt key is option -- account for
" that here
nnoremap <silent> ‘ :bn<CR>
nnoremap <silent> “ :bp<CR>
cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev Qa qa

autocmd BufNewFile,BufRead *.go setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
autocmd TermOpen * setlocal nonumber
