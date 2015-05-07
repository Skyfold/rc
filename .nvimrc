" Author: Nathaniel Young
" vim: foldlevel=0:foldmethod=marker

" ------------------------------------------------------------------------------
" 1 important + packages
" ------------------------------------------------------------------------------

set nocompatible
au!

call plug#begin('~/.vim/plugged')

" Utility plugins
Plug 'tpope/vim-fugitive'
Plug 'benekastah/neomake'
Plug 'vim-scripts/closetag.vim'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jpalardy/vim-slime'

" Unite
Plug 'Shougo/unite.vim'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/vimproc.vim', {'do': 'make'}

" Colour and Style
Plug 'altercation/vim-colors-solarized'
Plug 'w0ng/vim-hybrid'
Plug 'bling/vim-airline'

" Languages
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'vim-pandoc/vim-pandoc', {'for': ['markdown', 'pandoc']}
Plug 'vim-pandoc/vim-pandoc-syntax', {'for': ['markdown', 'pandoc']}
Plug 'shime/vim-livedown', {'for': ['markdown', 'pandoc'], 'do': 'npm install -g livedown'}
Plug 'jceb/vim-orgmode', {'for': 'org'}
Plug 'derekwyatt/vim-scala', {'for': '*scala'}

" Personal plugins
Plug 'mattn/calendar-vim'
Plug 'tpope/vim-speeddating'
Plug 'vim-scripts/vimwiki'

call plug#end()
filetype plugin indent on
syntax on

set confirm
let mapleader='®'


" ------------------------------------------------------------------------------
" 2 moving around, searching and patterns
" ------------------------------------------------------------------------------
" move visually
nnoremap j gj
nnoremap k gk

set ignorecase
set smartcase
set incsearch " live search updates
set hlsearch " hilight search results
set gdefault " set global regex by default

set wildmode=list:longest:full
set wildignore+=*.aux,*.out,*.toc
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest
set wildignore+=*.DS_Store
set wildignore+=*.pyc,*.pyo


" ------------------------------------------------------------------------------
" 3 tags
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" 4 displaying text
" ------------------------------------------------------------------------------
set showmatch " matching parens, etc

set wrap
set linebreak " wrap at 'breakat' chars

" ------------------------------------------------------------------------------
" 5 syntax, highlighting and spelling
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" 6 multiple windows
" ------------------------------------------------------------------------------
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l
if has('nvim')
    nmap <BS> <C-w>h
else
    nmap <C-h> <C-w>h
endif

" splits
noremap <leader>v <C-w>v
noremap <leader>V <C-w>s
set splitbelow
set splitright


" ------------------------------------------------------------------------------
" 7 multiple tab pages
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" 8 terminal
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" 9 using the mouse
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"10 printing
" ------------------------------------------------------------------------------
"  lol

" ------------------------------------------------------------------------------
"11 messages and info
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"12 selecting text
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"13 editing text
" ------------------------------------------------------------------------------
" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround " 'snap' to the sw when doing < and >
set backspace=indent,eol,start
set expandtab

set formatoptions-=t " Do not wrap lines automatically
set formatoptions+=c " Wrap comments automatically
set formatoptions+=r " Allow auto commenting using Enter
set formatoptions+=q " Allow manual formatting
set formatoptions+=n " Recognised numbered lists
set formatoptions+=1 " Don't break after one-letter words
set formatoptions-=mM " Do not wrap multibyte characters
set formatoptions+=j " Automatically join comments when using J

let &formatlistpat='^\s*\d\+\.\s\+\|^[-*+]\s\+' " magic!

" ------------------------------------------------------------------------------
"14 tabs and indenting
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"15 folding
" ------------------------------------------------------------------------------
set foldenable
set foldlevel=10

function! MyFoldText()
  let line = getline(v:foldstart)

  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
  return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction
set foldtext=MyFoldText()

" ------------------------------------------------------------------------------
"16 diff mode
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"17 mapping
" ------------------------------------------------------------------------------
set pastetoggle=<F12>

" ------------------------------------------------------------------------------
"18 reading and writing files
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"19 the swap file
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"20 command line editing
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"21 executing external commands
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"22 running make and jumping to errors
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"23 language specific
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"24 multi-byte characters
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
"25 various
" ------------------------------------------------------------------------------
nnoremap <leader>ev <C-w>s<C-w>j<C-w>L:e $MYVIMRC<cr>
nnoremap <leader>r :source $MYVIMRC<cr>

" ------------------------------------------------------------------------------
"26 plugins
" ------------------------------------------------------------------------------
" slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1

" neomake
autocmd! BufWritePost * Neomake



" Basic options ----------------------------------------------------------- {{{

" Modeline options
set modeline
set modelines=3

" Text wrapping
set shortmess=filmnrxoOtT " Compress short messages
set whichwrap=b,s,h,l,<,>,[,]

" Terminal options
set ttyfast
set lazyredraw
set novisualbell
set hidden " allow having multiple buffers without needing to save
set shell=/bin/bash
set title
set notimeout
set ttimeout
set t_vb=""
set mouse=a
set timeout ttimeout ttimeoutlen=200

" Attempt to reload files
set autoread
set autowrite

" History and backup options
set history=1000
set undofile
set undoreload=10000
set backup

" Really clever stuff
au FocusLost * :wa " Save when losing focus
au VimResized * exe "normal! \<c-w>="
" Resize splits when the window is resized

" Don't use meta-escape
if has('nvim')
   set ttimeout
   set ttimeoutlen=0
endif

" }}}
" Vim UI ------------------------------------------------------------------ {{{

" Show trailing characters and other things
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set showbreak=↪
set fillchars=diff:⣿

" Modeline and command input options
set cursorline
set ruler
set laststatus=2  " always have statusline

" Scroll options
set scrolljump=5
set scrolloff=3

set colorcolumn=+1

" }}}
" Text editing and formatting --------------------------------------------- {{{

" Text wrapping
set wrap
set textwidth=80
set cpoptions+=J

" Indenting
set autoindent

" }}}
" Colors and Style -------------------------------------------------------- {{{

set background=dark
let g:solarized_contrast="normal"
let g:solarized_visibility="low"
let g:zenburn_high_Contrast = 1
if $WINDOWID == ""
  let g:solarized_termcolors=16
else
  let g:solarized_termcolors=256
end
color hybrid


" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" }}}
" Keymaps ----------------------------------------------------------------- {{{

let mapleader=' '
inoremap jk <ESC>

nnoremap <leader>fs :w<CR>

nnoremap <F1> <nop>
inoremap <F1> <nop>
nnoremap K <nop>

" Easier moving in tabs and windows
" Yank from cursor to end of line, like C and D
nnoremap Y y$

" Clear highlighted searches
nmap <silent> <leader>/ :noh<CR>

" Clean whitespace
map <leader>W  mm:%s/\s\+$//<cr>:let @/=''<CR>`m

" Formatting, TextMate-style
nnoremap Q mmgqip`m

" Substitute
nnoremap <leader>s :%s//<left>

" Copy to secondary selection
nnoremap <leader>y mmggVG"+y`m

" }}}
" Filetypes --------------------------------------------------------------- {{{

" no ft {{{

augroup ft_no_ft_
  au!
augroup end

" }}}
" Haskell {{{

augroup ft_haskell_
  au!

  au Filetype haskell setlocal foldmethod=marker

augroup end

" }}}
" Java {{{

augroup ft_java
  au!

  au Filetype java setlocal tabstop=4
  au Filetype java setlocal softtabstop=4
  au Filetype java setlocal shiftwidth=4
  au Filetype java setlocal noexpandtab
augroup end

" }}}
" org {{{

augroup ft_org
  au!
  au Filetype org setlocal spell
augroup end

" }}}
" Python {{{

augroup ft_python
  au!

  au Filetype python setlocal tabstop=4
  au Filetype python setlocal softtabstop=4
  au Filetype python setlocal shiftwidth=4

augroup end

" }}}
" sls {{{

augroup ft_sls
    au!
    au BufNewFile,BufRead *.sls setlocal filetype=yaml

augroup end

" }}}
" Markdown {{{

augroup ft_markdown
  au!

  au BufNewFile,BufRead *.m*down setlocal filetype=pandoc
  au BufNewFile,BufRead *.md setlocal filetype=pandoc
  au BufNewFile,BufRead *.mkd setlocal filetype=pandoc

  " Use <localleader>1/2/3 to add headings.
  au Filetype markdown nnoremap <buffer> <localleader>1 yypVr=
  au Filetype markdown nnoremap <buffer> <localleader>2 yypVr-
  au Filetype markdown nnoremap <buffer> <localleader>3 I### <ESC>
augroup END

" }}}
" Vim {{{

augroup ft_vim
  au!

  au FileType vim setlocal foldmethod=marker
  au FileType help setlocal textwidth=78
  au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif
augroup END

augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END " }

" }}}

" }}}
" Plugin options ---------------------------------------------------------- {{{

" Haskell

let g:neomake_haskell_enabled_makers = ['hdevtools']

" airline {{{

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme="powerlineish"

" }}}
" closetag {{{

inoremap <C-_> <Space><BS><Esc>:call InsertCloseTag()<cr>a

" }}}
" Fugitive {{{

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gp :Git push<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>

" }}}
" gundo {{{

let g:gundo_auto_preview=0
nnoremap <leader>u :GundoToggle<CR>

" }}}
" hardtime {{{

let g:hardtime_default_on = 1
let g:hardtime_maxcount = 2
let g:hardtime_allow_different_key = 1
let g:hardtime_timeout = 2000

" }}}
" org-mode {{{

let g:org_heading_shade_leading_stars = 0
let g:org_indent = 0
let g:org_tag_column = 80

" }}}
" Neomake {{{
" }}}}
" pandoc {{{

let g:pandoc#formatting#mode = 'ha'  " hard wrap and auto format


" }}}
" Syntastic {{{

let g:syntastic_cpp_compiler_options = ' -std=c++0x'

" }}}
" unite {{{

" Fuzzy match by default
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" Fuzzy matching for plugins not using matcher_default as filter
call unite#custom_source('outline,line,grep,session', 'matchers', ['matcher_fuzzy'])

let g:unite_source_rec_max_cache_files = 0
call unite#custom#source('file_rec,file_rec/async,file_mru,file,buffer,grep',
  \ 'max_candidates', 0)

" Faster update time after keypresses
let g:unite_update_time = 200

" Use ag or ack as grep command if possible
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nocolor --nogroup --hidden --ignore tags'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts =
              \ '--no-heading --no-color -a -H'
  let g:unite_source_grep_recursive_opt = ''
endif

function! g:DoUniteFuzzy()
    call unite#custom#source('file_rec/async,file/new', 'sorters', 'sorter_rank')
    call unite#custom#source('file_rec/async,file/new', 'converters', 'converter_relative_word')
    call unite#custom#source('file_rec/async,file/new', 'matchers', 'matcher_fuzzy')
    exec "Unite -buffer-name=files file_rec/async file/new"
endfunction
function! g:DoUniteNonFuzzy()
    call unite#custom#source('file_rec/async,file/new', 'sorters', 'sorter_nothing')
    call unite#custom#source('file_rec/async,file/new', 'converters', 'converter_relative_word')
    call unite#custom#source('file_rec/async,file/new', 'matchers', 'matcher_glob')
    exec "Unite -buffer-name=files file_rec/async file/new"
endfunction

" Unite Keybindings from Pfalzgraf
" ===================================================

" grep 
nnoremap <space>/ :<C-u>Unite -no-empty grep <CR>

" Yank history 
inoremap <C-Y> <C-O>:<C-u>Unite -start-insert history/yank<CR>
inoremap <C-R> <space><C-O>:Unite -start-insert register<CR>

" Buffer navigation 
nnoremap <silent> <space>b :<C-u>Unite -start-insert -no-split buffer bookmark<CR>

" File navigation 
nnoremap <silent> <space>de :<C-u>UniteWithInputDirectory -start-insert -no-split file <CR>
nnoremap <silent> <space>e :<C-u>UniteWithCurrentDir -start-insert -no-split file_rec/async<CR>
nnoremap <silent> <space>ce :<C-u>UniteWithCurrentDir -start-insert -no-split file directory <CR>

" <space>nite sources 
nnoremap <silent> <space>s :<C-u>Unite -start-insert source<CR>

" lets you're gf search from current dir
noremap <silent> gf :<C-u>UniteWithCursorWord -no-split -start-insert -immediately file_rec file/new directory/new<CR>

" nnoremap <silent> <space>; :<C-u>Unite -here -start-insert command<CR>
" nnoremap <silent> <F1> nop
" nnoremap <silent> <F1>k  :<C-u>Unite mapping<CR>
" nnoremap <silent> <leader>t  :<C-u>Unite file_rec/async -start-insert<CR>
" nnoremap <silent> <leader>lg :<C-u>Unite grep:.<CR>
" " nnoremap <silent> <leader>lo :<C-u>Unite outline<CR>
" nnoremap <silent> <leader>ll  :<C-u>Unite line -start-insert<CR>
" 
" nnoremap <silent> <leader>po :<C-u>Unite file_rec/async:! -start-insert<CR>
" nnoremap <silent> <leader>pg :<C-u>Unite grep:!<CR>

" }}}
" vimfiler {{{

call vimfiler#custom#profile('default', 'context', {
    \ 'auto-cd' : 1,
    \ 'explorer' : 1
    \ })

let g:vimfiler_as_default_explorer = 1

" }}}

" }}}
" Environments (GUI/Console) ---------------------------------------------- {{{

if has('gui_running')
  " set guifont=Tamsyn\ 6
  set guifont=Source\ Code\ Pro\ 7.5
  set guifontwide=Osaka\ Unicode\ 8

  " Make it look like console vim
  set go-=T "no toolbar
  set go-=l "no scrollbars
  set go-=L "no scrollbars always
  set go-=r "no scrollbars too
  set go-=R "you get the picture
  set go-=m "no menu bar
  set go+=c "console dialog please

  highlight SpellBad term=underline gui=undercurl guisp=Orange

  " Use a line-drawing char for pretty vertical splits.
  set fillchars+=vert:│

else
  " Console Vim
  if $COLORTERM == 'screen-256color'
    set t_Co=256
  endif
endif

" }}}
" Functions --------------------------------------------------------------- {{{

function! InitializeDirectories()
  let separator = "."
  let parent = $HOME
  let prefix = '.vim'
  let dir_list = {
              \ 'backup': 'backupdir',
              \ 'views': 'viewdir',
              \ 'swap': 'directory' }

  if has('persistent_undo')
      let dir_list['undo'] = 'undodir'
  endif

  for [dirname, settingname] in items(dir_list)
      let directory = parent . '/' . prefix . dirname . "/"
      if exists("*mkdir")
          if !isdirectory(directory)
              call mkdir(directory)
          endif
      endif
      if !isdirectory(directory)
          echo "Warning: Unable to create backup directory: " . directory
          echo "Try: mkdir -p " . directory
      else
          let directory = substitute(directory, " ", "\\\\ ", "g")
          exec "set " . settingname . "=" . directory
      endif
  endfor
endfunction
call InitializeDirectories()

function! SaveIfNotEmpty()
  let fn = expand('%')
  if fn != ""
    w
  endif
endfunction

command! BootstrapVim call BootstrapVim()
function! BootstrapVim()
  !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  source $MYVIMRC
  PlugInstall!
endfunction

command! W call Wfoo()
function! Wfoo()
    w
endfunction
" }}}
