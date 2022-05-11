" autoload/viking/visuals.vim
"
" Functions related to visuals of the editor/buffer, like a function to show the
" syntax groups under the cursor.

function! viking#visuals#SynGroup() abort
	" Outputs both the name of the syntax group, AND the translated syntax
	" group of the character the cursor is on.
	" line('.') and col('.') return the current position
	" synID(...) returns a numeric syntax ID
	" synIDtrans(l:s) translates the numeric syntax id l:s by following highlight links
	" synIDattr(l:s, 'name') returns the name corresponding to the numeric syntax ID
	" example output:
	" vimMapModKey -> Special
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') .. ' -> ' .. synIDattr(synIDtrans(l:s), 'name')
endfunction

" vim: fdm=indent

