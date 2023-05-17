" https://github.com/junegunn/fzf.vim
"
" Quickref:
" :call fzf#run() => main call that takes a 'spec' dictionary of options
" usually it is called with a fzf#wrap() inside, which takes the 'spec' dict
" like this:
" :call fzf#run(fzf#wrap({'source': 'ls'}))
" The wrap() call just extends/merges the dict with global fzf options and
" returns a new dict
"
" env vars $FZF_DEFAULT_COMMAND and $FZF_DEFAULT_OPTS apply!
" Or you can use :FZF fzf_options path, e.g. :FZF --reverse ~

if !get(g:, 'loaded_fzf') | finish | endif

" bottom style like Ivy
" let g:fzf_layout = { 'down': '20%' }

" full width layout
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

let g:fzf_preview_window = ['right,50%', 'ctrl-o']

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
  \ 'gutter': ['bg', 'Normal'],
  \ 'header':  ['fg', 'Comment'] }

" with this on, c-n/p will cycle history, use c-j/k for up/down as normal
let g:fzf_history_dir = '~/.local/share/fzf-history'

" nnoremap <Leader><Leader> <Cmd>FZF --reverse<CR>
nnoremap <Leader><Leader> <Cmd>call fzf#run(fzf#wrap({'source': 'git ls-files', 'sink': 'e', 'options': ['--reverse']}))<CR>
nnoremap <Leader>b <Cmd>call fzf#run(fzf#wrap({'source': 'ls', 'sink': 'e', 'options': ['--reverse']}))<CR>
nnoremap <Leader>V <Cmd>FZF --reverse $VIMRUNTIME<CR>
nnoremap gO <Cmd>BTags<CR>
nnoremap <Leader>gO <Cmd>Tags<CR>
nnoremap <Leader>/ <Cmd>Rg<CR>
nnoremap <Leader>* :Rg <C-r><C-w><CR>
" TODO: why failing?
" nnoremap <Leader>" <Cmd>call fzf#run(fzf#wrap({'source': 'registers', 'sink': 'p', 'options': ['--reverse']}))<CR>
nnoremap <Leader><F1> <Cmd>Helptags<CR>

function! s:build_quickfix_list(lines) abort
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit'
\}

