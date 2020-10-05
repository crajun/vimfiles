" Vim 8.0+ plugin to toggle a terminal, the way VS Code does it.
" Last Modified: 2020-04-07
" Maintainer: C.D. MacEachern <craigm@fastmail.com>
" License: This file is placed in the public domain.

" TODO: enable at release
" Reload guard
" if exists("g:loaded_vim_termtoggle")
"   finish
" endif
" let g:loaded_vim_termtoggle = 1

" Requirement guard
if !has('terminal')
  echom "vim-termtoggle requires +terminal feature, check :version"
  finish
endif

" Compatibility boilerplate
let s:save_cpo = &cpo
set cpo&vim

" Default keybinding and remappings to call actual function
if !hasmapto('<Plug>ToggleTerminal') && !exists("no_plugin_maps")
 map <unique> <Leader>z <Plug>ToggleTerminal
endif
noremap <unique> <script> <Plug>ToggleTerminal <SID>ToggleTerminal
noremap <SID>ToggleTerminal :call <SID>ToggleTerminal()<CR>

function! s:ToggleTerminal()
  " 1. Get list of buffers
  " 2. Check if buffer of terminal type exists
  " 3. Open term buffer on bottom if it does
  " 4. Otherwise open new term buffer on bottom
  " 5. Profit.
  " IDEA: Use a g:buffer_termtoggle check to switch
  " to that buffer?
  " IDEA: if no global buffer no exists start term
  " which returns buffer number and set that to the
  " global
  let buf_term = 0

  if (g:termtoggle_shell_buffer)
   " Bring that buffer no into a new window on bottom
  else
    " Start a new term using term_start({cmd} [, {options}])
    " which returns buffer
  endif

  echom "Terminal number is " . g:termtoggle_shell_buffer

endfunction



" Compatibility boilerplate
let &cpo = s:save_cpo
unlet s:save_cpo

