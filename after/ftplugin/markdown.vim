setlocal complete+=k/usr/share/dict/words

" Match next and previous e.g., '### Title'
onoremap <buffer> nh :<C-u>normal! /^#\+.*$
onoremap <buffer> lh :<C-u>normal! ?^#\+.*$
onoremap <buffer> ih :<C-U>normal! /^#\+.*$

