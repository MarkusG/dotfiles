set nocompatible
filetype off

set hlsearch
set number relativenumber
set nu rnu
set smartindent
set tabstop=4
set shiftwidth=4

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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'

" syntastic
Plugin 'vim-syntastic/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

call vundle#end()
filetype plugin indent on
