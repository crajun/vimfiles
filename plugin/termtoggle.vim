" toggle a terminal buffer
"
let g:term_toggle_bufnr = 0
let g:term_toggle_winnr = 0
let g:term_toggle_cmd = "/bin/zsh"
let g:term_toggle_size = 10


" TODO: move to absolute bottom of the screen, for example if you are currently
" in middle of 3 :split buffers, do winmove to furthest down you can go to open
" it there, rather than opening between 2 and 3 buffers.
function! TermToggle() abort
  " TODO: consider tabpage we are in. Per tabpage term buffers (1 per tabpage)
  if win_gotoid(g:term_toggle_winnr) " term buf in a window, hide the buf
    let g:term_toggle_size = winheight(0)
    " TODO: How to account for 'hidden' variable variations that affect 'close'
    close " hide the buffer
  else " no term in a window, try to fetch existing buffer first or create one for a new terminal 
    try
      execute "sbuffer " .. g:term_toggle_bufnr
      execute "resize " .. g:term_toggle_size
    catch
      execute "terminal ++close ++rows="..g:term_toggle_size.." "..g:term_toggle_cmd
      let g:term_toggle_bufnr = bufnr()
    endtry
    startinsert! " I do this in terminal open autocmd anyway but no harm
    let g:term_toggle_winnr = win_getid()  " set new winnr for new term
    let g:term_toggle_size = winheight(0)  " save new toggle size
  endif
endfunction

if has('gui_running')
  nnoremap <silent> <M-`> :call TermToggle()<CR>
  tnoremap <silent> <M-`> <C-w>:call TermToggle()<CR>
else
  nnoremap <silent> ` :call TermToggle()<CR>
  tnoremap <silent> ` <C-w>:call TermToggle()<CR>
endif


