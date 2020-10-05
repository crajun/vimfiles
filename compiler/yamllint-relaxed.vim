" yamllint compiler for .yml/.yaml files
" Last Modified: 2020-04-22
" Author: C.D. MacEachern <craigm@fastmail.com>

if exists('current_compiler')
  finish
endif
let current_compiler = 'yamllint-relaxed'

if exists(':CompilerSet') != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=yamllint\ -d\ relaxed\ -f\ parsable
CompilerSet errorformat=%f:%l:%c:%m
