" vi: ft=vim:et:fdm=marker
" Author: C.D. MacEachern <craigm@fastmail.com>
" Description: vim 8.0+ config

" Bootstrap {{{
source $VIMRUNTIME/defaults.vim

let mapleader=' '
let maplocalleader='\'

" TODO: refactor to remove this.
" I put them autocmds into this 'init' group rather than create a ton of groups
augroup init
  autocmd!
augroup END

set autoread
set complete-=i | " Don't search includes.
set completeopt=menuone,noinsert,noselect
set hidden
set foldnestmax=2
set ignorecase smartcase
set noswapfile
set nowrap
set number relativenumber
set signcolumn=yes
set splitbelow splitright
set termguicolors
set thesaurus=~/.vim/thesaurus/english.txt
set undofile
set undodir=~/.vim/undodir
set wildignore+=*.o,*.obj,*.pyc,*.pyd,*.dll
set wildignore+=*.exe,*.bin,*.zip
set wildignore+=*.bmp,*.jpg,*.jpeg,*.svg,*.png

" Plugin variables
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_sizestyle='h'
let g:netrw_winsize=15
" " }}}

" Whitespace Explanations. Because I forget. {{{
" Number of spaces <Tab> counts for. Whether 1 tab byte 0x09 will be replaced
set tabstop=8
" Governs how much to indent (e.g., >> command)
" Whether it uses spaces or tab character is up to a few settings:
"   * if 'noexpandtab': tries to use tab bytes (\x09) alone. It will use
"   spaces as needed if the result of tabstop / shiftwidth is not 0.
"   * if 'expandtab': only use space bytes.
" Unless you want mixed tab and space bytes (THE HORROR.) if you set
" tabstop and shiftwidth to different values that are non equally divisible,
" use 'expandtab'.
set shiftwidth=8
" Rounds indenting actions to a multiple of 'shiftwidth' if this is on.
set noshiftround
" Number of spaces that tab byte \x09 counts for when doing edits like
" when pressing <Tab> or <BS>. It uses a mix of space \x020 and tab
" \x09 bytes. Useful to keep tabstop at 8 while being able to add tabs
" and delete like it is set to softtabstop (insert/remove that many
" whitespaces, made up of space and tab characters).
"  * if 'noexpandtab': number of \x020 (space) bytes are minimized by
"  inserting as many \x09 (tab) bytes as possible.
set softtabstop=0
" Don't use space bytes \x020 to make up tab \x09 bytes, use real tabs.
" Technically small filesizes with tab characters, but with minification
" on most web/code now being popular, this doesn't matter as much.
set noexpandtab
" Do not copy indent from current line when starting new line: <CR>,o,O
set noautoindent
" }}}

" Mappings {{{
map q: :q
nnoremap <silent><F3> :call utils#ToggleQuickfixList()<CR>
nnoremap <silent><F4> :call utils#ToggleLocationList()<CR>
nnoremap <silent><F5> :silent! make % <bar> copen <bar> silent redraw!<CR>
nnoremap <silent><F6> :30Lexplore<CR>
nnoremap <F9> :set list!<CR>
nnoremap <F10> :set spell!<CR>
nnoremap <silent><Leader>tn :tabnew<CR>
" Send actual escape character to underlying terminal app, e.g., ipython
tnoremap <C-v><Esc> <Esc>
nnoremap <Leader>w :update<CR>
nnoremap <Leader>k :hide<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>l <C-^>
nnoremap <silent><Leader>n :nohlsearch<CR>
nnoremap <silent><Leader>ev :edit $MYVIMRC<CR>
nnoremap <silent><Leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/'.&ft.'.vim')<CR><CR>
" }}}

"  Abbreviations {{{
inoreabbrev (<CR> (<CR>)<Esc>O
inoreabbrev ({<CR> ({<CR>});<Esc>O
inoreabbrev {<CR> {<CR>}<Esc>O
inoreabbrev {; {<CR>};<Esc>O
inoreabbrev {, {<CR>},<Esc>O
inoreabbrev [<CR> [<CR>]<Esc>O
inoreabbrev [; [<CR>];<Esc>O
inoreabbrev [, [<CR>],<Esc>O
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
" %% in command-line autoexpands to current file's directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" }}}

" Autocommands {{{
autocmd init QuickFixCmdPost [^l]* cwindow
autocmd init QuickFixCmdPost  l* lwindow
autocmd init VimEnter * cwindow
autocmd init BufWritePre /tmp/* setlocal noundofile
autocmd init BufNewFile,BufRead *.txt,*.md,*.adoc setlocal complete+=k

" TODO: move these back to after/ftplugin/foo.vim
augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  autocmd BufNewFile,BufRead *.js,*.jsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  autocmd BufNewFile,BufRead *.ts,*.tsx setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
  autocmd BufNewFile,BufRead *.php setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  autocmd BufNewFile,BufRead *.vim setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END
" }}}

" Commands {{{
" TODO: make this a job() to use async
" TODO: moves these to autoload/utils.vim
command! Todo :silent! vimgrep /\v\CTODO|FIXME|HACK|DEV/ **<CR>
command! LocalTodo :lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! Cd :cd %:h

" Scroll other window shortcut
nnoremap <Esc>j <C-w>p<C-e><C-w>p
nnoremap <Esc>k <C-w>p<C-y><C-w>p
" }}}

" Needed last {{{
rviminfo!
silent! helptags ALL
colorscheme nord
" }}}

