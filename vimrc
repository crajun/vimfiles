" Bootstrapping {{{
scriptencoding utf-8 " because I use multi-byte mac keys below
source $VIMRUNTIME/defaults.vim
source $VIMRUNTIME/ftplugin/man.vim

let vimplug_exists=expand('~/.vim/autoload/plug.vim')
if has('win32') && !has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr 'You have to install curl or first install vim-plug yourself!'
    execute 'q!'
  endif
  echo 'Installing vim-plug into ~/.vim/autoload/plug.vim'
  echo ''
  silent exec '!'curl_exists' -fLo ' . shellescape(vimplug_exists) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  let g:not_finish_vimplug = 'yes'
  autocmd init VimEnter * PlugInstall
endif
"}}}

" Plugins {{{
call plug#begin(expand('~/.vim/plugged'))
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'Raimondi/delimitMate'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'majutsushi/tagbar'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
" let g:make = 'gmake'
" if exists('make')
"   let g:make = 'make'
" endif
" Plug 'Shougo/vimproc.vim', {'do': g:make}
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}
Plug 'chriskempson/base16-vim'
"Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
"Plug 'ludwig/split-manpage.vim'
call plug#end()
"}}}

" Plugin settings {{{
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline_left_sep = '▶'
  let g:airline_left_alt_sep = '»'
  let g:airline_right_sep = '◀'
  let g:airline_right_alt_sep = '«'
  let g:airline#extensions#branch#prefix = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol = 'ρ'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
endif

let g:airline_theme = 'minimalist'
let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline#extensions#virtualenv#enabled = 1

let g:session_directory = '~/.vim/session'
let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:session_command_aliases = 1

nnoremap <Leader>o :TagbarToggle<CR> let g:tagbar_autofocus = 1
"}}}

" Builtin settings {{{
set autoread
set belloff=all
set complete-=i
set completeopt=menuone,noinsert,noselect
set directory=~/.vim/swapdir
set hidden
set hlsearch
set foldnestmax=2
set ignorecase smartcase
set laststatus=2
set mouse=a
set mousemodel=popup
set noswapfile
set nowrap
set number relativenumber
set spelllang=en_ca
set splitbelow splitright
set swapfile
set undofile
set undodir=~/.vim/undodir
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_sizestyle='h'
let g:netrw_winsize=15

if has('gui') || has('xterm_clipboard')
" Use clipboard register '*' for all that would normal go to default unnamed
" register '"'. Explicitly specifying a register overrules this setting.
" Unnamedplus is second option, which is used if has('unnamedplus') is true
" (+X11 feature). With unnamed also mentioned, this will copy text into '*' as
" well, so in two places.
  set clipboard=unnamed,unnamedplus
  " Yank to unnamedplus register, (or if it doesn't exist (no X11) and you have
  " clipboard set to 'unnamed,unnamedplus' also copies to the '*' register.
  noremap YY "+y<CR> noremap <leader>p "+gP<CR> noremap XX "+x<CR>
endif

let python_highlight_all = 1
"}}}

" Tool Integrations {{{
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

"}}}

" Key bindings {{{
let mapleader=' '
let maplocalleader='\'

" Center the screen on the jump to the next find result
nnoremap n nzzzv
nnoremap N Nzzzv
" Re-select visually selected area after indenting/dedenting
vmap < <gv
vmap > >gv
" Move visual selection up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
nnoremap <silent><F3> :call utils#ToggleQuickfixList()<CR>
nnoremap <silent><F4> :call utils#ToggleLocationList()<CR>
nnoremap <silent><F5> :silent! make % <bar> copen <bar> silent redraw!<CR>
nnoremap <silent><F6> :15Lexplore<CR>
nnoremap <silent><F8> :TagbarToggle<CR>
nnoremap <F9> :set list!<CR>
nnoremap <F10> :set spell!<CR>
nnoremap <silent><Leader>tn :tabnew<CR>
nnoremap <Leader>w :update<CR>
nnoremap <Leader>h :hide<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>n :nohlsearch<CR>
nnoremap <Leader>, :edit $MYVIMRC<CR>
nnoremap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/'.&ft.'.vim')<CR><CR>
nnoremap <Leader>` :terminal<CR>
nnoremap <Leader>m :terminal ++open make<CR>
tnoremap <Esc> <C-\><C-n> tnoremap <C-v><Esc> <Esc>
"}}}

" Autocmds {{{
augroup init
  autocmd!
augroup END
autocmd init BufNewFile,BufRead *.txt,*.md,*.adoc setlocal complete+=k
autocmd init BufWinEnter */doc/*.txt setlocal nonumber norelativenumber
autocmd init BufWritePre /tmp/* setlocal noundofile
autocmd init BufWritePost ~/.vim/vimrc source ~/.vim/vimrc
autocmd init FileType * if &ft ==# 'qf' | set nonu nornu | endif
autocmd init QuickFixCmdPost [^l]* cwindow
autocmd init QuickFixCmdPost  l* lwindow
autocmd init VimEnter * cwindow
"}}}

" Commands {{{
command! Api :vertical h function-list<CR> 
command! API :vertical h function-list<CR> 
command! Cd :cd %:h
command! LocalTodo :botright lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR> 
command! Only :.+,$bwipeout<CR> 
command! Todo :botright silent! vimgrep /\v\CTODO|FIXME|HACK|DEV/ **<CR>
"}}}

" UI {{{
colorscheme base16-github
"}}}

" Playground {{{
if has('mac') 
  nnoremap ∆ <C-w>p<C-e><C-w>p 
  nnoremap ˚ <C-w>p<C-y><C-w>p 
  nnoremap Ô <C-w>p<C-d><C-w>p 
  nnoremap  <C-w>p<C-u><C-w>p
endif
"}}}
