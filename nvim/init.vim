call plug#begin()

Plug 'freddiehaddad/base16-nvim'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'rhysd/committia.vim'

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = { "c", "rust", "lua", "vim", "vimdoc", "query" },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,
            additional_vim_regex_highlighting = false,
    },
}
EOF

Plug 'mhinz/vim-signify'
set updatetime=300

Plug 'neoclide/coc.nvim', { 'branch': 'release' }

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

call plug#end()

" set colorscheme and highlights
colorscheme base16-default-dark
hi TabLine ctermfg=White ctermbg=Black
hi TabLineFill ctermfg=White ctermbg=Black
hi TabLineSel ctermfg=Black ctermbg=White
hi StatusLine ctermfg=White ctermbg=Black
hi ColorColumn ctermbg=DarkGray
hi LineNrAbove ctermfg=DarkGray
hi LineNr ctermfg=White
hi LineNrBelow ctermfg=DarkGray
hi Comment ctermfg=Gray

set expandtab
set shiftwidth=4

set number relativenumber
set colorcolumn=80

set undofile
set undolevels=1000
set undoreload=10000

" navigate tabs with H and L
nnoremap H gT
nnoremap L gt
