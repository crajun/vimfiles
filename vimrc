" vim:set fdm=marker nowrap ft=vim fdl=2 nolist:
" Options {{{1
filetype plugin indent on
syntax on
set encoding=utf-8
scriptencoding utf-8
let mapleader=' '

set autoindent smartindent
set autoread
set autoshelldir | " Requires term that emits OSC 7. VTE based one mostly do.
set backspace=indent,eol,start
set belloff=all
set clipboard=autoselectplus | " mouse visual selection copies to OS clipboard
set complete-=i
set completeopt=menuone,popup
if has('patch-8.1.0360') | set diffopt+=algorithm:patience | endif
set diffopt+=vertical
set display=truncate
set errorformat+=%f | " :cexpr system('cat /tmp/list-o-filenames.txt')
set exrc secure
set foldlevelstart=1 foldopen+=jump
set formatoptions+=j
set grepprg=grep\ -HnriE\ $*
set hidden
set history=10000
set hlsearch incsearch
set ignorecase smartcase
set laststatus=2
set linebreak breakindent showbreak=+
" TODO: use  for git-branch
set listchars=tab:\│\ ,lead:·,trail:▓,eol:↲,precedes:«,extends:»
set modeline modelines=5
set mouse=a
set nolangremap
set noswapfile
set nrformats-=octal
set number relativenumber
set omnifunc=syntaxcomplete#Complete
set path-=/usr/include | set path+=**20
set ruler
set scrolloff=1 sidescrolloff=2
set sessionoptions-=options
set shortmess-=cS
set showcmd showmatch showtabline=2
set splitbelow splitright
set statusline=%f\ %M\ %R\ %H\ %=%{FugitiveStatusline()}\ %Y
set tags=./tags;,tags;
set ttimeout ttimeoutlen=100
" TODO: set titlestring autocmd with changedirectory event
set title
set undofile undodir=~/.vim/undodir
set updatetime=250
set viewoptions-=options
set wildcharm=<C-z>
set wildmenu
set wildignore+=*.exe,*.dylib,%*,*.pyc,*.o,*.obj,*.h,*~,*.bak,*.swp
set wildignore+=*.png,*.jpeg,*.jpg,*.bmp,*.svg,*.gif
set wildoptions=tagfile
" Plugins {{{1
" builtins {{{2
packadd! matchit

let g:markdown_fenced_languages = ['cpp', 'jsx=javascriptreact', 'js=javascript', 'cmake', 'bash=sh', 'json']
let g:markdown_minlines = 1000

" https://github.com/tpope/vim-liquid {{{2
let g:liquid_highlight_types = g:markdown_fenced_languages
"
" https://github.com/preservim/tagbar {{{2
" w Exuberant Ctags and ~/.ctags defining markdown regexs
let g:tagbar_type_liquid = {
	\ 'kinds' : [
		\ 'h:heading',
	\ ],
\ }

" https://github.com/romainl/vim-qf {{{2
let g:qf_mapping_ack_style = 1
let g:qf_auto_quit = 1

" https://github.com/romainl/vim-cool {{{2
let g:CoolTotalMatches = 1

" https://github.com/tpope/vim-fugitive {{{2
nnoremap <Leader>gg <cmd>G<CR>
nnoremap <silent><Leader>ge :Gedit <bar> only<CR>
nnoremap <silent><Leader>gd <cmd>Gvdiffsplit<CR>
nnoremap <Leader>gD :Gvdiffsplit<space>
nnoremap <Leader>g/ :Ggrep! -HnriqE<Space>
nnoremap <Leader>g? :Git! log -p -S %
nnoremap <Leader>g* :Ggrep! -Hnri --quiet <C-r>=expand("<cword>")<CR><CR>
nnoremap <silent><Leader>gP <cmd>G push<CR>
nnoremap <silent><Leader>gp <cmd>G pull<CR>

" Mappings {{{1
nmap <Leader>/ :grep<Space>
nnoremap <Leader>? :noautocmd vimgrep /\v/gj **/*.md<S-Left><S-Left><Right><Right><Right>
nnoremap <Leader>! :Redir<Space>
nnoremap <Leader>yy <cmd>%y +<CR>
nnoremap <Leader>dd <cmd>%d <CR>

" Readline bindings ala Emacs
cnoremap <C-a> <Home>
cnoremap <C-b> <Left>
cnoremap <C-d> <Del>
cnoremap <C-e> <End>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

if has('patch-8.2.4325')
	set wildoptions+=pum
	cnoremap <expr> <C-p> wildmenumode() ? "<C-P>" : "<Up>"
	cnoremap <expr> <C-n> wildmenumode() ? "<C-N>" : "<Down>"
	cnoremap <expr> <C-j> wildmenumode() ? "\<Left>\<C-z>" : "\<C-j>"
	cnoremap <expr> <C-k> wildmenumode() ? "\<Right>\<C-z>" : "\<C-k>"
else
	" wildmenu pops on/off depending on context, so if we rely on it being open
	" sometimes we'll send <C-j> (Enter) causing netrw to open the directory. 
	" Avoid that by not trying to be clever. No-suprises-principle here.
	cnoremap <C-j> <Down>
	cnoremap <C-k> <Up>
endif

nnoremap <Leader>ff :find *
nnoremap <Leader>fs :sfind *
nnoremap <Leader>fv :vert sfind *
nnoremap <Leader>ee :edit *<C-z><S-Tab>
nnoremap <Leader>es :split *<C-z><S-Tab>
nnoremap <Leader>ev :vert split *<C-z><S-Tab>
nnoremap <Leader><Leader> :buffer #<CR>
" buffers not part of :pwd show '/' or '~' at the beginning, so we can remove
nnoremap <Leader>b. :filter! /^\~\\|^\// ls t<CR>:b
nnoremap <Leader>bb :buffer <C-z><S-Tab>
nnoremap <Leader>bd <Cmd>bwipeout!<CR>
nnoremap <Leader>bs :sbuffer <C-d>
nnoremap <Leader>bv :vert sbuffer <C-d>

nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>
nnoremap [Q :cfirst<CR>
nnoremap ]Q :clast<CR>
nnoremap [e :lprevious<CR>
nnoremap ]e :lnext<CR>
nnoremap ]E :llast<CR>
nnoremap [E :lfirst<CR>
nnoremap [a :previous<CR>
nnoremap ]a :next<CR>
nnoremap [A :first<CR>
nnoremap ]A :last<CR>

xmap < <gv
xmap > >gv
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

nnoremap <F2> :call SynGroup()<CR>
nmap <F3> <Plug>(qf_qf_toggle)
nmap <F4> <Plug>(qf_loc_toggle)
nnoremap <F5> :silent! lmake \| redraw!<CR>
nnoremap <F8> :TagbarOpenAutoClose<CR>
nnoremap <F9> :set list!<CR>
nnoremap <Leader>* :grep <cword> *<CR>

nnoremap <Leader>w <cmd>update<CR>
nnoremap <Leader>, <cmd>edit $MYVIMRC<CR>
nnoremap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/'.&ft.'.vim')<CR><CR>
nnoremap <Leader><CR> :source %<CR> <bar> :nohlsearch<CR>

nnoremap gh :diffget //2<CR>
nnoremap gl :diffget //3<CR>

" Neovim backports
nnoremap Q @q
nnoremap Y y$
inoremap <C-U> <C-G>u<C-U>
inoremap <C-W> <C-G>u<C-W>

" Commands {{{1

" Colors {{{1
function! MySolarized() abort
	" Remove underlines
	if &background =~# 'light'
			highlight! TabLine cterm=NONE ctermfg=12 ctermbg=7 gui=NONE guifg=#839496 guibg=#eee8d5
			highlight! TabLineFill cterm=NONE ctermfg=10 ctermbg=7 gui=NONE guifg=#839496 guibg=#eee8d5
			highlight! TabLineSel cterm=reverse gui=reverse guifg=#586e75 guibg=#eee8d5
	else
		" TODO: dark
	endif
		highlight! link CurSearch IncSearch
endfunction

augroup MyColors
	autocmd!
	autocmd ColorScheme solarized8 call MySolarized()
augroup END

if &termguicolors
	let g:solarized_italics=1
else
	let g:solarized_use16=1
endif
let g:solarized_visibility='low'
let g:solarized_extra_hi_groups=1
colorscheme solarized8

" WORKSHOP {{{1

" Usage: tmap <expr> <Esc>]b SendToTerm("\<Esc>]b")
function! s:SendToTerm(what) abort
	call term_sendkeys('', a:what)
	return ''
endfunction

nnoremap <Leader>m :TermMake <C-z><C-p>

function! s:TermMake(target) abort
	" echom 'DEBUG: TermMake called with ' .. a:target
	" BUG: I can't just call 'make <target>' here, because I need
	" the terminal to pick up new PATH variables set in rc files first,
	" otherwise if run like ':term make hbo' if finds macOS system bundler first
	" and tries that.
	" execute "terminal make " .. a:target
	terminal
	call <SID>SendToTerm("make " .. a:target)
endfunction

command! -nargs=? -complete=customlist,<SID>MakeOptions TermMake call <SID>TermMake(<q-args>)

" :h :command-completion-custom
function! s:MakeOptions(ArgLead, CmdLine, CursorPost) abort
	" Returns first string in the list or empty string.
	" TODO: for now I'm hardcoding the ones I want, I'll maybe add parser later.
	return ['hbo', 'next', 'nextnextonly', 'nextnextonly', 'production', 'sky', 'playstation']
endfunction

" Original:
command! -bang -nargs=1 Global call setloclist(0, [], ' ', 
	\ {'title': 'Global ' .. <q-args>,
	\ 'efm': '%f:%l\ %m,%f:%l',
	\ 'lines': execute('g<bang>/' .. <q-args> .. '/#')->split('\n')->map({_, val -> expand("%") .. ":" .. trim(val)})
	\ })

" MINE:
" This line from original causing errors, why?
" Also not able to jump to loclist items with original efm, with this one you can
" \ ->map({_, val -> expand("%") .. ":" .. trim(val, 1)})
" command! -bang -nargs=1 Global call setloclist(0, [], ' ', 
" 	\ {'title': ':Global<bang> ' .. <q-args>,
" 	\ 'efm': '%l\ %m',
" 	\ 'lines': execute('g<bang>/' .. <q-args> .. '/#')->split('\n')
" 	\ })

nnoremap <M-j> :resize +2<CR>
nnoremap <M-k> :resize -2<CR>
nnoremap <M-h> :vertical resize +2<CR>
nnoremap <M-l> :vertical resize -2<CR>


