" ~/vimfiles/filetype.vim -- local filetype.vim autodetection
" Description: User-specific primary filetype definitiions. Vim will use try
" to match here before any other locations such as default $VIM/filetype.vim.
" So to override a default filetype detection mirror the line from
" $VIM/filetype.vim that detects the ft you are targeting and adjust here. Vim
" will find it here first and stop processing filetype.vim files looking for a
" match.

if exists('did_load_filetypes')
  finish
endif

" Line continuation is used here, remove 'C' from 'cpoptions'
let s:cpo_save = &cpo
set cpo&vim

augroup LocalFileTypeDetect
  autocmd!
  autocmd BufNewFile,BufRead *.hdl setfiletype hdl
  autocmd BufNewFile,BufRead *.hbs setfiletype hbs
  autocmd BufNewFile,BufRead .gitignore setfiletype gitignore
augroup END

" Restore 'cpoptions'
let &cpo = s:cpo_save
unlet s:cpo_save
