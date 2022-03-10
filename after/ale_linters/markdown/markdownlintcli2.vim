" Author: C.D. MacEachern
" Description: Adds support for markdownlint-cli2 tool

" call ale#Set('markdown_markdownlintcli2_options', '')

" function! ale_linters#markdown#markdownlintcli2#GetCommand(buffer) abort
"     let l:executable = 'markdownlint-cli2'

"     let l:options = ale#Var(a:buffer, 'markdown_markdownlintcli2_options')

"     return ale#Escape(l:executable)
"     \ . (!empty(l:options) ? ' ' . l:options : '') . ' %s'
" endfunction

call ale#linter#Define('markdown', {
\   'name': 'markdownlintcli2',
\   'executable': 'markdownlint-cli2',
\   'lint_file': 1,
\   'output_stream': 'stderr',
\   'command': '%e %s',
\   'callback': 'ale#handlers#markdownlint#Handle'
\})

" Original:
" \   'name': 'markdownlintcli2',
" \   'executable': 'markdownlint-cli2',
" \   'lint_file': 1,
" \   'output_stream': 'stderr',
" \   'callback': 'ale#handlers#markdownlint#Handle'
" \   'command': function('ale_linters#markdown#markdownlintcli2#GetCommand'),
