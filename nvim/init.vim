call plug#begin()

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'rhysd/committia.vim'

Plug 'mhinz/vim-signify'
set updatetime=300

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

call plug#end()

set number relativenumber
set colorcolumn=80

set undofile
set undolevels=1000
set undoreload=10000

" navigate tabs with H and L
nnoremap H gT
nnoremap L gt
