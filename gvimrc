" GUI specific settings for Vim 8+

" Turn off alt-{key} being used for menus allowing bindings on alt in GUI
" If you want to bind Alt-key for a menu use e.g., :simalt f<CR> for Alt-f
" F10 will still be menu key, unless bound by user.
set winaltkeys=no
set belloff=all
" set guifont=BlexMono\ Nerd\ Font\ Mono:h18
set guifont=Iosevka:h18

" In Windows, don't run popup cmd.exe for external commands,
" use :term instead. See :h gui-shell-win32
set guioptions+=!
" Use console dialogs instead of native ones for simple choices
set guioptions+=c
" Use Vim icon in top-left corner on GTK/Windows in upper-left corner
set guioptions+=i
" set Vim as owner of global selection ("*) on visual mode start or extend
" With this, a mouse select copies to system clipboard automatically
set guioptions+=a

" Turn off toolbars, scrollbars, and native tabs
set guioptions-=t
set guioptions-=T
set guioptions-=r
set guioptions-=L
set guioptions-=b
set guioptions-=e

" ==============
" :h gui_mac.txt
" ==============
" Dimensions for macOS window default
set lines=59
set columns=239
" cd to directory of this file, macvim sets 'cd' to ~ by default
" Macvim you can drop and drop bunch of files onto app icon
" and it opens each of them in new tabs, so bump this up from 10
set tabpagemax=100
if has('gui_macvim') && has('gui_running')
	call chdir(fnameescape(expand("~/.vim")))
  " Under macvim gui make sure that .zprofile is linked to .zshrc, otherwise
  " you'll only get /etc/zprofile sourced and just have default macOS paths
  nnoremap <F12> :set fullscreen!<CR>
  set macmeta
	set macthinstrokes
	" when using vim things like !=# get mangled, just live without it
	set nomacligatures
  nnoremap <M-J> <C-w>p<C-d><C-w>p
  nnoremap <M-K> <C-w>p<C-u><C-w>p
	" always run it as a login shell, to mimic starting Terminal.app
	set shell=/bin/zsh\ -l
	" setting this triggers sourcing of /etc/zshrc_Apple_Terminal which provides
	" OSC 7 escape code emitting, so that :h autoshelldir works in GUI :term,
	" because by default the :term does not set $TERM_PROGRAM, and so the
	" /etc/zshrc check for /etc/zshrc_$TERM_PROGRAM never sources bc it's an empty
	" string
	" let $TERM_PROGRAM='Apple_Terminal'
	" BUG: I can't just call bare :term <command>, see ~/.vim/errata/macvim.md 
endif
