" General Settings {{{
" ===========================================================

"these two turn off the beeps and screen flashing
autocmd GUIEnter * set vb t_vb=
autocmd VimEnter * set vb t_vb=

set mouse=a             " lets you scroll

set visualbell          " don't beep
set noerrorbells        " don't beep
set nowrapscan

set linespace=10        " just add padding between lines
set t_Co=256            " shouldn't need, but just to make sure
set splitbelow          " new hoz splits go below
set splitright          " new vert splits go right
set notimeout           " don't timeout on mappings

set expandtab
set softtabstop=4       " when hitting <BS>, pretend like a tab is removed, even if spaces
set tabstop=4
set shiftwidth=4
set shiftround          " use a multiple of shiftwidth when indenting with '<' and '>'
set smarttab
set autoindent          " always set outoindenting
set copyindent          " copy the previous indentatino on autoindenting

set ttimeout            " do timeout on terminal key codes
set timeoutlen=100      " timeout after 100 msec
set wmh=0               " minimal height of a window

filetype plugin indent on
set incsearch
set ignorecase
set number              " numberlines
set backspace=2         " sane backsapce

set path=.,,inc,src,/usr/include,/usr/local/include

map q: :q
map Q <Nop>
syntax on
set nocompatible        " be iMproved, required
filetype off            " require
"
" {{{
" NeoBundle {{{1
" ===========================================================
set runtimepath+=~/.vim/bundle/neobundle.vim
call neobundle#begin(expand('~/.vim/bundle/'))
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Movement plugins {{{2
NeoBundle 'kristijanhusak/vim-multiple-cursors'
" function! Multiple_cursors_before()
"     exe 'NeoCompleteLock'
"     echo 'Disabled autocomplete'
" endfunction
"
" function! Multiple_cursors_after()
"     exe 'NeoCompleteUnlock'
"     echo 'Enabled autocomplete'
" endfunction

NeoBundle 'tpope/vim-rsi'                               " :! editing and insert mode

" syntax plugins {{{2
NeoBundle 'vim-pandoc/vim-pandoc'
NeoBundle 'vim-pandoc/vim-pandoc-syntax'
NeoBundle 'vim-pandoc/vim-pandoc-after'
  let g:pandoc#after#modules#enabled = ["nrrwrgn", "neosnippets", "unite", "tablemode"]
  let g:pandoc#command#autoexec_on_writes = 1
  let b:pandoc_command_autoexec_command = "Pandoc pdf"
" NeoBundle 'dhruvasagar/vim-table-mode'                  "  table creator & formatter, :TableModeToggle or <Leader>tm

" Shugo plugins {{{2
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/neocomplete.vim'
" let g:neocomplete#enable_at_startup = 1
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'git://github.com/kmnk/vim-unite-giti.git' " git soruce for unite

" NeoBundle 'Shougo/vimfiler.vim'
"    nnoremap <space>t :VimFilerBufferDir -force-quit -explorer -invisible -toggle -buffer-name='BufferDir' -status <CR><CR>
	" Like Textmate icons.
"	let g:vimfiler_tree_leaf_icon = ' '
"	let g:vimfiler_tree_opened_icon = '▾'
"	let g:vimfiler_tree_closed_icon = '▸'
"	let g:vimfiler_file_icon = '-'
"	let g:vimfiler_marked_file_icon = '*'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'

" snipets
" Track the engine.
" NeoBundle 'SirVer/ultisnips'
" NeoBundle 'honza/vim-snippets'
"   let g:UltiSnipsExpandTrigger="<tab>"
"   let g:UltiSnipsJumpForwardTrigger="<tab>"
"   let g:UltiSnipsJumpBackwardTrigger="<tab>"

" Latex
" NeoBundle 'lervag/vim-latex'

" Haskell
NeoBundle 'dag/vim2hs' " syntax highlighting at more
NeoBundle 'eagletmt/ghcmod-vim' " ghcmod for vim
NeoBundle 'eagletmt/neco-ghc' " Omni completion for Haskell
NeoBundle 'pbrisbin/vim-syntax-shakespeare' " Shakespear Syntax
" NeoBundle 'kana/vim-textobj-indent' " Layout as text object

"typing {{{2
NeoBundle 'thanthese/Tortoise-Typing'

" colorschemes {{{2
NeoBundle 'sickill/vim-monokai'
NeoBundle 'bling/vim-airline'
  set laststatus=2
  let g:airline_powerline_fonts = 1
  let g:airline_theme = "powerlineish"
NeoBundle 'edkolev/tmuxline.vim'

" Web related plugins
" NeoBundle 'mattn/emmet-vim'

" PHP plugins {{{2
" NeoBundle 'm2mdas/phpcomplete-extended-laravel'
" NeoBundle 'm2mdas/phpcomplete-extended'
"  autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

" Tag generation
" NeoBundle 'xolox/vim-misc'            " a dependency
" NeoBundle 'xolox/vim-easytags'

" other plugins
" NeoBundle 'dahu/LearnVim'             " Learn vim the way of the warriorLazy
NeoBundle 'reedes/vim-wordy'          " wordy
NeoBundle 'chrisbra/vim-diff-enhanced' " better diff
" NeoBundle 'tpope/vim-fugitive'
NeoBundle 'christoomey/vim-tmux-navigator'
" NeoBundle 'ahw/vim-hooks'             " Vim-hooks so you can run commands when you save things (and more)
NeoBundle 'vim-scripts/gnupg.vim'     " This lets you decript gpg files in vim and edit them
NeoBundle 'rizzatti/dash.vim'         " documentation the way it was meant
NeoBundle 'chrisbra/NrrwRgn'          " :NR (Visual mode \nr) narrowing on selected text
NeoBundle 'dahu/vimple'
" NeoBundle 'airblade/vim-rooter'       " Makes your current dir the .git file
NeoBundle 'scrooloose/syntastic'      " syntax checking
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
NeoBundle 'scrooloose/nerdtree'
    nmap <space>t :NERDTreeToggle<CR>

" Quick editing
NeoBundle 'tpope/vim-surround' " type ysiw]
    NeoBundle 'tpope/vim-repeat'
NeoBundle 'Lokaltog/vim-easymotion'   " Make motions soo fast
    map s <Plug>(easymotion-s)

" Fuzzy completion for search
NeoBundle 'gelguy/Cmd2.vim'

call neobundle#end()
filetype plugin indent on    " required
NeoBundleCheck

" Autocmd! {{{1
" ==========================================================
augroup reload_vimrc " {
	autocmd!
	autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END " }
autocmd BufNewFile,BufRead *.md set filetype=markdown

" remove all trailing whitespace on buf write for only vim filetypes
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction
autocmd FileType vim autocmd BufWritePre * :call TrimWhiteSpace()
autocmd FileType vim autocmd FileAppendPre * :call TrimWhiteSpace()
autocmd FileType vim autocmd FileWritePre * :call TrimWhiteSpace()
autocmd FileType vim autocmd FilterWritePre * :call TrimWhiteSpace()

" Makes your working directory always the same as the file you are editing
" autocmd BufEnter * silent! lcd %:p:h
" set autochdir (does the same thing, but some plugins may get pissed with it)

" mappings {{{1
" ========================================================
" :w !sudo tee % (very usefull)
nnoremap <Space>d :Dash<CR>

" This is made to debug hilighting issues. The Trans is somehow the trasparent
" group (I think) and the Lo is the general or more broad group that the
" hilighting group belongs to. And hi is the actual group it corosponds to
map <Space>h :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
            \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
            \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

command! StartLog profile start profile.log | profile func * | profile file *
command! EndLog profile pause | noautocmd qall!


" This makes changing spelling errors faster
nnoremap [s [sz=

" Save mapping
nnoremap <C-w> :wa<CR> :echo "All buffers have been saved"<CR>

" Commands
" ========================================================
command! ChangeToCurrentDir cd %:p:h
" relative path
command! YankRelativePath let @+ = expand("%")

" full path
command! YankFullPath let @+ = expand("%:p")

" just filename
command! YankFilename let @+ = expand("%:t")


" split screen navigation
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <BS> <C-W>h

" Unite Keybindings {{{1
" ===================================================

let g:unite_source_history_yank_enable = 1
let g:unite_force_overwrite_statusline = 0
let g:unite_source_rec_max_cache_files = 10000

" Use ag in unite grep source.
if executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
                \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''

    " Using ag as recursive command.
    let g:unite_source_rec_async_command =
        \ 'ag --follow --nocolor --nogroup --hidden -g ""'
endif


" grep {{{2
nnoremap <space>/ :<C-u>Unite -no-empty grep <CR>

" Yank history {{{2
nnoremap <space>r :<C-u>Unite -start-insert register<CR>
nnoremap <space>y :<C-u>Unite -start-insert history/yank<CR>

" Buffer navigation {{{2
nnoremap <silent> <space>b :<C-u>Unite -start-insert -no-split buffer bookmark<CR>

" File navigation {{{2
nnoremap <silent> <space>pe :<C-u>UniteWithInputDirectory -start-insert -no-split file <CR>
nnoremap <silent> <space>e :<C-u>UniteWithCurrentDir -start-insert -no-split file_rec/async<CR>

" <space>nite sources {{{2
nnoremap <silent> <space>s :<C-u>Unite -start-insert source<CR>

" lets you're gf search from current dir
noremap <silent> gf :<C-u>UniteWithCursorWord -no-split -start-insert -immediately file_rec file/new directory/new<CR>

nnoremap <silent> <space>; :<C-u>Unite -here -start-insert command<CR>

" neocomplete stuff {{{1
" ===========================================================


set hidden

" ======================================================
" ======================================================
" Pandoc stuff
" nnoremap <space>po :! open -a /Applications/Skim.app %.pdf<CR><CR>
" nnoremap <Leader>sp :setlocal spell! spelllang=en_us<CR>
" nnoremap <Leader>ss :UltiSnipsEdit<CR>

" =====================================================
" system clipboard
" vmap <Leader>y "+y
" vmap <Leader>d "+d
" nmap <Leader>yy "+yy
" nmap <Leader>p "+p
" nmap <Leader>P "+P
" vmap <Leader>p "+p
" vmap <Leader>P "+P

" To ignore NeoBundle indent changes, instead use:
"filetype NeoBundle on
"
" Brief help
" :NeoBundleList       - lists configured NeoBundles
" :NeoBundleInstall    - installs NeoBundles; append `!` to update or just :NeoBundleUpdate
" :NeoBundleSearch foo - searches for foo; append `!` to refresh local cache
" :NeoBundleClean      - confirms removal of unused NeoBundles; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-NeoBundle stuff after this line
colorscheme monokai
