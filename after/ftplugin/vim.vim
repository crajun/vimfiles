setlocal noexpandtab
setlocal shiftwidth=2
setlocal softtabstop=-1 | " use same value of shiftwidth
setlocal tabstop=2
setlocal textwidth=80
setlocal foldmethod=indent
" create 1 fold inside a function/endfunction, no more
setlocal foldnestmax=1
setlocal foldlevel=0
setlocal suffixesadd=.vim

compiler vint
let &l:define = '\C^command\|^function'
