" vim: fdm=indent nowrap ft=vim et sts=2 ts=2 sw=2
" vimrc for 8.2+
" macOS/Linux/BSD/WSL do:
" git clone https://github.com/k-takata/minpac ~/.vim/pack/minpac/opt/minpac

" Bare-basics.
filetype plugin on " enable loading plugin/foo.vim files for all filetypes
filetype indent on " enable loading indent/foo.vim files for all filetypes
syntax on
set encoding=utf-8
scriptencoding utf-8
let mapleader=' '

" Plugins
packadd minpac
if !exists('g:loaded_minpac')
  " minpac is not available.
  echoerr 'First clone k-takata/minpac ~/.vim/pack/minpac/opt/minpac'
  finish
else
  " 2: (Default) Show error messages from external commands.
  " 3: Show start/end messages for each plugin.
  " 4: Show debug messages.
  call minpac#init({'verbose': 2, 'progress_open': 'vertical'})
  call minpac#add('k-takata/minpac', {'type': 'opt'})
  call minpac#add('tpope/vim-scriptease', {'type': 'opt'})
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-endwise')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('wellle/targets.vim')
  call minpac#add('michaeljsmith/vim-indent-object')
  call minpac#add('tpope/vim-projectionist')
  call minpac#add('tpope/vim-dispatch')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('lifepillar/vim-solarized8')
  call minpac#add('cormacrelf/vim-colors-github')
  call minpac#add('morhetz/gruvbox')
  call minpac#add('vim-airline/vim-airline')
  call minpac#add('vim-airline/vim-airline-themes')
  call minpac#add('junegunn/fzf')
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('dense-analysis/ale')
  call minpac#add('janko-m/vim-test')
  call minpac#add('sgur/vim-editorconfig')
  call minpac#add('ycm-core/YouCompleteMe')
  call minpac#add('christoomey/vim-tmux-navigator')
  call minpac#add('christoomey/vim-tmux-runner')
  call minpac#add('thoughtbot/vim-rspec')
  call minpac#add('sheerun/vim-polyglot')

  command! PackUpdate call minpac#update()
  command! PackClean call minpac#clean()
endif

" https://github.com/christoomey/vim-tmux-navigator
" auto rebalance windows on vim resize
autocmd! VimResized * :wincmd =

" zoom a vim pane, <Leader>= to rebalance
nnoremap <Leader>z :wincmd _<CR>:wincmd \|<CR>
nnoremap <Leader>= :wincmd =<CR>

" https://github.com/thoughtbot/vim-rspec
" TODO: maybe this can be replaced with more generic vim-test?
nmap <Leader>rt :call RunCurrentSpecFile()<CR>
nmap <Leader>rs :call RunNearestSpec()<CR>
nmap <Leader>rl :call RunLastSpec()<CR>
nmap <Leader>ra :call RunAllSpecs()<CR>

" https://github.com/dense-analysis/ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'vim': ['vint'],
\ }
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" https://github.com/janko-m/vim-test
let test#strategy = 'dispatch'

" Settings
set autoindent
set autoread
set backspace=indent,eol,start
set belloff=all
set clipboard=unnamed,unnamedplus
set completeopt=menuone,popup
set foldlevelstart=99
set hidden
set history=200
set hlsearch
if executable('rg')
  set grepprg=rg\ --vimgrep
elseif executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif
set incsearch
set laststatus=2
set listchars=eol:$,space:·,
set modeline
set mouse=a
set noswapfile
set nrformats-=octal
set number
set path-=/usr/include
set path+=**10
set relativenumber
set ruler
set scrolloff=2
set showcmd
set showmatch
set showmode
set smartcase
set tags=./tags;,tags;

if exists('+termguicolors')
  " https://github.com/tmux/tmux/issues/1246
  " Without 2 t_8x lines below termguicolors doesn't work.
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
set ttimeout
set ttimeoutlen=100
set wildignore=*/.git/*,*/.hg/*,*/.svn/*,*/.node_modules/*,*.o,*.obj
set wildmenu
set wildmode=list:longest,longest:full

let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_sizestyle='h'
let g:netrw_winsize=15
let g:netrw_list_hide=netrw_gitignore#Hide() . '.*\.swp$'

" Don't use Ex mode, use Q for formatting instead.
map Q gq
" Re-select visually selected area after indenting/dedenting.
xmap < <gv
xmap > >gv
" Move visual selection up/down lines.
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv
" '%%' in command-line mode maybe expands to path of current buffer.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

nnoremap <F3> :call utils#ToggleQuickfixList()<CR>
nnoremap <F4> :call utils#ToggleLocationList()<CR>
nnoremap <F5> :silent! make % <bar> copen <bar> silent redraw!<CR>
" nnoremap <F6> :15Lexplore<CR>
nnoremap <F9> :set list!<CR>
nnoremap <F10> :set spell!<CR>

nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>, :edit $MYVIMRC<CR>
nnoremap <Leader>t :e <C-R>=expand('~/.vim/after/ftplugin/'.&ft.'.vim')<CR><CR>

nnoremap <Leader>l :ALELint<CR>
nnoremap <Leader>n :<C-u>nohl<CR>
nnoremap <Leader>b :<C-u>Buffers<CR>
" nnoremap <Leader>* 
nnoremap <Leader><Leader> :b #<CR>

" Grepping
nnoremap <Leader>/ :grep<Space>
cnoremap grep Grep
command! -nargs=+ -bar Grep :silent! grep! <args>|redraw!

" smaller case does buffer-local, uppercase is project wide
nnoremap <Leader>T :<C-u>Tags<Space>
nnoremap <Leader>t :<C-u>BTags<Space>
nnoremap <Leader>g :<C-u>BCommits<CR>
nnoremap <Leader>G :<C-u>Commits<CR>
nnoremap <C-p> :<C-u>FZF<CR>

nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>ga :Git add -A<CR>
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gg :Git commit --all<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gd :Gvdiffsplit<CR>
nnoremap gh :diffget //2<CR>
nnoremap gl :diffget //3<CR>

" Terminal
tnoremap <C-v><Esc> <Esc>

if has('mac') && has('gui_running')
  " macvim GUI
  set macmeta
  nnoremap ê <C-w>p<C-e><C-w>p
  nnoremap ë <C-w>p<C-y><C-w>p
  nnoremap Ê <C-w>p<C-d><C-w>p
  nnoremap Ë <C-w>p<C-u><C-w>p
elseif has('mac')
  " iterm2
  " TODO: rebind iterm2 Command-J etc. to do this instead, easier to reach.
  nnoremap j <C-w>p<C-e><C-w>p
  nnoremap k <C-w>p<C-y><C-w>p
elseif has('win64') && has('gui_running')
  " gVim 64-bit: 'win32' also returns 1
  nnoremap ê <C-w>p<C-e><C-w>p
  nnoremap ë <C-w>p<C-y><C-w>p
  nnoremap Ê <C-w>p<C-d><C-w>p
  nnoremap Ë <C-w>p<C-u><C-w>p
elseif !has('gui') && !has('gui_running')
  " Use Esc (^[) for terminal emulators for Alt support, e.g.
  " bash-for-windows/mintty terminal/other term emulators
  nnoremap j <C-w>p<C-e><C-w>p
  nnoremap k <C-w>p<C-y><C-w>p
  nnoremap J <C-w>p<C-d><C-w>p
  nnoremap K <C-w>p<C-u><C-w>p
endif

augroup vimrc
  autocmd!
augroup END

" Textfiles, vimrc files
autocmd vimrc BufNewFile,BufRead *.txt,*.md,*.adoc setlocal complete+=k
autocmd vimrc BufNewFile,BufRead *.txt,*.md,*.adoc setlocal tw=78
autocmd vimrc BufWinEnter */doc/*.txt setlocal nonumber norelativenumber
if has('win64')
  autocmd vimrc BufWritePost ~/vimfiles/vimrc source ~/vimfiles/vimrc
else
  autocmd vimrc BufWritePost ~/.vim/vimrc source ~/.vim/vimrc
endif
autocmd vimrc BufWritePre /tmp/* setlocal noundofile

" Quickfix/Location List
autocmd vimrc FileType * if &ft ==# 'qf' | setlocal nonu nornu | endif
autocmd vimrc QuickFixCmdPost [^l]* cwindow
autocmd vimrc QuickFixCmdPost  l* lwindow
autocmd vimrc VimEnter * cwindow
if (v:version >=# 802)
  packadd! cfilter
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd vimrc BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
autocmd vimrc BufNewFile,BufRead *.patch set filetype=diff

" Remember the positions in files with some git-specific exceptions.
autocmd vimrc BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$")
  \           && &filetype !~# 'commit\|gitrebase'
  \           && expand("%") !~ "ADD_EDIT.patch"
  \           && expand("%") !~ "addp-hunk-edit.diff" |
  \   exe "normal g`\"" |
  \ endif

" Getting Help Easier
nnoremap <F1>f :help list-functions<CR>
nnoremap <F1>k :help keycodes<CR>
command! Api :help list-functions<CR>

command! Cd :cd %:h
command! TodoLocal :botright lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! Only :.+,$bwipeout<CR>
command! Todo :botright silent! vimgrep /\v\CTODO|FIXME|HACK|DEV/ *<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig"
if !exists(':DiffOrig')
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
  \ | wincmd p | diffthis
endif

colorscheme gruvbox
