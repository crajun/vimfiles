" Author: C.D. MacEachern <craigm@fastmail.com> vim 8.0+ config file.
" Local overrides for python detected filetypes
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab

" Added in https://github.com/tpict/vim-ftplugin-python/pull/13
setlocal define=^\\s*\\(def\\\|class\\)

" From vimconf 2019 talk:
" https://www.youtube.com/watch?v=Gs1VDYnS-Ac
" Setup :i{jump,search,*} with better patterns

  " StackOverflow reference:
  " https://stackoverflow.com/a/52638888
  " Requires Python 3.2+ with sysconfig module, works cross-platform to
  " give us 'purelib' paths (mostly what user is interested in). See SO
  " for breakdown of various paths used by python (8 of them, most irrelevant
  " to end user, who just want to jump to pip installed stuff in or out
  " of a virtual environment). Of course venv must be enabled before starting
  " Vim or some other means to pick up venv paths.
if !exists('g:python_path')
  silent let g:python_path = system('python3 -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())"')
  " Need execute here to work by evaluating g:python_path not
  " as a string but as a expression resulting in the value we set, and
  " then concatenating it to our string, THEN running it all as an ex command
  execute "setlocal path+=" . g:python_path
endif
