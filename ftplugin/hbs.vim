" *.hbs filetype detection plugin. Template file for HTML
" Language:    HBS
" Maintainer:  C.D. MacEachern <craigm@fastmail.com
" Last Modified: 2020-04-22
" Description: HBS files are HTML templates aka Handlebars file.

let s:cpo_save = &cpo
set cpo&vim

" Win32/64 can filter files in the browse dialog
if has('gui_win32') && !exists('b:browsefilter')
 let b:browsefilter = 'HBS (Handlebars) Source Files (*.hbs)'
endif

setlocal filetype=html

let &cpo = s:cpo_save
unlet s:cpo_save

