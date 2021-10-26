" vim: fdm=marker nowrap ft=vim et sts=2 ts=2 sw=2 fdl=0

" Bare-basics {{{
unlet! skip_defaults_vim
source $VIMRUNTIME/defaults.vim
" Needed to accept UTF-8 characters I use in this file.
set encoding=utf-8
scriptencoding utf-8
let mapleader=' '
" }}}

" Plugin Settings {{{
" FZF
nnoremap <C-p> :GFiles<CR>
" For displaying everything, ignoring gitignores, relying on
" $FZF_DEFAULT_COMMAND, and starting directory of current buffer
nnoremap <Leader>e :FZF %:h<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>/ :BLines<CR>
nnoremap <Leader>r :Rg<CR>
nnoremap <Leader>c :FZFCd ~/git<CR>
" Start in home directory
nnoremap <Leader>C :FZFCd!<CR>
command! -bang -bar -nargs=? -complete=dir FZFCd
    \ call fzf#run(fzf#wrap(
    \ {'source': 'find '.( empty("<args>") ? ( <bang>0 ? "~" : "." ) : "<args>" ) .' -type d',
    \ 'sink': 'cd'}))
" Function used to populate Quickfix with selected lines.
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }
" Layout of fzf UI
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.4 } }
" Default toggle preview window key of <C-/> is not widely supported on terminal
" emulators. Also it slows things down. Off.
let g:fzf_preview_window = []
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Lightline, requires vim-gitbranch and vim-fugitive plugins.
" Trim mode names down to single character to save space for long git branches
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'mode_map': {
        \ 'n' : 'N',
        \ 'i' : 'I',
        \ 'R' : 'R',
        \ 'v' : 'V',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ }
" }}}

" Settings {{{
" Experimental: used for better FZF git ls-files support
set autochdir
set autoindent autoread belloff=all clipboard=unnamed,unnamedplus
set completeopt=menuone,popup nocursorline foldlevelstart=99 hidden hlsearch
if executable('rg')
  set grepprg=rg\ --vimgrep
endif
set laststatus=2 listchars=space:·,trail:·
set modeline noswapfile nowrap number relativenumber
set shortmess+=c showcmd showmatch noshowmode signcolumn=yes
set ignorecase smartcase thesaurus=~/.vim/thesaurus/english.txt
set undofile undodir=~/.vim/undodir
if exists('+termguicolors')
  " https://github.com/tmux/tmux/issues/1246
  " Without 2 t_8x lines below termguicolors doesn't work.
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
" }}}

" Mappings {{{
" Re-select visually selected area after indenting/dedenting.
xmap < <gv
xmap > >gv

" Move visual selection up/down lines.
xnoremap J :m '>+1<CR>gv=gv
xnoremap K :m '<-2<CR>gv=gv

" '%%' in command-line mode maybe expands to path of current buffer.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Function keys
nnoremap <silent><F3> :call utils#ToggleQuickfixList()<CR>
nnoremap <F4> :call utils#ToggleLocationList()<CR>
nnoremap <F6> :15Lexplore<CR>
nnoremap <F9> :set list!<CR>
nnoremap <F10> :set spell!<CR>

" iTerm2
nnoremap j <C-w>p<C-e><C-w>p
nnoremap k <C-w>p<C-y><C-w>p
nnoremap J <C-w>p<C-d><C-w>p
nnoremap K <C-w>p<C-u><C-w>p

" Leader keys
nnoremap <Leader>w :update<CR>
nnoremap <Leader>q :bdelete<CR>
nnoremap <Leader>, :edit $MYVIMRC<CR>
nnoremap <Leader>ft :e <C-R>=expand('~/.vim/after/ftplugin/'.&ft.'.vim')<CR><CR>
nnoremap <Leader>n :<C-u>nohl<CR>
nnoremap <Leader><Leader> :b #<CR>

" Vimdiff
nnoremap gh :diffget //2<CR>
nnoremap gl :diffget //3<CR>
tnoremap <C-v><Esc> <Esc>

" Getting Help Easier
nnoremap <F1>f :help list-functions<CR>
nnoremap <F1>k :help keycodes<CR>
nnoremap <F1><F1> :help<CR>
nnoremap <F1>m :help user-manual<CR>

nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>

" }}}

" Commands {{{
command! Api :help list-functions<CR>
command! Cd :cd %:h
command! TodoLocal :botright lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR>
command! Todo :botright silent! vimgrep /\v\CTODO|FIXME|HACK|DEV/ *<CR>
" }}}

" Autocmd {{{
augroup vimrc
  autocmd!
augroup END

autocmd vimrc BufNewFile,BufRead *.txt,*.md setlocal complete+=k spell
autocmd vimrc BufWinEnter */doc/*.txt setlocal nonumber norelativenumber
" Require 'nested' to fix https://github.com/itchyny/lightline.vim/issues/102
autocmd vimrc BufWritePost $MYVIMRC nested source $MYVIMRC
autocmd vimrc BufWritePre /tmp/* setlocal noundofile
autocmd vimrc FileType help setlocal nospell
autocmd vimrc FileType liquid setlocal list

" Quickfix/Location List
autocmd vimrc FileType * if &ft ==# 'qf' | setlocal nonu nornu | endif
autocmd vimrc QuickFixCmdPost [^l]* cwindow
autocmd vimrc QuickFixCmdPost  l* lwindow
autocmd vimrc VimEnter * cwindow

" Add comment highlighting support for 'JSONC' (JSON w/ comments)
autocmd vimrc FileType json syntax match Comment +\/\/.\+$+

" To capture release-notes.md and migration-notes.md which are snippet files
" \V = only \ and / or ? have special meaning (very nomagic)
" \v = all ASCII except _, 0-9, a-z, A-Z have special meaning (very magic)
autocmd vimrc BufNewFile,BufRead *.markdown,*.mkd,*.mkdn,*.md
      \ if getline(1) =~# "^We\.re excited" |
      \   let b:liquid_subtype = 'markdown' |
      \   set ft=liquid |
      \ elseif getline(1) =~# "^\\d.\\d\\d is the first generally" |
      \   let b:liquid_subtype = 'markdown' |
      \   set ft=liquid | 
      \ endif
" }}}

" Colorscheme and Syntax {{{
" lifepillar/vim-solarized8
set background=light
colorscheme solarized8_high
" https://ethanschoonover.com/solarized/#the-values
" For colouring 'nbsp', 'tab', and 'trail'
" original guifg=#657b83
highlight! SpecialKey guibg=#fdf6e3

" Use same bg as LineNr to blend all together
highlight! SignColumn guibg=#eee8d5
highlight! GitGutterAdd guibg=#eee8d5
highlight! GitGutterChange guibg=#eee8d5
highlight! GitGutterDelete guibg=#eee8d5

" Display hightlighting groups of thing under cursor
map <F11> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
"}}}

" TODO:

