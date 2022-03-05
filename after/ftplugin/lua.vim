setlocal suffixesadd=.lua
setlocal noexpandtab
setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=-1
" turn '.' into '/'
setlocal includeexpr=substitute(v:fname,'\\.','/','g')
