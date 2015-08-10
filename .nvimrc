" Plugins
call plug#begin('~/.nvim/plugged')

Plug 'jceb/vim-orgmode', { 'for' : 'org' }
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/Solarized'
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }

call plug#end()

" General settings
syntax on
map Q <Nop>
set number

" Colors
let g:solarized_termcolors=256
if strftime("%H") < 12
    set background=dark
    colorscheme solarized
else
    set background=light
    colorscheme solarized
endif

" Normal Settings
filetype plugin indent on " for org mode
set splitbelow          " new hoz splits go below
set splitright          " new vert splits go right
set expandtab
set softtabstop=4       " when hitting <BS>, pretend like a tab is removed, even if spaces
set tabstop=4
set shiftwidth=4
set shiftround          " use a multiple of shiftwidth when indenting with '<' and '>'
set smarttab
set autoindent          " always set outoindenting
set copyindent          " copy the previous indentatino on autoindenting

" split screen navigation
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

nnoremap j gj
nnoremap k gk

augroup reload_vimrc
	autocmd!
	autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

set hidden          " Let you switch buffers without saving

let mapleader = ","

" create buffer with word under cursor
map <leader>gf :vsplit <cfile><cr>
