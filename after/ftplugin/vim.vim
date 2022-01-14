setlocal expandtab
setlocal shiftwidth=2
setlocal softtabstop=2
setlocal textwidth=80
setlocal foldmethod=indent
" create 1 fold inside a function/endfunction, no more
setlocal foldnestmax=1
setlocal foldlevel=0

setlocal cinwords+=function!
setlocal cinwords+=abort
setlocal cinwords+=augroup
setlocal suffixesadd=.vim

compiler vint
let &l:define = '\C^command\|^function'

" matches search (i.e. '/') string: call\s\+\zs\a\+#\a\+
setlocal include=call\\s\\+\\zs\\a\\+#\\a\\+

function! VimInclude(fname) abort
  " Assumes that :call [...] must have a '#' in it to be an autoload call
  " location that we can jump to, otherwise it could be builtin function like,
  " ':call feedkeys('abc')' or calling script local like ':call
  " MyFunction(args)'.
  "
  " LIMITATIONS:
  " * Currently limited to only parsing the first found foo#bar on a line, how
  " to get around this is complicated and would need to parse where cursor was
  " and more to figure out which jump we are trying to make.
  " * if the folder name has '.vim' in it the gf command gets confused, for
  " example fzf folder is called 'fzf.vim' so it tries to edit that and just
  " open netrw at that directory when we really wanted fzf.vim/plugin/fzf.vim
  " to open. This is harcoded gf behaviour, the only way around this is remap
  " gf to my own Gf() function to only consider filenames jumpable and ignore
  " directories with the same name as the file.
  " 
  " call feedkeys('ials')
  " call setqflist(map(copy(a:lines), '{ "filename": v:val }')) 
  " call utils#ToggleQuickfixList
  " call utils#nonexistantfunction
  " call utils#nestedfolder#foobar#Function
  "
  " FAILS:
  "
  " call fzf#run(fzf#wrap(
  "                   ^ (cursor here)
  " would only pickup fzf#run
  if a:fname ==# ''
    echom 'VimInclude a:fname value was empty string.'
    return
  endif
  " echom 'Include sees filename as : ' .. a:fname
  let l:splitpath = split(a:fname, '#')
  " echom 'splitpath on # char gives us: 0 index of ' .. l:splitpath[0] .. ' and 1 index of: ' .. l:splitpath[1]
  return l:splitpath[0]
endfunction

" Provided v:fname will be the filename detected by 'include' regex 
setlocal includeexpr=VimInclude(v:fname)
