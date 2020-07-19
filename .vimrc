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

" latex
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" plugins
Plugin 'tek256/simple-dark'
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'lilydjwg/colorizer'
Plugin 'rhysd/committia.vim'

Plugin 'ycm-core/YouCompleteMe'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_key_list_select_completion = ['<Tab>']
let g:ycm_key_list_previous_completion = []

Plugin 'SirVer/ultisnips' " snippet engine
Plugin 'honza/vim-snippets' " snippets
" snippets: trigger config
let g:UltiSnipsExpandTrigger="<s-tab>"

Plugin 'airblade/vim-gitgutter' " show changes in vim
Plugin 'chrisbra/Colorizer' " color hex codes accordingly

Plugin 'scrooloose/nerdtree' " file tree
nnoremap <C-t> :NERDTree<CR>
let g:NERDTreeShowHidden=1
let g:NERDTreeSortHiddenFirst=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif " autoclose

Plugin 'mhinz/vim-startify' " neat start menu
let g:startify_files_number = 40

Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

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
