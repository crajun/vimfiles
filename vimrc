" vi:sw=2:et:tw=120
" Author: C.D. MacEachern <craigm@fastmail.com>
" Description: vim 8.0+ config (requires +packages)

" -------------------------
" Needed First
" -------------------------
source $VIMRUNTIME/defaults.vim

" Add autocmds to this group to avoid resourcing problems.
augroup vimrc
  autocmd!
augroup END

let mapleader = ' '
let maplocalleader = "\\"

" -------------------------
" Packages and Settings
" -------------------------
packadd minpac

if v:version >= 802
  set completeopt=menuone,noinsert,noselect,popup
else
  set completeopt=menuone,noinsert,noselect,preview
endif

call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})
command! PackUpdate source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  source $MYVIMRC | call minpac#clean()
command! PackStatus source $MYVIMRC | call minpac#status()

" UI
call minpac#add('gruvbox-community/gruvbox')

" Basics
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('sgur/vim-editorconfig')
call minpac#add('tpope/vim-dispatch')
call minpac#add('wellle/targets.vim')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-fugitive')
" Matches default with 'ruler' on, from fugitive docs
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P
" g? in any of Fugitive windows to see applicable keymaps for that window.
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>ga :Git add -A<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gg :Git commit --all<CR>
nnoremap <Leader>gp :Git push<CR>
call minpac#add('michaeljsmith/vim-indent-object')

" Life Upgrades
call minpac#add('junegunn/fzf')
let g:fzf_layout = { 'down': '40%' }
call minpac#add('junegunn/fzf.vim')
nnoremap <C-p> :FZF<CR>
" this is how terminal vim sees alt+p keypress (:help i_C-v)
nnoremap <Esc>p :Buffers<CR>
call minpac#add('lifepillar/vim-mucomplete')
let g:mucomplete#enable_auto_at_startup = 1

" TODO: candidate to remove and replace with easier maintenance via sh script or tpope method
call minpac#add('ludovicchabant/vim-gutentags')
" uses all &wildignore by default, plus what is here
let g:gutentags_ctags_exclude=["node_modules/", "*.json", "Session.vim", "*.md", "*.txt", "*.adoc"]

" Filetypes / Syntax
call minpac#add('yuezk/vim-js', {'type': 'opt'})
call minpac#add('maxmellon/vim-jsx-pretty', {'type': 'opt'})

" -------------------------
" Non-Plugin Mappings
" -------------------------

" In command line mappings we can't use Tab so wcm needs to used in place of it
" Essentially, whenever I see <C-z> read it as hitting <Tab> key
set wildcharm=<C-z>

" change to current buffer directory
command! Cd :cd %:h

nnoremap <Leader>ev :edit $MYVIMRC<CR>
nnoremap <Leader>sv :source $MYVIMRC<CR>

" use %% in command-line to autoexpand to current buf directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" :edit mappings
" nnoremap <Leader>e :<C-u>e<space><C-z><S-Tab>
" Remaps C-p to do the above as a convenience
" nmap <C-p> <Leader>e
" " Do :edit from current file folder
" nnoremap <Leader>E :<C-u>e <C-r>=fnameescape(expand('%:p:h')).'/'<CR><C-z><S-Tab>

" :find mappings
" * Like :edit but uses value of 'path',
" * keep value of 'pwd' at project root to get find-in-project results
" nnoremap <Leader>f :<C-u>find<space><C-d>
" " Like above, but use current file directory as starting point
" nnoremap <Leader>F :<C-u>find <C-r>=fnameescape(expand('%:p:h')).'/'<CR><C-d>
" nnoremap <Leader>s :<C-u>sfind<space><C-d>
" nnoremap <Leader>S :<C-u>sfind <C-r>=fnameescape(expand('%:p:h')).'/'<CR><C-d>
" nnoremap <Leader>v :<C-u>vert sfind<space><C-d>
" nnoremap <Leader>V :<C-u>vert sfind <C-r>=fnameescape(expand('%:p:h')).'/'<CR><C-d>

" :tabedit/tabfind mappings
" nnoremap <Leader>t :<C-u>tabedit <C-z><S-Tab>
" nnoremap <Leader>T :<C-u>tabfind <C-r>=fnameescape(expand('%:p:h')).'/'<CR><C-d>

" :buffer mappings
" * Prefer <C-d> to wildmenu here because it allows fuzzy matching typing
" nnoremap <Leader>b :<C-u>buffer <C-d>
" nnoremap <Leader>B :<C-u>sbuffer <C-d>

" Function keys
nnoremap <silent><F3> :call utils#ToggleQuickfixList()<CR>
nnoremap <silent><F4> :call utils#ToggleLocationList()<CR>
nnoremap <F5> :silent make % <bar> silent redraw!<CR>
nnoremap <F6> :15Lexplore<CR>
nnoremap <F9> :set list!<CR>
nnoremap <F10> :set spell!<CR>

" Buffers/Windows
nnoremap <Leader>w :<C-u>update<CR>
nnoremap <Leader>l :<C-u>b #<CR>

" Edit current buffer filetype in after/ftplugin/
nnoremap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/'.&ft.'.vim')<CR><CR>

" Symbol Navigation (see vimways.org/2018 romainl article)
nnoremap <Leader>ij :<C-u>ijump <C-r><C-w>
nnoremap <Leader>is :<C-u>isearch
nnoremap <Leader>il :<C-u>ilist <C-r><C-w>

" 'define' commands are more precise as they search for the
" text matching 'define' (e.g. 'def') plus the argument,
" whereas 'include' commands simple search for the argument
nnoremap <Leader>dj :<C-u>djump <C-r><C-w>
nnoremap <Leader>ds :<C-u>dsearch
nnoremap <Leader>dl :<C-u>dlist

" Tag jumping
nnoremap <Leader>tj :<C-u>tjump<space>
nnoremap <Leader>tp <C-w>}
"
" jump to tag or present options if ambiguous
nnoremap <C-]> g<C-]>
" opens in preview window our choice
nnoremap <C-w><C-]> g<C-w><C-]>

" Visual
nnoremap <silent> <C-L> :<C-U>nohlsearch<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>
tnoremap <C-v><Esc> <Esc>

" Command-line
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" -------------------------
" Abbreviations
" -------------------------
" Autoclosing brackets/braces
inoreabbrev (<CR> (<CR>)<Esc>O
inoreabbrev ({<CR> ({<CR>});<Esc>O
inoreabbrev {<CR> {<CR>}<Esc>O
inoreabbrev {; {<CR>};<Esc>O
inoreabbrev {, {<CR>},<Esc>O
inoreabbrev [<CR> [<CR>]<Esc>O
inoreabbrev [; [<CR>];<Esc>O
inoreabbrev [, [<CR>],<Esc>O

" -------------------------
" Options
" -------------------------
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide().'.*\.swp$' | " use gitignore file if available
let g:netrw_sizestyle='h'
set autoread " If file changed on disk, reread it
set autoindent
set hidden
set ignorecase smartcase
set noswapfile nobackup noundofile
set number relativenumber
set laststatus=2
" ',,' means search in current directory
" **2 means limit downward search to 2 folders deep
" '.' means relative to directory of current file, which I don't usually
" use because I keep the value of 'cd' at project root
set path=,,
set path+=**3
set signcolumn=number
" split and vsplit commands always open below and to right, respectively
set splitbelow splitright
" adding '!26' to save 26 global marks, i.e., A - Z, rest is default
set viminfo="'100,!26,<50,s10,h"
set wildignore+=*.jpg,*.jpeg,*.bmp,*.ico,*.so,*.dll,*.o,*.obj,*.zip
set wildignore+=*/.git/*,*/node_modules/*,*/.hg/*,*/.svn/*
set wildignore+=.venv/

if v:version >= 800
  packadd! matchit
  set belloff=all | " Turn off bell ring for all events
  set termguicolors " Use true colours if terminal supports it
  set breakindent | " Every wrapped line continues visual indent
  set shortmess+=c
  if has('patch-8.1.0360')
    " better vimdiff experience with patience algorithm
    set diffopt+=internal,algorithm:patience
  endif
  if v:version >= 802
    packadd! cfilter
  endif
endif

if executable('rg')
  set grepprg=rg\ --vimgrep
  set grepformat=%f:%l:%c:%m
elseif executable('ag')
  set grepprg=ag\ --vimgrep\ --hidden\ --ignore-dir=.git/\ $*
  set grepformat=%f:%l:%c:%m
endif

" -------------------------
" Autocommands
" -------------------------
autocmd vimrc BufWritePre /tmp/* setlocal noundofile
autocmd vimrc QuickFixCmdPost [^l]* cwindow
autocmd vimrc QuickFixCmdPost  l* lwindow

" -------------------------
" Commands
" -------------------------
" TODO: move these to user autoload folder
command! Todo :silent! vimgrep /\v\CTODO|FIXME|HACK|DEV/ **<CR>
command! LocalTodo :lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>

" -------------------------
" Needed Last
" -------------------------
" Read in saved viminfo to registers/marks/oldfiles/etc. Stored in ~/.viminfo
rviminfo!
" Ignore errors and read in all doc/ files in &rtp to update help files.
silent! helptags ALL
" Set last to make sure it applies after other things may have been done to syntax.
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_italic=0
colorscheme gruvbox
