" after/ftplugin/rust.vim 
" Local Rust options/overriding $VIMRUNTIME/ftplugin/rust.vim defaults

" set makeprg to 'rustc' instead of 'rustc %' because I use
" mapping of <F5> to ':make %<CR>' which passes ends up passing
" '%' twice when this is set to 0.
let g:rustc_makeprg_no_percent = 1

" run rustfmt on save automatically, populates location list
let g:rustfmt_autosave = 1

" Mappings
nnoremap <buffer> <Localleader>r :RustRun<CR>


