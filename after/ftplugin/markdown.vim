" use 'dictionary' value for words
setlocal complete+=k
setlocal foldlevel=99
setlocal suffixesadd=.md
setlocal list
setlocal expandtab

" TODO: could be made more robust to support other style Mardown headings
let &l:define = '\v^#+\s*.+$'

nnoremap <buffer> gf :call utils#LiquidInclude()<CR>

" MATCHES:
" 1. {% include {{ page.version }}/snippets/target-platform-before-start.md %}
" 2. ({{ page.version }}/rn/develop/focus-management/#why-we-need-focus)
" 3. (../linux/)
"
" SEARCH PATTERN:
" /{{\s*page.version\s*}}\zs\/[^\.\)]\+\|\.\.\zs\/[^\.\)]\+
setlocal include={{\\s*page.version\\s*}}\\zs\\/[^\\.\\)]\\+\\\|\\.\\.\\zs\\/[^\\.\\)]\\+


" TODO: this might just need to be delete now that I don't use
" &ft = liquid anymore and just use vim-markdown plugin
" tagbar plugin support
" Used ':TagbarGetTypeConfig markdown' to dump dict for markdown
" and then just changed 'markdown' to 'liquid' to use the same for ft=liquid
" let g:tagbar_type_liquid = {
"     \ 'kinds' : [
"         \ 'c:chapter',
"         \ 's:section',
"         \ 'S:subsection',
"         \ 't:subsubsection',
"         \ 'T:l3subsection',
"         \ 'u:l4subsection',
"         \ '?:unknown',
"     \ ],
" \ }
