" Author: C.D. MacEachern <craigm@fastmail.com> vim 8.0+ config file.
"
" Local overrides for python detected filetypes
"
" This is currently not working, flags wrong?
" compiler pylint


" TODO: use ':checkpath!' in files to see what ones we
" can/can't resolve

" Set by $VIMRUNTIME/ftplugin/python.vim
" setlocal include=^\\s*\\(from\\\|import\\)
" This one needs work. It does not detect 'from .config import Config'
" correctly.
" setlocal includeexpr=substitute(v:fname,'\\.','/','g')

" tpope/vim-apathy/after/ftplugin/python_apathy.vim
" adds correct paths from active python interpreter, and
" adds better suffixes, but doesn't add define or
" makeprg, so we add those extra on here
setlocal define=^\\s*\\(def\\\|class\\)
compiler pylint

" This is set in $VIMRUNTIME/ftplugin/python.vim but it is due
" to change with PR #14
setlocal expandtab
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=0
