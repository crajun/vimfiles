" HDL (Hardware Desciption Language) filetype plugin, based on VHDL
" Language:    HDL
" Maintainer:  C.D. MacEachern <craigm@fastmail.com
" Last Modified: 2019-07-25
" Description:  For *.hdl files used during the nand2tetris.org course,
" which are loaded into their Hardware Simulator Java application. Inspired
" by and based on $VIM/ftplugin/vhdl.vim for Verilog HDL filetype plugin.
"
" Based on example HDL files found in Appendix A of 'The Elements of Computing
" Systems', the official course book.
"
" Informal specs:
" * 3 spaces for indent (Characters start on 4th)
" * single space after commas, no whitespace around '=' operator
" * Closing '}' bracket is 0-index aligned, i.e., not indented and alone on
" a new line
"
" 'Intelligence is the faculty of making artificial objects, especially tools
" to make tools'
" -- Henry Bergson (1859-1941)

" Typical Vim script ftplugin boilerplate
" if exists("b:did_ftplugin")
"   finish
" endif
" let b:did_ftplugin = 1
let s:cpo_save = &cpo
set cpo&vim

" Win32/64 can filter files in the browse dialog
if has("gui_win32") && !exists("b:browsefilter")
 let b:browsefilter = "HDL Source Files (*.hdl)"
endif

setlocal cinwords=""
setlocal smartcase
setlocal smartindent
setlocal autoindent
setlocal tabstop=3
setlocal softtabstop=3
setlocal shiftwidth=3
setlocal expandtab
setlocal textwidth=79
setlocal omnifunc=syntaxcomplete#Complete
" setlocal define=
" setlocal include=

" Again, boilerplate and best practices
let &cpo = s:cpo_save
unlet s:cpo_save
