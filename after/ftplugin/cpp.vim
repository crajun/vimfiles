" after/ftpluin/cpp.vim -- Local options for C++
" overwriting/adjust defaults in $VIMRUNTIME/ftplugin/c.vim
"
" ctags (Universal ctags) tweak for c++ files:
" $ ctags -R --c++-kinds=+p --fields=+iaS --extras=+q --language-force=C++ .
" Run from top of project dir.

let s:cpo_save = &cpo
set cpo-=C

" Include macros in completion
setlocal complete+=d

" Set include pattern
setlocal include=^\\s*#\\s*include
setlocal fdm=syntax

" If ft changed will .cpp buffer open
let b:undo_ftplugin = "setl cpt< inc<"

let &cpo = s:cpo_save
unlet s:cpo_save
