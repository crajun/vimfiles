" viking.vim
"
" 	One's own house is best,
" 	small though it be;
" 	at home is every one his own master.
" 	Though he but two goats possess,
" 	and a straw-thatched cot,
" 	even that is better than begging.

" Functions {{{1

function! SynGroup() abort
	" Outputs both the name of the syntax group, AND the translated syntax
	" group of the character the cursor is on.
	" line('.') and col('.') return the current position
	" synID(...) returns a numeric syntax ID
	" synIDtrans(l:s) translates the numeric syntax id l:s by following highlight links
	" synIDattr(l:s, 'name') returns the name corresponding to the numeric syntax ID
	" example output:
	" vimMapModKey -> Special
	let l:s = synID(line('.'), col('.'), 1)
	echo synIDattr(l:s, 'name') .. ' -> ' .. synIDattr(synIDtrans(l:s), 'name')
endfunction

" Commands {{{1

" Purpose: Redirect almost any internal or external command to a scratch buffer.
" Usage: :Redir scriptnames, :Redir version, :Redir !ls -la, :Redir !uname -a
command! -nargs=1 -complete=command -bar -range Redir silent call viking#commands#Redir(<q-args>, <range>, <line1>, <line2>)

" Purpose: Show an overview of built-in Vim functions grouped by type.
" Usage: :Api
command! Api :help list-functions<CR>

" Purpose: Open quickfix with list of files different than on given branch.
" Usage: GitChanged master
command! -complete=customlist,Gitbranches -nargs=1 -bar GitChanged call setqflist(map(systemlist("git diff --name-only $(git merge-base HEAD <args>)"), '{"filename": v:val, "lnum": 1}')) | copen
function! Gitbranches(ArgLead, CmdLine, CursorPos) abort
	return systemlist('git branch')
endfunction

" Autocmds {{{1
augroup Viking
    autocmd!
    autocmd BufNewFile,BufWritePre * :call viking#commands#EnsureDirExists()
augroup END

" Mappings {{{1

" Command-line {{{2
cnoremap <expr> <CR> viking#commands#CCR()
" Change Vim :pwd to directory containing current buffer
command! Cd :tcd %:h
" Copy `:help arglist` files to a quickfix list and open quickfix list
command! -bar ArglistToQuickfix call setqflist(map(argv(-1), '{"filename": v:val}')) <Bar> copen
" Add todos et al. from current buffer to location list and open it 
command! -bar TodoLocal :botright silent! lvimgrep /\v\CTODO|FIXME|HACK|DEV/ %<CR> <Bar> lopen
" Same as above but for every file in current working directory
command! -bar Todo :botright silent! vimgrep /\v\CTODO|FIXME|HACK|DEV/ *<CR> <Bar> copen

" Help mappings {{{2
nnoremap <F1><F1> <cmd>helphelp<CR>
nnoremap <F1>f <cmd>Api<CR>
nnoremap <F1>u <cmd>help usr_42.txt<CR>
nnoremap <F1>o <cmd>help option-list<CR>
nnoremap <F1>9 <cmd>help vim9<CR>
nnoremap <F1>e <cmd>help eval.txt<CR>
nnoremap <F1>l <cmd>help lambda<CR>

" Editing {{{2

" Jump to column of mark rather than first non-blank character in the line
nnoremap ' `



" vim: fdm=marker noet sw=2 sts=-1 ts=2 tw=80
