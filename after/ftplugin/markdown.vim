setlocal complete+=k/usr/share/dict/words

" operator-pending mappings for 'last heading'
" so you can do 'clh' to 'change last heading' to delete whatever
" section you are in (header marked with '======...') in this case
" Explained : 
" 'normal' just takes chars and performs whatever action they would do
" as if they were typed in normal mode. 'execute' takes a vim script string
" and performs it as a command. So these are equivalent:
" :execute 'write'
" :write<cr>
" Why pass normal string to execute then? Because normal does not recognize
" special chars (e.g. ?$0) and can't interpret them, but execute does.
"
" Note : this mapping is for markdown headings underscored with 2+ '==' not
" '#' style inline headings
"
" '?^==\\+$ performs backwards search for line beginning with 2+ '==' up to
" EOL
" :nohlsearch just turns off highlighted match
" kvg_ does go up line, visual charwise mode go to last non-blank char of
" current line ('_')
onoremap <buffer> lh :<c-u>execute "normal! ?^==\\+$\r:nohlsearch\rkvg_"<cr>
onoremap <buffer> nh :<c-u>execute "normal! /^==\\+$\r:nohlsearch\rjvg_"<cr>

" for # headings
onoremap <buffer> ih :<c-u>execute "normal! /\v#+<cr>:nohlsearch<cr>WC

