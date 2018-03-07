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

call plug#begin('~/.config/nvim/plug')

let g:ale_javascript_eslint_executable = expand('~/.npm/bin/eslint')
let g:airline_powerline_fonts = 1

" linters
Plug 'w0rp/ale'

" aesthetics
Plug 'Adryd/vim-monokai/'
Plug 'Dru89/vim-adventurous'
Plug 'vim-airline/vim-airline'

" language support
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
"Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
"Plug 'othree/yajs.vim' 
"Plug 'aothree/es.next.syntax.vim'
"Plug 'jelera/vim-javascript-syntax'


Plug 'rakr/vim-one' 
Plug 'scrooloose/nerdtree'
call plug#end()

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
