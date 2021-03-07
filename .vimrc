set nocompatible
filetype off

set hlsearch
set number relativenumber
set nu rnu
set smartindent
set tabstop=4
set shiftwidth=4

" make my code nice and slim
set colorcolumn=80

" smart case
set ignorecase
set smartcase

" undo file
set undofile
set undolevels=1000
set undoreload=10000

" auto reload
set autoread

" save unwritten buffers
set hidden

" shorten things
set shortmess=atI

" unite the clipboards
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
endif

" dont make comments so sticky
set formatoptions-=r

" lists
set formatoptions+=n

" comments on line joins
set formatoptions+=j

" ignore my slow fingers
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qa! qa!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa

" navigate tabs with shift
nnoremap H gT
nnoremap L gt

"tab management with t leader
nnoremap tn :tabnew<CR>
nnoremap tq :tabclose<CR>

syntax on

" move through wrapped lines as if they were individual lines
map j gj
map k gk

" execute project-specific vimrc
set exrc
set secure

" plugins
call plug#begin('~/.vim/plugged')
" commands to surround things with punctuation e.g. parentheses
Plug 'tpope/vim-surround'
" commands comment out lines and regions
Plug 'tpope/vim-commentary'
" colorize hex codes and other color specifications
Plug 'lilydjwg/colorizer'
" display commit contents and diffs while writing commit messages
Plug 'rhysd/committia.vim'
" grab bag of latex improvements
Plug 'lervag/vimtex'

" completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" snippet engine
Plug 'SirVer/ultisnips'
" snippet collection
Plug 'honza/vim-snippets'
" snippets: trigger config
let g:UltiSnipsExpandTrigger="<s-tab>"
" show changed lines
Plug 'airblade/vim-gitgutter'

call plug#end()

filetype plugin indent on
