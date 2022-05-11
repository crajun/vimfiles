" autoload/viking/editing.vim
"
" Functions that transform the buffer text (or non-text, for example,
" whitespaces) in some way

function! viking#StripTrailingWhitespaces() abort
	" Don't touch binary files or diff files
	if !&binary && &filetype !=# 'diff'
		let _s=@
		%s/\s\+$//e
		" restore last search to last search register, ignore above one
		let @/=_s
	endif
endfunction


